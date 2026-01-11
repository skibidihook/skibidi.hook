setfpscap(0)

if getgenv().skibidi_hook_loaded then
    return
else
    getgenv().skibidi_hook_loaded = true
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")

local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local Settings = {
    Ragebot = true,
    Manipulation = true,
    ManipulationRange = 10,
    Prediction = true,
    Fov = 360,
    MinDamage = 80,
    HitChance = 100,
    BAim = false,
    PrioritizeHead = true,
    PrioritizeLegs = false,
    BodyParts = {
        Head = 4,
        UpperTorso = 1,
        LowerTorso = 1,
        ["LeftUpperLeg"] = 0.6,
        ["RightUpperLeg"] = 0.6,
        HumanoidRootPart = 1
    },
    AlwaysCrouch = false,
    CrouchWalkAnimId = "rbxassetid://124458965304788",
}

local Peek = {
    Marker = nil,
    Position = nil,
    MaxDistance = 15,
    Storing = true,
}

local Speed = false
local SpeedAmount = 30
local Bhop = false

local Rand = Random.new()

local Offsets = {
    Vector3.new(0, 0.3, 0),
    Vector3.new(0, -0.3, 0),
    Vector3.new(0.3, 0, 0),
    Vector3.new(-0.3, 0, 0),
    Vector3.new(0, 0, 0.3),
    Vector3.new(0, 0, -0.3),
}

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude
RayParams.IgnoreWater = true

local RayIgnore = table.create(1)

local function GetToolComponents()
    local Character = LocalPlayer.Character
    if not Character then return end

    local Tool = Character:FindFirstChildOfClass("Tool")
    if not Tool then return end

    local Remotes = Tool:FindFirstChild("Remotes")
    if not Remotes then return end
    return {
        Tool = Tool,
        FireShot = Remotes:FindFirstChild("FireShot"),
        Reload = Remotes:FindFirstChild("Reload"),
        Handle = Tool:FindFirstChild("Handle")
    }
end

local function CanPenetrate(Part)
    if not Part or not Part:IsA("BasePart") then return false end
    if Part.Transparency > 0.2 or not Part.CanCollide then return true end
    if Part:IsA("Decal") or Part:IsA("ParticleEmitter") or Part:IsA("Beam") or Part:IsA("Trail") then return true end
    return false
end

local function IsCharacterPart(Part)
    if not Part or not Part:IsA("BasePart") then return false end
    local P = Part.Parent
    if not P then return false end
    if P:FindFirstChild("Humanoid") then return true end
    if P:IsA("Accessory") or P:IsA("Hat") then return true end
    return false
end

local function Prediction(part, ping, dt)
    local par = part.Parent
    local hrp = par and par:FindFirstChild("HumanoidRootPart")
    local old = hrp and hrp:FindFirstChild("OldPosition")
    if not (hrp and old) then
        return part.Position
    end

    dt = math.max(dt or 0, 1/240)

    local pingSeconds = ping or 0
    if pingSeconds > 1 then
        pingSeconds = pingSeconds / 1000
    end
    pingSeconds = math.clamp(pingSeconds, 0, 0.35)

    local hPos = hrp.Position
    local oldPos = old.Value

    local vel = (hPos - oldPos) / dt
    if vel.Magnitude < 0.1 then
        return part.Position
    end
    local yScale = 0.6
    vel = Vector3.new(vel.X, vel.Y * yScale, vel.Z)

    return part.Position + vel * pingSeconds
end

local function CheckMinDamage(Part, Distance)
    local Base = 54 * (Settings.BodyParts[Part.Name] or 0.5)
    if Distance > 300 then Base = Base * 0.3
    elseif Distance > 200 then Base = Base * 0.5
    elseif Distance > 100 then Base = Base * 0.8 end
    return math.floor(Base) >= Settings.MinDamage
end

local function CheckHitChance()
    local Hc = Settings.HitChance
    if Hc >= 100 then return true end
    if Hc <= 0 then return false end
    return Rand:NextInteger(1, 100) <= Hc
end

local function StrictWallCheck(StartPos, EndPos, MyChar, TargetChar)
    if typeof(StartPos) ~= "Vector3" or typeof(EndPos) ~= "Vector3" then
        return false
    end
    if not (MyChar and TargetChar) then
        return false
    end
    RayIgnore[1] = MyChar
    RayParams.FilterDescendantsInstances = RayIgnore

    local CurStart = StartPos
    local MaxHops = 12

    for _ = 1, MaxHops do
        local Dir = EndPos - CurStart
        local Mag = Dir.Magnitude

        if Mag < 0.1 then
            return true
        end
        if Mag > 5000 then
            return false
        end
        local hit = Workspace:Raycast(CurStart, Dir, RayParams)
        if not hit then
            return true
        end

        local inst = hit.Instance
        if not inst then
            return true
        end
        if inst:IsDescendantOf(TargetChar) then
            return true
        end
        if CanPenetrate(inst) or IsCharacterPart(inst) then
            CurStart = hit.Position + Dir.Unit * 0.15
        else
            return false
        end
    end

    return false
end

local function MultiPointWallCheck(StartPos, EndPos, MyChar, TargetChar)
    if not (StartPos and EndPos and MyChar and TargetChar) then
        return false
    end

    if StrictWallCheck(StartPos, EndPos, MyChar, TargetChar) then
        return true
    end

    for i = 1, #Offsets do
        if StrictWallCheck(StartPos, EndPos + Offsets[i], MyChar, TargetChar) then
            return true
        end
    end

    return false
end

local function GetBestTarget(Ping, Dt)
    local MyChar = LocalPlayer.Character
    if not MyChar then return nil end

    local MyHead = MyChar:FindFirstChild("Head")
    if not MyHead then return nil end
    local MyHeadPos = MyHead.Position

    local Cam = Camera
    local CamPos = Cam.CFrame.Position
    local Vp = Cam.ViewportSize
    local Cx, Cy = Vp.X * 0.5, Vp.Y * 0.5

    local Fov = Settings.Fov
    local DoFov = Fov < 360
    local Fov2 = Fov * Fov

    local DoPred = Settings.Prediction
    local DoHead = Settings.PrioritizeHead
    local DoTorso = Settings.BAim
    local DoLegs = Settings.PrioritizeLegs

    local BestPart, BestPlayer, BestScore = nil, nil, math.huge

    local LpTeam = LocalPlayer.Team

    for _, TargPlr in ipairs(Players:GetPlayers()) do
        if TargPlr ~= LocalPlayer then
            local TargTeam = TargPlr.Team
            if LpTeam and TargTeam and TargTeam == LpTeam then
                continue
            end

            local Char = TargPlr.Character
            if not Char then
                continue
            end

            local Hum = Char:FindFirstChild("Humanoid")
            if not Hum or Hum.Health <= 0 then
                continue
            end

            local Root = Char:FindFirstChild("HumanoidRootPart")
            if not Root then
                continue
            end

            local RootPos = Root.Position
            local Distance = (RootPos - CamPos).Magnitude

            local Head = DoHead and Char:FindFirstChild("Head") or nil
            local Torso = nil
            if DoTorso then
                Torso = Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
            end
            local Leg = nil
            if DoLegs then
                Leg = Char:FindFirstChild("LeftUpperLeg") or Char:FindFirstChild("RightUpperLeg")
            end
            if Head then
                local PartPos = DoPred and Prediction(Head, Ping, Dt) or Head.Position
                local View, OnScreen = Cam:WorldToViewportPoint(PartPos)
                if OnScreen then
                    local Dx, Dy = View.X - Cx, View.Y - Cy
                    if (not DoFov) or (Dx*Dx + Dy*Dy <= Fov2) then
                        if MultiPointWallCheck(MyHeadPos, PartPos, MyChar, Char) and CheckMinDamage(Head, Distance) then
                            local Score = (Dx*Dx + Dy*Dy) * 1
                            if Score < BestScore then
                                BestScore = Score
                                BestPlayer = TargPlr
                                BestPart = Head
                            end
                        end
                    end
                end
            end
            if Torso then
                local PartPos = DoPred and Prediction(Torso, Ping, Dt) or Torso.Position
                local View, OnScreen = Cam:WorldToViewportPoint(PartPos)
                if OnScreen then
                    local Dx, Dy = View.X - Cx, View.Y - Cy
                    if (not DoFov) or (Dx*Dx + Dy*Dy <= Fov2) then
                        if MultiPointWallCheck(MyHeadPos, PartPos, MyChar, Char) and CheckMinDamage(Torso, Distance) then
                            local Score = (Dx*Dx + Dy*Dy) * 2
                            if Score < BestScore then
                                BestScore = Score
                                BestPlayer = TargPlr
                                BestPart = Torso
                            end
                        end
                    end
                end
            end
            if Leg then
                local PartPos = DoPred and Prediction(Leg, Ping, Dt) or Leg.Position
                local View, OnScreen = Cam:WorldToViewportPoint(PartPos)
                if OnScreen then
                    local Dx, Dy = View.X - Cx, View.Y - Cy
                    if (not DoFov) or (Dx*Dx + Dy*Dy <= Fov2) then
                        if MultiPointWallCheck(MyHeadPos, PartPos, MyChar, Char) and CheckMinDamage(Leg, Distance) then
                            local Score = (Dx*Dx + Dy*Dy) * 3
                            if Score < BestScore then
                                BestScore = Score
                                BestPlayer = TargPlr
                                BestPart = Leg
                            end
                        end
                    end
                end
            end
            do
                local PartPos = DoPred and Prediction(Root, Ping, Dt) or RootPos
                local View, OnScreen = Cam:WorldToViewportPoint(PartPos)
                if OnScreen then
                    local Dx, Dy = View.X - Cx, View.Y - Cy
                    if (not DoFov) or (Dx*Dx + Dy*Dy <= Fov2) then
                        if MultiPointWallCheck(MyHeadPos, PartPos, MyChar, Char) and CheckMinDamage(Root, Distance) then
                            local Score = (Dx*Dx + Dy*Dy) * 4
                            if Score < BestScore then
                                BestScore = Score
                                BestPlayer = TargPlr
                                BestPart = Root
                            end
                        end
                    end
                end
            end
        end
    end

    return BestPlayer, BestPart
end

local vectors = {
    Vector3.zero, -- none
    Vector3.new(1, 0, 0), -- big right
    Vector3.new(-1, 0, 0), -- big left
    Vector3.new(0, 0, 1), -- big forward
    Vector3.new(0, 0, -1), -- big backward
    Vector3.new(0, 1, 0), -- big up
    Vector3.new(0, -1, 0), -- big down
    
    Vector3.new(1 / 2, 0, 0), -- small right
    Vector3.new(-1 / 2, 0, 0), -- small left
    Vector3.new(0, 0, 1 / 2), -- small forward
    Vector3.new(0, 0, -1 / 2), -- small backward
    Vector3.new(0, 1 / 2, 0), -- small up
    Vector3.new(0, -1 / 2, 0), -- small down

    Vector3.new(1 / 2, 1 / 2, 0), -- small right up
    Vector3.new(1 / 2, -1 / 2, 0), -- small right down
    Vector3.new(-1 / 2, 1 / 2, 0), -- small left up
    Vector3.new(-1 / 2, -1 / 2, 0), -- small left down
    Vector3.new(0, 1 / 2, 1 / 2), -- small forward up
    Vector3.new(0, -1 / 2, 1 / 2), -- small forward down
    Vector3.new(0, 1 / 2, -1 / 2), -- small backward up
    Vector3.new(0, -1 / 2, -1 / 2), -- small backward down
}

local function GetManipPos(origin_pos, targetpart, range, MyChar, TargetChar, basisCFrame)
    if typeof(origin_pos) ~= "Vector3" then
        return nil
    end
    if typeof(range) ~= "number" then
        return nil
    end
    if typeof(targetpart) ~= "Instance" or not targetpart:IsA("BasePart") then
        return nil
    end
    if not (MyChar and TargetChar) then
        return nil
    end

    basisCFrame = basisCFrame or CFrame.new(origin_pos, targetpart.Position)

    local final, bestMag = nil, math.huge

    for _, direction in ipairs(vectors) do
        if direction.Magnitude == 0 then
            continue
        end
        local worldDir =
            (basisCFrame.RightVector * direction.X) +
            (basisCFrame.UpVector    * direction.Y) +
            (basisCFrame.LookVector  * direction.Z)

        local offset = worldDir * range
        local modified = origin_pos + offset

        if MultiPointWallCheck(modified, targetpart.Position, MyChar, TargetChar) then
            local mag = offset.Magnitude
            if mag <= bestMag then
                final = modified
                bestMag = mag
            end
        end
    end

    return final
end

local function FireARemote(Ping, Dt)
    if not Settings.Ragebot then return end

    if not CheckHitChance() then
        return
    end

    local MyChar = LocalPlayer.Character
    if not MyChar then return end
    local MyHead = MyChar:FindFirstChild("Head")
    if not MyHead then return end
    local MyHeadPos = MyHead.Position

    local Targ, HitPart = GetBestTarget(Ping, Dt)
    if not Targ or not HitPart then return end

    local ToolData = GetToolComponents()
    if not ToolData or not ToolData.FireShot then return end

    local HitPos = (Settings.Prediction and Prediction(HitPart, Ping, Dt)) or HitPart.Position

    if Settings.Manipulation then
        local range = Settings.ManipulationRange or 4
        local BestPoint = GetManipPos(MyHeadPos, HitPart, range, MyChar, Targ.Character)
        if not BestPoint then return end
        local AimDir = (HitPos - BestPoint).Unit
        ToolData.FireShot:FireServer(BestPoint, AimDir, HitPart)
    else
        local AimDir = (HitPos - MyHeadPos).Unit
        ToolData.FireShot:FireServer(MyHeadPos, AimDir, HitPart)
    end
end

local PingStat = Stats.PerformanceStats.Ping

task.spawn(function()
    while true do
        local Dt = RunService.Heartbeat:Wait()
        if Settings.Ragebot then
            local Ping = PingStat:GetValue() / 1000
            FireARemote(Ping, Dt)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local Character = LocalPlayer.Character
    if not Character then return end

    local HRP = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not HRP or not Humanoid then return end

    if Bhop then
        local State = Humanoid:GetState()
        if (State == Enum.HumanoidStateType.Jumping 
            or State == Enum.HumanoidStateType.Freefall 
            or State == Enum.HumanoidStateType.Landed) 
            and Humanoid.MoveDirection.Magnitude > 0 then
            HRP.Velocity = Humanoid.MoveDirection * SpeedAmount + Vector3.new(0, HRP.Velocity.Y, 0)
        end
    elseif Speed then
        if Humanoid.MoveDirection.Magnitude > 0 then
            HRP.Velocity = Humanoid.MoveDirection * SpeedAmount + Vector3.new(0, HRP.Velocity.Y, 0)
        end
    end
end)

local repo = 'https://raw.githubusercontent.com/smi9/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'skibidi.hook | Mirage HvH',
    Center = true, AutoShow = true,
})
local Tabs = {
    Combat = Window:AddTab('Combat'),
    UISettings = Window:AddTab('UI Settings'),
}
local RagebotGB = Tabs.Combat:AddLeftGroupbox('Ragebot')

RagebotGB:AddToggle('RagebotToggle', {
    Text = 'Master Toggle', Default = Settings.Ragebot,
    Callback = function(val) Settings.Ragebot = val end
})

RagebotGB:AddToggle('ManipulationToggle', {
    Text = 'Manipulation', Default = Settings.Manipulation,
    Callback = function(val) Settings.Manipulation = val end
})

RagebotGB:AddSlider('ManipulationRange', {
    Text = 'Manipulation Range',
    Default = Settings.ManipulationRange,
    Min = 1, Max = 7, Rounding = 0,
    Callback = function(val) Settings.ManipulationRange = val end
})

RagebotGB:AddToggle('PredictionToggle', {
    Text = 'Prediction', Default = Settings.Prediction,
    Callback = function(val) Settings.Prediction = val end
})

RagebotGB:AddSlider('FovSlider', {
    Text = 'FOV', Default = Settings.Fov, Min = 1, Max = 360,
    Rounding = 0,
    Callback = function(val) Settings.Fov = val end
})

RagebotGB:AddSlider('MinDamageSlider', {
    Text = 'Min Damage', Default = Settings.MinDamage, Min = 1, Max = 99,
    Rounding = 0,
    Callback = function(val) Settings.MinDamage = val end
})

RagebotGB:AddSlider('HitChanceSlider', {
    Text = 'Hit Chance (%)', Default = Settings.HitChance, Min = 1, Max = 100,
    Rounding = 0,
    Callback = function(val) Settings.HitChance = val end
})

RagebotGB:AddToggle('BAimToggle', {
    Text = 'Body Aim', Default = Settings.BAim,
    Callback = function(val) Settings.BAim = val end
})
RagebotGB:AddToggle('PrioritizeHeadToggle', {
    Text = 'Prioritize Head', Default = Settings.PrioritizeHead,
    Callback = function(val) Settings.PrioritizeHead = val end
})
RagebotGB:AddToggle('PrioritizeLegsToggle', {
    Text = 'Prioritize Legs', Default = Settings.PrioritizeLegs,
    Callback = function(val) Settings.PrioritizeLegs = val end
})

local AutomationGB = Tabs.Combat:AddRightGroupbox('Automation')

AutomationGB:AddToggle('AlwaysCrouchToggle', {
    Text = 'Always Crouch',
    Default = Settings.AlwaysCrouch,
    Callback = function(val) Settings.AlwaysCrouch = val end
})

Settings.CrouchWalkAnimId = "rbxassetid://124458965304788"
local LastCrouchTrack = nil

local function ForceCrouch()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    if LastCrouchTrack and LastCrouchTrack.IsPlaying then return end

    local anim = Instance.new("Animation")
    anim.AnimationId = Settings.CrouchWalkAnimId
    LastCrouchTrack = animator:LoadAnimation(anim)
    LastCrouchTrack.Priority = Enum.AnimationPriority.Action
    LastCrouchTrack:Play()

    humanoid.WalkSpeed = 25
    humanoid.JumpPower = 40
end

local function RemoveCrouch()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    humanoid.WalkSpeed = 25
    humanoid.JumpPower = 30

    if LastCrouchTrack and LastCrouchTrack.IsPlaying then
        LastCrouchTrack:Stop()
    end
end

task.spawn(function()
    while true do
        task.wait()
        if Settings.AlwaysCrouch then
            ForceCrouch()
        else
            RemoveCrouch()
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    LastCrouchTrack = nil
    if Settings.AlwaysCrouch then
        local character = LocalPlayer.Character
        local tries = 0
        repeat
            task.wait(0.1)
            tries += 1
        until (character and character:FindFirstChildOfClass("Humanoid") 
            and character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"))
            or tries > 30

        ForceCrouch()
    end
end)

local MovementGB = Tabs.Combat:AddLeftGroupbox('Movement')

MovementGB:AddToggle('Speed', {
    Text = 'Speed',
    Default = Speed
}):OnChanged(function(val)
    Speed = val
end)

MovementGB:AddSlider('SpeedAmount', {
    Text = 'Speed Amount',
    Default = SpeedAmount,
    Min = 16,
    Max = 30,
    Rounding = 0,
}):OnChanged(function(val)
    SpeedAmount = val
end)

MovementGB:AddToggle('Bhop', {
    Text = 'Bhop',
    Default = Bhop
}):OnChanged(function(val)
    Bhop = val
end)

local MenuGroupbox = Tabs.UISettings:AddLeftGroupbox('Menu')
MenuGroupbox:AddButton('Unload UI', function()
	Library:Unload()
end)
MenuGroupbox:AddToggle('SilentLoadToggle', {
    Text = 'Silent Mode',
    Default = getgenv().SilentLoad or false,
    Callback = function(value)
        getgenv().SilentLoad = value
        Window.Holder.Visible = not value
        Library.KeybindFrame.Visible = not value
        if Library.Watermark then Library.Watermark.Visible = not value end
    end
})
MenuGroupbox:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
	Default = 'RightShift',
	NoUI = true,
	Text = 'Menu keybind'
})
Library.ToggleKeybind = Options.MenuKeybind
Options.MenuKeybind:OnChanged(function()
    Library.ToggleKeybind = Options.MenuKeybind
end)
MenuGroupbox:AddToggle('KeybindMenu', {
	Text = 'Keybind Menu',
	Default = true,
	Tooltip = 'Shows Keybinds',
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end
})
MenuGroupbox:AddDropdown('KeybindMenuValue', {
	Values = {
		'Active',
		'Toggled',
		'All'
	},
	Default = 3,
	Multi = false,
	Text = 'Keybind Menu Mode',
	Callback = function(value)
		Library.KeypickerListMode = value
	end
})
local FrameTimer, FrameCounter, FPS = tick(), 0, 60

local function get_ping()
    local ok, ping = pcall(function()
        return Stats:FindFirstChild("Network") and Stats.Network:FindFirstChild("ServerStatsItem")
               and Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if ok and ping then
        return math.floor(ping)
    else
        return 0
    end
end
local WatermarkConnection = RunService.RenderStepped:Connect(function()
    FrameCounter = FrameCounter + 1
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameCounter = 0
        FrameTimer = tick()
    end

    local ping = get_ping()
    local watermarkText = string.format("skibidi.hook | %d ms | %d fps | %s (%d)", ping, FPS, LocalPlayer.Name, LocalPlayer.UserId)
    Library:SetWatermark(watermarkText)
end)

Library:SetWatermarkVisibility(false)
Library:OnUnload(function()
    WatermarkConnection:Disconnect()
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
SaveManager:SetFolder('skibidihook')
ThemeManager:SetFolder('skibidihook/MirageHvH')
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()
