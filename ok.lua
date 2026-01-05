setfpscap(0)

if getgenv().skibidi_hook_loaded then
    return
else
    getgenv().skibidi_hook_loaded = true
end

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Camera = Workspace.CurrentCamera
end)

local v3 = Vector3.new
local floor = math.floor
local clamp = math.clamp
local exp = math.exp
local max = math.max
local min = math.min
local ipairs_ = ipairs
local CFrame_new = CFrame.new
local CFrame_Angles = CFrame.Angles
local rad = math.rad

local RagebotEnabled, AutoshootEnabled = true, true
local ShootDelay, MinDamage, Hitchance = 0.0, 0, 100
local TargetHitboxes = { "Head", "UpperTorso", "HumanoidRootPart" }
local LastShot = 0

local HitboxMultipliers = {
    Head = 4, UpperTorso = 1, LowerTorso = 1, Torso = 1, HumanoidRootPart = 1,
    LeftUpperArm = 0.75, LeftLowerArm = 0.75, LeftHand = 0.75,
    RightUpperArm = 0.75, RightLowerArm = 0.75, RightHand = 0.75,
    LeftUpperLeg = 0.6, LeftLowerLeg = 0.6, LeftFoot = 0.6,
    RightUpperLeg = 0.6, RightLowerLeg = 0.6, RightFoot = 0.6
}
local RandomGen = Random.new()

local CharIgnoreCache = setmetatable({}, { __mode = "k" })
local skibidi_cached_flags = setmetatable({}, { __mode = "k" })

local function CacheCharacterParts(Char)
    if not Char then return end
    local t = { Char }
    for _, v in ipairs(Char:GetDescendants()) do
        if v:IsA("BasePart") then t[#t + 1] = v end
    end
    CharIgnoreCache[Char] = t

    if not skibidi_cached_flags[Char] then
        Char.DescendantAdded:Connect(function(obj)
            if obj:IsA("BasePart") then
                t[#t + 1] = obj
            end
        end)
        Char.DescendantRemoving:Connect(function(obj)
            for i = #t, 1, -1 do
                if t[i] == obj then table.remove(t, i) end
            end
        end)
        Char.AncestryChanged:Connect(function()
            CharIgnoreCache[Char] = nil
        end)
        skibidi_cached_flags[Char] = true
    end
end

for _, plr in ipairs_(Players:GetPlayers()) do
    plr.CharacterAdded:Connect(CacheCharacterParts)
    if plr.Character then CacheCharacterParts(plr.Character) end
end
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(CacheCharacterParts)
end)

local MAX_PIERCES = 8
local RAYCAST_BUDGET_PER_FRAME = 1000 
local raycastBudgetUsed = 0

local rayParamsCache = setmetatable({}, { __mode = "k" }) 

local function GetRayParamsForPair(Shooter, Target)
    local shooterMap = rayParamsCache[Shooter]
    if not shooterMap then
        shooterMap = setmetatable({}, { __mode = "k" })
        rayParamsCache[Shooter] = shooterMap
    end
    local rp = shooterMap[Target]
    if rp then return rp end

    local shooterCache = CharIgnoreCache[Shooter] or {}
    local targetCache = CharIgnoreCache[Target] or {}
    local combined = table.create(#shooterCache + #targetCache)
    for i = 1, #shooterCache do combined[#combined + 1] = shooterCache[i] end
    for i = 1, #targetCache do combined[#combined + 1] = targetCache[i] end

    rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    rp.IgnoreWater = true
    rp.FilterDescendantsInstances = combined
    shooterMap[Target] = rp
    return rp
end

local function ResetRaycastBudget() raycastBudgetUsed = 0 end
RunService.Heartbeat:Connect(ResetRaycastBudget)

local function CanUseRaycast(n) return raycastBudgetUsed + (n or 1) <= RAYCAST_BUDGET_PER_FRAME end
local function CountRaycast(n) raycastBudgetUsed += (n or 1) end

local function StrictWallCheckParams(From, To, rp, Target)
    if not From or not To then return false end
    local Dir = To - From
    local Dist = Dir.Magnitude
    if Dist < 0.1 or Dist > 1000 then return false end
    Dir = Dir.Unit

    local curFrom = From
    for _ = 1, MAX_PIERCES do
        if not CanUseRaycast(1) then return false end
        local DirVec = To - curFrom
        if DirVec.Magnitude < 0.1 then return true end

        CountRaycast(1)
        local hit = Workspace:Raycast(curFrom, DirVec, rp)
        if not hit then return true end
        local inst = hit.Instance
        if inst and Target and inst:IsDescendantOf(Target) then
            return true
        end
        if inst and inst:IsA("BasePart") then
            if inst.Transparency > 0.2 or not inst.CanCollide then
                curFrom = hit.Position + Dir * 0.1
            else
                return false
            end
        else
            return true
        end
    end
    return false
end

local MULTI_OFFSETS_PRIORITY = {
    v3(0, 0.3, 0), v3(0, -0.15, 0),
    v3(0.2, 0.1, 0), v3(-0.2, 0.1, 0),
    v3(0, 0, 0.2)
}
local MULTI_OFFSETS_LIGHT = {
    v3(0, 0.3, 0), v3(0.2, 0, 0), v3(-0.2, 0, 0), v3(0, 0, 0.2)
}

local function MultiPointWallCheck(From, To, Shooter, Target)
    if not CanUseRaycast(1) then return false end
    local rp = GetRayParamsForPair(Shooter, Target)
    if StrictWallCheckParams(From, To, rp, Target) then
        return true
    end

    local distance = (To - From).Magnitude
    local scaleFactor = distance > 120 and 0.55 or (distance < 30 and 1.35 or 1.0)
    local offsets = (distance > 80) and MULTI_OFFSETS_LIGHT or MULTI_OFFSETS_PRIORITY

    for i = 1, #offsets do
        if not CanUseRaycast(1) then break end
        local o = offsets[i] * scaleFactor
        if StrictWallCheckParams(From, To + o, rp, Target) then
            return true
        end
    end
    return false
end

local function CalculateDamage(Part, Distance)
    local Value = 54 * (HitboxMultipliers[Part.Name] or 0.5)
    if Distance > 300 then Value *= 0.3
    elseif Distance > 200 then Value *= 0.5
    elseif Distance > 100 then Value *= 0.8
    end
    return floor(Value)
end

local function PassesHitchance()
    if Hitchance >= 100 then return true end
    if Hitchance <= 0 then return false end
    return RandomGen:NextInteger(1, 100) <= Hitchance
end

local velCache = setmetatable({}, { __mode = "k" })
local function RageBotPrediction(TargetPart, pingMs, dt)
    if not TargetPart then return Vector3.zero end
    local par = TargetPart.Parent
    local hrp = par and par:FindFirstChild("HumanoidRootPart")
    if not hrp then return TargetPart.Position end

    local oldPosObj = hrp:FindFirstChild("OldPosition")
    if not oldPosObj then return TargetPart.Position end

    dt = max(dt or 0, 1 / 240)
    local pNow, pPrev = hrp.Position, oldPosObj.Value
    local vRaw = (pNow - pPrev) / dt

    local st = velCache[hrp]
    if not st then
        st = { v = vRaw, lastV = vRaw }
        velCache[hrp] = st
    end

    local resp = 22
    local alpha = 1 - exp(-resp * dt)
    local vSmoothed = st.v:Lerp(vRaw, alpha)
    local a = (vSmoothed - st.lastV) / dt
    st.lastV, st.v = vSmoothed, vSmoothed

    local pingSec = (pingMs or 0) * 0.001
    local t = min(max(pingSec * 0.5 + 0.045, 0), 0.35)
    local accelMax = 180
    if a.Magnitude > accelMax then a = a.Unit * accelMax end

    return TargetPart.Position + (vSmoothed * t) + (a * (0.5 * t * t))
end

local function SelectTarget(dt, ping)
    local Character = LocalPlayer.Character
    if not Character then return end
    local MyHead = Character:FindFirstChild("Head")
    local Humanoid = Character:FindFirstChild("Humanoid")
    if not (Humanoid and MyHead and Humanoid.Health > 0) then return end

    local camPos = (Camera and Camera.CFrame and Camera.CFrame.Position) or MyHead.Position
    local best, bestScore = nil, math.huge

    for _, Player in ipairs_(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Team and LocalPlayer.Team and Player.Team ~= LocalPlayer.Team then
            local TargetCharacter = Player.Character
            if TargetCharacter then
                local h = TargetCharacter:FindFirstChild("Humanoid")
                local hrp = TargetCharacter:FindFirstChild("HumanoidRootPart")
                if h and hrp and h.Health > 0 then
                    for _, Hitbox in ipairs_(TargetHitboxes) do
                        local Part = TargetCharacter:FindFirstChild(Hitbox)
                        if not Part then continue end
                        local PredictedPos = RageBotPrediction(Part, ping, dt)
                        local dist = (PredictedPos - camPos).Magnitude
                        local Damage = CalculateDamage(Part, dist)
                        if Damage < MinDamage then continue end
                        local score = dist - (Damage * 0.25)
                        if PassesHitchance() and score < bestScore then
                            bestScore = score
                            best = {
                                Part = Part,
                                Player = Player,
                                Character = TargetCharacter,
                                WorldPos = PredictedPos,
                                Root = hrp
                            }
                        end
                    end
                end
            end
        end
    end
    if best then
        local ok = MultiPointWallCheck(MyHead.Position, best.WorldPos, Character, best.Character)
        if ok then return best end
    end
    return nil
end

local ORIGIN_RADIUS = 5
local TAU = math.pi * 2
local GOLDEN = 2.39996322972865332

local function BuildBasis(dir)
    local p = dir:Cross(v3(0, 1, 0))
    if p.Magnitude < 1e-3 then p = dir:Cross(v3(1, 0, 0)) end
    p = p.Unit
    local q = dir:Cross(p).Unit
    return p, q
end

local function FindBestOrigin5(headPos, targetPos, Character, TargetCharacter)
    local rp = GetRayParamsForPair(Character, TargetCharacter)
    local dvec = targetPos - headPos
    local dist = dvec.Magnitude
    if dist < 1e-3 then return headPos end
    local dir = dvec.Unit
    local p, q = BuildBasis(dir)

    local priorityOffsets = {
        dir * ORIGIN_RADIUS,        -- forward
        -dir * ORIGIN_RADIUS,       -- back
        p * ORIGIN_RADIUS,          -- right
        -p * ORIGIN_RADIUS,         -- left
        q * ORIGIN_RADIUS,          -- up
        -q * ORIGIN_RADIUS,         -- down
        (p + q).Unit * ORIGIN_RADIUS,
        (p - q).Unit * ORIGIN_RADIUS,
        (-p + q).Unit * ORIGIN_RADIUS,
        (-p - q).Unit * ORIGIN_RADIUS
    }

    for i = 1, #priorityOffsets do
        if not CanUseRaycast(1) then break end
        local origin = headPos + priorityOffsets[i]
        if StrictWallCheckParams(origin, targetPos, rp, TargetCharacter) then
            return origin
        end
    end

    local count = 48
    for i = 1, count do
        if not CanUseRaycast(1) then break end
        local y = 1 - ((i - 0.5) / count) * 2
        local r = math.sqrt(max(0, 1 - y * y))
        local theta = GOLDEN * i
        local x = r * math.cos(theta)
        local z = r * math.sin(theta)
        local offset = v3(x, y, z) * ORIGIN_RADIUS
        local origin = headPos + offset
        if StrictWallCheckParams(origin, targetPos, rp, TargetCharacter) then
            return origin
        end
    end
    return headPos
end

local function ShootTarget(Target)
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

    local bestOrigin = FindBestOrigin5(MyHead.Position, Target.WorldPos, Character, Target.Character)
    local Direction = (Target.WorldPos - bestOrigin).Unit
    pcall(function()
        FireShot:FireServer(bestOrigin, Direction, Target.Part)
    end)
end

RunService.Heartbeat:Connect(function(dt)
    if not RagebotEnabled or not AutoshootEnabled then return end
    local ping = Stats.PerformanceStats.Ping:GetValue()
    local Target = SelectTarget(dt, ping)
    ShootTarget(Target)
end)

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
local RageMain = Tabs.Combat:AddLeftGroupbox('Rage Bot')
RageMain:AddToggle('RageEnabled', {Text='Master Toggle',Default=RagebotEnabled}):OnChanged(function(val) RagebotEnabled=val end)
RageMain:AddToggle('AutoShoot', {Text='Auto Shoot',Default=AutoshootEnabled}):OnChanged(function(val) AutoshootEnabled=val end)
RageMain:AddSlider('ShootDelay', {Text='Shoot Delay',Default=ShootDelay,Min=0.00,Max=1.0, Rounding=2}):OnChanged(function(val) ShootDelay=val end)
RageMain:AddSlider('Hitchance', {Text='Hitchance (%)',Default=Hitchance,Min=1,Max=100,Rounding=0}):OnChanged(function(val) Hitchance=val end)
RageMain:AddSlider('MinDamage', {Text='MinDamage',Default=MinDamage,Min=1,Max=80,Rounding=0}):OnChanged(function(val) MinDamage=val end)

local AntiAimMain = Tabs.Combat:AddLeftGroupbox('Anti Aim')
AntiAimMain:AddToggle('AntiAimEnabled', {
    Text = 'Master Toggle',
    Default = false,
})
AntiAimMain:AddDropdown('AntiAimYawMode', {
    Values = {'Off', 'Static Left', 'Static Right', 'Jitter', 'Spinbot', '180 Flick', 'Random', 'Slow Spin', 'Sway'},
    Default = 'Off',
    Text = 'Yaw Mode',
})

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

local CurrentYaw = 0
local JitterSide = 1
local flickTimer = 0
local swayDir = 1
local swayYaw = 0
local AntiAimConnection = nil
local FlickInterval = 0.25

local function ApplyAntiAim()
    if not Toggles.AntiAimEnabled.Value then
        if AntiAimConnection then
            AntiAimConnection:Disconnect()
            AntiAimConnection = nil
        end
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame_new(hrp.Position)
            end
        end
        return
    end

    if not AntiAimConnection then
        AntiAimConnection = RunService.RenderStepped:Connect(function(dt)
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local mode = Options.AntiAimYawMode.Value or 'Off'
            local base = CFrame_new(hrp.Position)
            if mode == "Off" then
                hrp.CFrame = base
                return
            end
            if mode == "Force Left" then
                hrp.CFrame = base * CFrame_Angles(0, rad(-90), 0)
            elseif mode == "Force Right" then
                hrp.CFrame = base * CFrame_Angles(0, rad(90), 0)
            elseif mode == "Jitter" then
                JitterSide = -JitterSide
                hrp.CFrame = base * CFrame_Angles(0, rad(130 * JitterSide), 0)
            elseif mode == "Spinbot" then
                CurrentYaw = (CurrentYaw + dt * 2500) % 360
                hrp.CFrame = base * CFrame_Angles(0, rad(CurrentYaw), 0)
            elseif mode == "180 Flick" then
                flickTimer = (flickTimer or 0) + dt
                if flickTimer >= FlickInterval then
                    CurrentYaw = (CurrentYaw + 180) % 360
                    flickTimer = 0
                end
                hrp.CFrame = base * CFrame_Angles(0, rad(CurrentYaw), 0)
            elseif mode == "Random" then
                hrp.CFrame = base * CFrame_Angles(0, rad(RandomGen:NextInteger(0,359)), 0)
            elseif mode == "Slow Spin" then
                CurrentYaw = (CurrentYaw + dt * 120) % 360
                hrp.CFrame = base * CFrame_Angles(0, rad(CurrentYaw), 0)
            elseif mode == "Sway" then
                swayYaw = swayYaw + (dt * 90 * swayDir)
                if math.abs(swayYaw) > 90 then
                    swayDir = -swayDir
                    swayYaw = clamp(swayYaw, -90, 90)
                end
                hrp.CFrame = base * CFrame_Angles(0, rad(swayYaw), 0)
            end
        end)
    end
end

Toggles.AntiAimEnabled:OnChanged(ApplyAntiAim)
Options.AntiAimYawMode:OnChanged(ApplyAntiAim)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:BuildConfigSection(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()
Library:SetWatermarkVisibility(true)
local lastWatermark = 0
local cachedWatermark = ""
local FrameTimer = os.clock()
local FrameCounter = 0
local FPS = 60
RunService.RenderStepped:Connect(function(dt)
    local now = os.clock()
    FrameCounter += 1
    if (now - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = now
        FrameCounter = 0
    end
    if (now - lastWatermark) >= 0.1 then
        lastWatermark = now
        cachedWatermark = ('skibidi.hook | %s fps | %s ms'):format(
            floor(FPS), floor(Stats.Network.ServerStatsItem['Data Ping']:GetValue())
        )
        Library:SetWatermark(cachedWatermark)
    end
end)
