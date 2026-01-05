setfpscap(0)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local RunService = game:GetService('RunService')
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local RagebotEnabled, AutoshootEnabled = true, true
local ShootDelay, FOV, MinDamage, Hitchance = 0.1, 360, 0, 100
local TargetHitboxes = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart", "LeftUpperLeg", "RightUpperLeg"}
local LastShot = 0

local HitboxMultipliers = {
    Head = 4, UpperTorso = 1, LowerTorso = 1, Torso = 1, HumanoidRootPart = 1,
    LeftUpperArm = 0.75, LeftLowerArm = 0.75, LeftHand = 0.75,
    RightUpperArm = 0.75, RightLowerArm = 0.75, RightHand = 0.75,
    LeftUpperLeg = 0.6, LeftLowerLeg = 0.6, LeftFoot = 0.6,
    RightUpperLeg = 0.6, RightLowerLeg = 0.6, RightFoot = 0.6
}
local RandomGen = Random.new()

local CharIgnoreCache = setmetatable({}, {__mode="k"})
local function CacheCharacterParts(Char)
    local t = { Char }
    for _, v in ipairs(Char:GetDescendants()) do
        if v:IsA("BasePart") then t[#t+1] = v end
    end
    CharIgnoreCache[Char] = t
end
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(CacheCharacterParts)
end)
for _, plr in ipairs(Players:GetPlayers()) do
    if plr.Character then CacheCharacterParts(plr.Character) end
end

local CanPassThrough = function(Part)
    if not Part or not Part:IsA("BasePart") then return false end
    local n = Part.Name:lower()
    if n:find("hamik") or n:find("paletka") then
        return true
    end
    if Part.Parent then
        local pn = Part.Parent.Name:lower()
        if pn:find("hamik") or pn:find("paletka") then
            return true
        end
    end
    if Part.Transparency > 0.2 or not Part.CanCollide then
        return true
    end
    if Part:IsA("Decal") or Part:IsA("ParticleEmitter") or Part:IsA("Beam") or Part:IsA("Trail") then
        return true
    end
    return false
end

local IsPartOfCharacter = function(Part)
    if not Part or not Part:IsA("BasePart") then return false end
    local Parent = Part.Parent
    if not Parent then return false end
    if Parent:FindFirstChildOfClass("Humanoid") then return true end
    if Parent:IsA("Accessory") or Parent:IsA("Hat") then return true end
    return false
end

local StrictWallCheck; StrictWallCheck = function(From, To, Shooter, Target)
    if not From or not To then return false end
    local Dir = To - From
    local Dist = Dir.Magnitude
    if Dist < 0.1 or Dist > 1000 then return false end
    local Ignore = {}
    local shooterCache, targetCache = CharIgnoreCache[Shooter], CharIgnoreCache[Target]
    if shooterCache then for _, v in ipairs(shooterCache) do Ignore[#Ignore+1] = v end end
    if targetCache then for _, v in ipairs(targetCache) do Ignore[#Ignore+1] = v end end
    local Params = RaycastParams.new()
    Params.FilterDescendantsInstances = Ignore
    Params.FilterType = Enum.RaycastFilterType.Exclude
    Params.IgnoreWater = true
    local Hit = Workspace:Raycast(From, Dir, Params)
    if not Hit then return true end
    local Inst = Hit.Instance
    if Inst and Inst:IsDescendantOf(Target) then return true end
    if CanPassThrough(Inst) then
        local NextFrom = Hit.Position + Dir.Unit * 0.1
        if (To - NextFrom).Magnitude < 0.1 then return true end
        return StrictWallCheck(NextFrom, To, Shooter, Target)
    end
    if IsPartOfCharacter(Inst) then
        local NextFrom = Hit.Position + Dir.Unit * 0.1
        if (To - NextFrom).Magnitude < 0.1 then return true end
        return StrictWallCheck(NextFrom, To, Shooter, Target)
    end
    return false
end

local MultiPointWallCheck = function(From, To, Shooter, Target)
    if StrictWallCheck(From, To, Shooter, Target) then return true end
    local Offsets = { Vector3.new(0, 0.3, 0), Vector3.new(0, -0.3, 0) }
    for _, Off in ipairs(Offsets) do
        if StrictWallCheck(From, To + Off, Shooter, Target) then return true end
    end
    return false
end

local IsInFOV = function(Position, Center, FOV)
    if FOV >= 360 then return true end
    local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Position)
    if not OnScreen then return false end
    local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Magnitude
    return Distance <= FOV
end

local CalculateDamage = function(Part, Distance)
    local Value = 54 * (HitboxMultipliers[Part.Name] or 0.5)
    if Distance > 300 then Value = Value * 0.3
    elseif Distance > 200 then Value = Value * 0.5
    elseif Distance > 100 then Value = Value * 0.8
    end
    return math.floor(Value)
end

local PassesHitchance = function()
    if Hitchance >= 100 then return true end
    if Hitchance <= 0 then return false end
    return RandomGen:NextInteger(1, 100) <= Hitchance
end

local RageBotPrediction = function(TargetPart, ping, dt)
    local Par = TargetPart.Parent
    local HRP = Par and Par:FindFirstChild("HumanoidRootPart")
    local OldPosition = HRP and HRP:FindFirstChild("OldPosition")
    if not (HRP and OldPosition) then
        return TargetPart.Position
    end
    local hPos, oPos = HRP.Position, OldPosition.Value
    local Vel = Vector3.new(hPos.X - oPos.X, 0, hPos.Z - oPos.Z) / dt
    if Vel.Magnitude == 0 then return TargetPart.Position end
    local Dir = Vel.Unit
    local Offset = Dir * (ping / (ping ^ 1.5) * 2)
    return TargetPart.Position + Offset
end

local SelectTarget = function(dt, ping)
    local Character = LocalPlayer.Character
    if not Character then return end
    local Humanoid = Character:FindFirstChild("Humanoid")
    if not (Humanoid and Humanoid.Health > 0) then return end
    local MyHead = Character:FindFirstChild("Head")
    if not MyHead then return end

    local Center = Camera.ViewportSize * 0.5
    local BestTarget, BestScore = nil, math.huge

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player == LocalPlayer then continue end
        if Player.Team and LocalPlayer.Team and Player.Team == LocalPlayer.Team then continue end

        local TargetCharacter = Player.Character
        local TargetHumanoid = TargetCharacter and TargetCharacter:FindFirstChild("Humanoid")
        local TargetRoot = TargetCharacter and TargetCharacter:FindFirstChild("HumanoidRootPart")
        if not (TargetCharacter and TargetHumanoid and TargetRoot and TargetHumanoid.Health > 0) then continue end

        for _, Hitbox in ipairs(TargetHitboxes) do
            local Part = TargetCharacter:FindFirstChild(Hitbox)
            if not Part then continue end
            if not IsInFOV(Part.Position, Center, FOV) then continue end
            if not MultiPointWallCheck(MyHead.Position, Part.Position, Character, TargetCharacter) then continue end

            local PredictedPos = RageBotPrediction(Part, ping, dt)
            local Distance = (TargetRoot.Position - Camera.CFrame.Position).Magnitude
            local Damage = CalculateDamage(Part, Distance)
            if Damage < MinDamage then continue end
            if PassesHitchance() and Distance < BestScore then
                BestScore = Distance
                BestTarget = {
                    Part = Part,
                    Player = Player,
                    Character = TargetCharacter,
                    WorldPos = PredictedPos,
                    Root = TargetRoot
                }
            end
        end
    end
    return BestTarget
end

local GenerateHeadOffsets = function(radius)
    local offsets = {}
    for dx = -radius, radius, radius/2 do
        for dy = -radius, radius, radius/2 do
            for dz = -radius, radius, radius/2 do
                local v = Vector3.new(dx, dy, dz)
                if v.Magnitude <= radius and v.Magnitude > 0 then
                    table.insert(offsets, v)
                end
            end
        end
    end
    return offsets
end
local HeadOffsets = GenerateHeadOffsets(4)

local ShootTarget = function(Target)
    if not Target then return end
    local Character = LocalPlayer.Character
    if not Character then return end
    local MyHead = Character:FindFirstChild("Head")
    if not MyHead then return end
    local Tool = Character:FindFirstChildOfClass("Tool")
    if not Tool then return end
    local Remotes = Tool:FindFirstChild("Remotes")
    local FireShot = Remotes and Remotes:FindFirstChild("FireShot")
    if not FireShot then return end
    local Now = tick()
    if Now - LastShot < ShootDelay then return end

    local bestOrigin = MyHead.Position
    local found = false
    for _, offset in ipairs(HeadOffsets) do
        local tryOrigin = MyHead.Position + offset
        if StrictWallCheck(tryOrigin, Target.WorldPos, Character, Target.Character) then
            bestOrigin = tryOrigin
            found = true
            break
        end
    end
    local Direction = (Target.WorldPos - bestOrigin).Unit

    local Success = pcall(function()
        FireShot:FireServer(bestOrigin, Direction, Target.Part)
    end)
    if Success then LastShot = Now end
end

local lastFrameTick = tick()
local dt = 0.016

local RagebotLoop = function()
    while RagebotEnabled do
        local now = tick()
        dt = math.max(now - lastFrameTick, 0.016)
        lastFrameTick = now
        local ping = Stats.PerformanceStats.Ping:GetValue() / 1000

        if not AutoshootEnabled then
            task.wait(0.05)
        else
            local Target = SelectTarget(dt, ping)
            ShootTarget(Target)
            task.wait(ShootDelay)
        end
    end
end
task.spawn(RagebotLoop)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/smi9/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/smi9/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/smi9/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = 'skibidi.hook | Mirage HvH',
    Center = true, AutoShow = true, TabPadding = 8, MenuFadeTime = 0
})
local Tabs = {
    Combat = Window:AddTab('Combat'),
    UISettings = Window:AddTab('UI Settings')
}
local RageMain = Tabs.Combat:AddLeftGroupbox('Ragebot')
RageMain:AddToggle('RageEnabled', {Text='Master Toggle',Default=RagebotEnabled}):OnChanged(function(val) RagebotEnabled=val end)
RageMain:AddToggle('AutoShoot', {Text='Auto Shoot',Default=AutoshootEnabled}):OnChanged(function(val) AutoshootEnabled=val end)
RageMain:AddSlider('ShootDelay', {Text='Shoot Delay',Default=ShootDelay,Min=0.01,Max=1.0, Rounding=2}):OnChanged(function(val) ShootDelay=val end)
RageMain:AddSlider('FOV', {Text='FOV',Default=FOV,Min=25,Max=360,Rounding=0}):OnChanged(function(val) FOV=val end)
RageMain:AddSlider('Hitchance', {Text='Hitchance (%)',Default=Hitchance,Min=1,Max=100,Rounding=0}):OnChanged(function(val) Hitchance=val end)
RageMain:AddSlider('MinDamage', {Text='MinDamage',Default=MinDamage,Min=1,Max=80,Rounding=0}):OnChanged(function(val) MinDamage=val end)

local MenuGroupbox = Tabs.UISettings:AddLeftGroupbox('Menu')
MenuGroupbox:AddButton('Unload UI', function()
	Library:Unload()
end)
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

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:BuildConfigSection(Tabs.UISettings)
Library:SetWatermarkVisibility(true)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;
RunService.RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('skibidi.hook | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(Stats.Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);
