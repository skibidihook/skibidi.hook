local HookAdonis = function(metadefs)
    for _ , tbl in metadefs do
        for i, func in tbl do
            if type(func) == "function" and islclosure(func) then
                local dummy_func = function()
                    return pcall(coroutine.close, coroutine.running())
                end
                hookfunction(func, dummy_func)
            end
        end
    end
end
local DisablerInit = function()
    for _, v in getgc(true) do
        if
            typeof(v) == "table"
            and rawget(v, "indexInstance")
            and rawget(v, "newindexInstance")
            and rawget(v, "namecallInstance")
            and type(rawget(v,"newindexInstance")) == "table"
        then
            if v["newindexInstance"][1] == "kick" then
                HookAdonis(v)
            end
        end
    end
end
task.spawn(DisablerInit)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ScreenShakeLS = LocalPlayer.PlayerScripts:FindFirstChild("ScreenShake")

local TeamCheck = true
local SilentAim = false
local Fov = 150
local ShowFov = true
local Snaplines = true
local VisibleCheck = true
local TargetBodyPart = "Head"

local ModDetection = true
local AntiScreenShake = true

local ThirdPerson = false
local ThirdPersonDistance = 10

local NoRecoil = false
local NoSpread = false
local InfiniteMuzzleVelocity = false
local FullAuto = false
local RapidFire = false
local FireRateValue = 6000
local CanShoot = false

local SpeedHack = false
local TargetSpeed = 30
local FlyHack = false
local FlySpeed = 60
local Movement = {Forward = 0, Back = 0, Left = 0, Right = 0, Up = 0, Down = 0}
local FlyConnection

local SilentStep = false
local Anti096Face = false

local BridgeNet2 = require(ReplicatedStorage.Assets.Modules.BridgeNet2);
local Remotes = {
    repSound = BridgeNet2.ClientBridge("repSound"), 
    repReload = BridgeNet2.ClientBridge("repReload"), 
    repHit = BridgeNet2.ClientBridge("__repHit"), 
    fireWeapon = BridgeNet2.ClientBridge("__fireWeapon"), 
    serverTracer = BridgeNet2.ClientBridge("serverTracer"), 
    clientTracer = BridgeNet2.ClientBridge("clientTracer"), 
    repTracer = BridgeNet2.ClientBridge("repTracer"), 
    grenadeThrow = BridgeNet2.ClientBridge("grenadeThrow"), 
    setBarriers = BridgeNet2.ClientBridge("setBarriers"), 
    equipWeapon = BridgeNet2.ClientBridge("equipWeapon"),
    scpHandler = BridgeNet2.ClientBridge("SCPHandler"),
    ReportBridge = BridgeNet2.ClientBridge("ReportBridge"),
};

if not getgenv().OldReportBridgeFire then
    getgenv().OldReportBridgeFire = Remotes.ReportBridge.Fire
end

Remotes.ReportBridge.Fire = function(self, data, ...)
    if data then
        return true
    end
    return getgenv().OldReportBridgeFire(self, data, ...)
end

local FovColor = Color3.fromRGB(255, 255, 255)
local FovLockedColor = Color3.fromRGB(255, 0, 0)
local SnaplineColor = Color3.fromRGB(255, 0, 0)

local CurrentTargetCharacter = nil
local CurrentTargetPart = nil

local FovCircle = Drawing.new("Circle")
FovCircle.Thickness = 1
FovCircle.Filled = false
FovCircle.NumSides = 64

local Snapline = Drawing.new("Line")
Snapline.Thickness = 2
Snapline.Color = SnaplineColor

local VisibilityParams = RaycastParams.new()
VisibilityParams.FilterType = Enum.RaycastFilterType.Exclude
VisibilityParams.RespectCanCollide = true


local function BuildIgnoreList(targetCharacter)
    local ignore = {
        LocalPlayer.Character,
        targetCharacter,
        Camera
    }
    if TeamCheck then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer
               and plr.Team == LocalPlayer.Team
               and plr.Character
            then
                ignore[#ignore + 1] = plr.Character
            end
        end
    end
    return ignore
end
local function IsVisible(targetCharacter, targetPart)
    if not targetCharacter or not targetPart then
        return false
    end

    local origin = Camera.CFrame.Position
    local direction = targetPart.Position - origin

    VisibilityParams.FilterDescendantsInstances = BuildIgnoreList(targetCharacter)

    local result = workspace:Raycast(origin, direction, VisibilityParams)
    return not result or result.Instance:IsDescendantOf(targetCharacter)
end


local function IsTargetable(LocalPlayer, TargetPlayer)
    if not TargetPlayer or not TargetPlayer.Team or not LocalPlayer.Team then
        return false
    end
    if TargetPlayer == LocalPlayer then return false end
    
    local TheirTeamName = TargetPlayer.Team.Name
    local MyTeamName = LocalPlayer.Team.Name
    
    if TheirTeamName == "Lobby" then return false end
    if TargetPlayer.Character and TargetPlayer.Character:FindFirstChildOfClass("ForceField") then return false end
    
    local Char = TargetPlayer.Character
    local Humanoid = Char and Char:FindFirstChild("Humanoid")
    if not Humanoid or Humanoid.Health <= 0 then return false end
    local GameRelationships = {
        ["Class-D"] = {
            ["Mobile Task Forces"] = "Enemy",
            ["Security Department"] = "Enemy",
            ["SCP"] = "Enemy",
            ["Chaos Insurgency"] = "Friendly",
            ["Serpents Hand"] = "Enemy",
            ["Class-D"] = "Friendly"
        },
        ["Foundation Personnel"] = {
            ["Mobile Task Forces"] = "Friendly",
            ["Security Department"] = "Friendly",
            ["SCP"] = "Enemy",
            ["Chaos Insurgency"] = "Enemy",
            ["Serpents Hand"] = "Enemy",
            ["Foundation Personnel"] = "Friendly"
        },
        ["Global Occult Coalition"] = {
            ["SCP"] = "Enemy",
            ["Chaos Insurgency"] = "Neutral",
            ["Serpents Hand"] = "Enemy",
            ["Global Occult Coalition"] = "Friendly"
        },
        ["Serpents Hand"] = {
            ["Mobile Task Forces"] = "Enemy",
            ["Security Department"] = "Enemy",
            ["SCP"] = "Friendly",
            ["Class-D"] = "Enemy",
            ["Chaos Insurgency"] = "Enemy",
            ["Foundation Personnel"] = "Enemy",
            ["Global Occult Coalition"] = "Enemy",
            ["Serpents Hand"] = "Friendly"
        },
        ["Mobile Task Forces"] = {
            ["Security Department"] = "Friendly",
            ["SCP"] = "Enemy",
            ["Class-D"] = "Enemy",
            ["Chaos Insurgency"] = "Enemy",
            ["Foundation Personnel"] = "Friendly",
            ["Serpents Hand"] = "Enemy",
            ["Mobile Task Forces"] = "Friendly"
        },
        ["Security Department"] = {
            ["Mobile Task Forces"] = "Friendly",
            ["SCP"] = "Enemy",
            ["Class-D"] = "Enemy",
            ["Chaos Insurgency"] = "Enemy",
            ["Foundation Personnel"] = "Friendly",
            ["Serpents Hand"] = "Enemy",
            ["Security Department"] = "Friendly"
        },
        ["Chaos Insurgency"] = {
            ["Mobile Task Forces"] = "Enemy",
            ["Security Department"] = "Enemy",
            ["SCP"] = "Enemy",
            ["Class-D"] = "Friendly",
            ["Serpents Hand"] = "Enemy",
            ["Foundation Personnel"] = "Enemy",
            ["Global Occult Coalition"] = "Neutral",
            ["Chaos Insurgency"] = "Friendly"
        },
        ["SCP"] = {
            ["Mobile Task Forces"] = "Enemy",
            ["Security Department"] = "Enemy",
            ["Class-D"] = "Enemy",
            ["Serpents Hand"] = "Friendly",
            ["Foundation Personnel"] = "Enemy",
            ["Chaos Insurgency"] = "Enemy",
            ["Global Occult Coalition"] = "Enemy",
            ["SCP"] = "Friendly"
        },
        ["FFA"] = {
            ["FFA"] = "Enemy"
        }
    }
    if MyTeamName == "FFA" and TheirTeamName == "FFA" then
        return LocalPlayer ~= TargetPlayer
    end
    local MyRelations = GameRelationships[MyTeamName]
    if not MyRelations then
        return MyTeamName ~= TheirTeamName
    end
    local Relation = MyRelations[TheirTeamName]
    if not Relation then
        return MyTeamName ~= TheirTeamName
    end
    if Relation == "Enemy" or Relation == "Neutral" then
        return true
    else
        return false
    end
end

local function GetClosestPlayer()
    local ClosestCharacter, ClosestPart, SmallestDistance = nil, nil, math.huge
    local ScreenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player == LocalPlayer then continue end
        if not Player.Character then continue end
        if not Player.Team then continue end
        
        local TheirTeamName = Player.Team.Name
        if TheirTeamName == "Lobby" then continue end
        if TeamCheck and not IsTargetable(LocalPlayer, Player) then
            continue 
        end
        
        local Character = Player.Character
        local Humanoid = Character:FindFirstChild("Humanoid")
        if not Humanoid or Humanoid.Health <= 0 then continue end
        
        local TargetPart = Character:FindFirstChild(TargetBodyPart)
        if not TargetPart then continue end
        local ScreenPos, OnScreen = Camera:WorldToViewportPoint(TargetPart.Position)
        if not OnScreen then continue end
        local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - ScreenCenter).Magnitude
        if Distance > Fov then continue end
        if VisibleCheck and not IsVisible(Character, TargetPart) then continue end
        if Distance < SmallestDistance then
            SmallestDistance = Distance
            ClosestCharacter = Character
            ClosestPart = TargetPart
        end
    end
    
    return ClosestCharacter, ClosestPart
end

RunService.RenderStepped:Connect(function()
    local ScreenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    if not ShowFov then
        FovCircle.Visible = false
        if SilentAim then
            CurrentTargetCharacter, CurrentTargetPart = GetClosestPlayer()
        end
    else
        FovCircle.Position = ScreenCenter
        FovCircle.Radius = Fov
        FovCircle.Visible = true
        CurrentTargetCharacter, CurrentTargetPart = GetClosestPlayer()
        FovCircle.Color = (CurrentTargetCharacter and CurrentTargetPart) and FovLockedColor or FovColor
    end

    if Snaplines and CurrentTargetCharacter and CurrentTargetPart then
        local TargetScreenPos, OnScreen = Camera:WorldToViewportPoint(CurrentTargetPart.Position)
        if OnScreen then
            Snapline.From = ScreenCenter
            Snapline.To = Vector2.new(TargetScreenPos.X, TargetScreenPos.Y)
            Snapline.Color = SnaplineColor
            Snapline.Visible = true
        else
            Snapline.Visible = false
        end
    else
        Snapline.Visible = false
    end
    if ThirdPerson then
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        LocalPlayer.CameraMinZoomDistance = ThirdPersonDistance
        LocalPlayer.CameraMaxZoomDistance = ThirdPersonDistance
        Camera.CameraType = Enum.CameraType.Custom
        if LocalPlayer.Character then
            Camera.CameraSubject = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        end
    end
end)

local OldNamecall; OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    if Method == "Raycast"
       and typeof(Arguments[1]) == "Vector3"
       and typeof(Arguments[2]) == "Vector3"
       and typeof(Arguments[3]) == "RaycastParams"
       and Arguments[3].CollisionGroup == "ProjectileCollision"
       and CurrentTargetPart and CurrentTargetPart.Parent
       and CurrentTargetPart.Position
       and SilentAim
    then
        local Origin = Arguments[1]
        local OrigDir = Arguments[2]
        local SilentDir = (CurrentTargetPart.Position - Origin)
        Arguments[2] = SilentDir.Unit * OrigDir.Magnitude
        return OldNamecall(self, unpack(Arguments))
    end
    return OldNamecall(self, unpack(Arguments))
end)

for _, Func in pairs(getgc(true)) do
    if typeof(Func) == "function" then
        local Name = debug.info(Func, "n")
        local Source = debug.info(Func, "s")
        if Name == "PlayRandomSound" or (Source and Source:match("Footstep")) then
            local OldFunc = Func
            hookfunction(Func, function(V17, V18, V19)
                if SilentStep and LocalPlayer and LocalPlayer.Character and V18 and V18:IsDescendantOf(LocalPlayer.Character) then
                    return
                end
                return OldFunc(V17, V18, V19)
            end)
            break
        end
    end
end

local InfiniteStamina = false
local StaminaConnection

local function SetupInfiniteStamina()
    if InfiniteStamina and LocalPlayer.Character then
        task.wait(0.5)
        local RunController = LocalPlayer.Character:FindFirstChild("RunController")
        if RunController then
            for _, Connection in pairs(getconnections(RunService.Heartbeat)) do
                local Func = Connection.Function
                if Func then
                    local src = debug.info(Func, "s")
                    if src and tostring(src):lower():find("runcontroller") then
                        Connection:Disable()
                    end
                end
            end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if InfiniteStamina then
        task.wait(1)
        SetupInfiniteStamina()
    end
end)
if LocalPlayer.Character and InfiniteStamina then
    task.spawn(function()
        task.wait(1)
        SetupInfiniteStamina()
    end)
end

if not getgenv().oldf then
    getgenv().oldf = clonefunction(Remotes.fireWeapon.Fire)
end

if not getgenv().olda then
    getgenv().olda = clonefunction(Remotes.repHit.Fire)
end

local old = getgenv().oldf
Remotes.fireWeapon.Fire = function(self, data, ...)
    data["arg1"] = Vector3.new(0/0,0/0,0/0)
    return old(self, data, ...)
end

if not getgenv().OldSCPHandlerFire then
    getgenv().OldSCPHandlerFire = Remotes.scpHandler.Fire
end

Remotes.scpHandler.Fire = function(self, data, ...)
    if Anti096Face and data and data.Arg == "SeenFace" then
        return
    end
    return getgenv().OldSCPHandlerFire(self, data, ...)
end

local function SetupWepStats()
    for _, conn in ipairs(getconnections(RunService.Heartbeat)) do
        local func = conn.Function
        if typeof(func) ~= "function" then continue end
        local info = debug.getinfo(func)
        local source = tostring(info.source or "")
        if source:find("Weapon") then
            local check_caller = debug.getupvalue(func,2)
            hookfunction(check_caller,function()
                return 
            end)
            local oldd
            oldd = hookfunction(func, function(...)
                local upvalues = getupvalues(oldd)
                local state = upvalues and upvalues[1]
                if type(state) == "table" and state.wepStats then
                    if isreadonly and setreadonly then
                        if isreadonly(state.wepStats) then
                            setreadonly(state.wepStats, false)
                        end
                    end
                    if RapidFire then
                        state.wepStats.FireRate = FireRateValue
                        state.wepStats.BurstAmount = FireRateValue
                    end
                    if FullAuto then
                        state.wepStats.FireMode = "Auto"
                    end
                    if NoRecoil then
                        state.wepStats.Recoil = { Vertical = 0, Horizontal = 0 }
                        state.wepStats.ViewPunch = 0
                    end
                    if NoSpread then
                        state.wepStats.Spread = 0
                    end
                    if InfiniteMuzzleVelocity then
                        state.wepStats.MuzzleVelocity = 999999
                    end
                    if setreadonly then
                        setreadonly(state.wepStats, true)
                    end
                end
                return oldd(...)
            end)
            break
        end
    end
end
task.spawn(SetupWepStats)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1.5)
    SetupWepStats()
end)

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local InternalWalkSpeed = Humanoid.WalkSpeed
local function ApplySpeed()
    if SpeedHack then
        Humanoid.WalkSpeed = TargetSpeed
    else
        Humanoid.WalkSpeed = 16
    end
end
local OldIndex;OldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not checkcaller() and self == Humanoid and key == "WalkSpeed" and SpeedHack then
        return InternalWalkSpeed
    end
    return OldIndex(self, key)
end))
local OldNewIndex;OldNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
    if not checkcaller() and self == Humanoid and key == "WalkSpeed" and SpeedHack then
        InternalWalkSpeed = value
        return
    end
    return OldNewIndex(self, key, value)
end))
local OldWSNamecall;OldWSNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if not checkcaller() and self == Humanoid and SpeedHack then
        if method == "WalkSpeed" or (method == "GetPropertyChangedSignal" and ... == "WalkSpeed") then
            return InternalWalkSpeed
        end
    end
    return OldWSNamecall(self, ...)
end))
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    ApplySpeed()
end)
local repo = 'https://raw.githubusercontent.com/smi9/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local GroupID = 526116898
local TargetRanks = {
    ["Content Creator"] = true,
    ["Trial Moderator"] = true,
    ["Moderator"] = true,
    ["Senior Moderator"] = true,
    ["Administrator"] = true,
    ["Assistant Manager"] = true,
    ["Studio Manager"] = true,
    ["Developer"] = true,
    ["Owner"] = true,
}
local function CheckModRank(player)
    local ok, role = pcall(function()
        return player:GetRoleInGroup(GroupID)
    end)
    if ok and role and TargetRanks[role] then
        return true, role
    end
    return false
end
local function NotifyUser(player)
    if not ModDetection then return end
    local InGroup, role = CheckModRank(player)
    if InGroup then
        Library:Notify(string.format("%s (%s) from group %d is detected.", player.Name, role, GroupID))
    end
end
local function CheckPlayersInGroup()
    if not ModDetection then return end
    for _, player in ipairs(Players:GetPlayers()) do
        NotifyUser(player)
    end
end
Players.PlayerAdded:Connect(function(player)
    NotifyUser(player)
end)
local Window = Library:CreateWindow({
    Title = 'skibidi.hook',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0,
})
local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visual = Window:AddTab('Visual'),
    Misc = Window:AddTab('Misc'),
    UISettings = Window:AddTab('UI Settings'),
}
local SilentAimGB = Tabs.Combat:AddLeftGroupbox('Silent Aim')
SilentAimGB:AddToggle('SilentAim', { Text = 'Master Toggle', Default = SilentAim, Callback = function(v) SilentAim = v end })
SilentAimGB:AddSlider('Fov', { Text = 'FOV', Default = Fov, Min = 20, Max = 360, Rounding = 0, Callback = function(v) Fov = v end })
SilentAimGB:AddDropdown('TargetBodyPart', { Text = 'Target Part', Values = { 'Head', 'Torso', 'HumanoidRootPart' }, Default = ({Head=1,Torso=2,HumanoidRootPart=3})[TargetBodyPart] or 1, Callback = function(v) TargetBodyPart = v end })
SilentAimGB:AddToggle('TeamCheck', { Text = 'Team Check', Default = TeamCheck, Callback = function(v) TeamCheck = v end })
SilentAimGB:AddToggle('VisibleCheck', { Text = 'Visibility Check', Default = VisibleCheck, Callback = function(v) VisibleCheck = v end })
SilentAimGB:AddToggle('ShowFov', { Text = 'Show FOV Circle', Default = ShowFov, Callback = function(v) ShowFov = v end })
SilentAimGB:AddToggle('Snaplines', { Text = 'Show Snaplines', Default = Snaplines, Callback = function(v) Snaplines = v end })

local GunmodsGB = Tabs.Combat:AddRightGroupbox('Gun Mods')
GunmodsGB:AddToggle('NoRecoil', { Text = 'No Recoil', Default = NoRecoil, Callback = function(v) NoRecoil = v end })
GunmodsGB:AddToggle('NoSpread', { Text = 'No Spread', Default = NoSpread, Callback = function(v) NoSpread = v end })
GunmodsGB:AddToggle('InfiniteMuzzleVelocity', { Text = 'Instant Bullet', Default = InfiniteMuzzleVelocity, Callback = function(v) InfiniteMuzzleVelocity = v end })
GunmodsGB:AddToggle('FullAuto', { Text = 'Full Auto', Default = FullAuto, Callback = function(v) FullAuto = v end })
GunmodsGB:AddToggle('RapidFire', { Text = 'Rapid Fire', Default = RapidFire, Callback = function(v) RapidFire = v end })
GunmodsGB:AddSlider('FireRateValue', { Text = 'Fire Rate', Default = FireRateValue, Min = 100, Max = 6500, Rounding = 0, Callback = function(v) FireRateValue = v end })
--GunmodsGB:AddToggle('CanShoot', { Text = 'Force Shoot', Default = CanShoot, Callback = function(v) CanShoot = v end })
local MovementGB = Tabs.Combat:AddLeftGroupbox('Movement')
MovementGB:AddToggle('SpeedHack', {
    Text = 'Speedhack',
    Default = SpeedHack,
    Callback = function(v)
        SpeedHack = v
        ApplySpeed()
    end
})

MovementGB:AddSlider('TargetSpeed', {
    Text = 'Speed',
    Default = TargetSpeed,
    Min = 1,
    Max = 79,
    Rounding = 0,
    Callback = function(v)
        TargetSpeed = v
        if SpeedHack then
            ApplySpeed()
        end
    end
})

MovementGB:AddToggle('FlyHack', {
    Text = 'Flyhack',
    Default = false,
    Callback = function(Value)
        FlyHack = Value
        if Value then
            if not FlyConnection then
                FlyConnection = RunService.RenderStepped:Connect(function()
                    local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not (FlyHack and HumanoidRootPart) then return end
                    local MoveVector = Vector3.new(
                        (Movement.Right - Movement.Left), 
                        (Movement.Up - Movement.Down),
                        (Movement.Back - Movement.Forward)
                    )
                    if MoveVector.Magnitude > 0 then
                        local CameraCFrame = Camera.CFrame
                        local Look = CameraCFrame.LookVector
                        local Right = CameraCFrame.RightVector
                        local Up = Vector3.new(0,1,0)
                        local FlyDirection =
                            (Right * (Movement.Right - Movement.Left)) +
                            (Look * (Movement.Forward - Movement.Back)) +
                            (Up   * (Movement.Up - Movement.Down))
                        FlyDirection = FlyDirection.Unit
                        HumanoidRootPart.Velocity = FlyDirection * FlySpeed
                    else
                        HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    end
                end)
            end
        else
            if FlyConnection then
                FlyConnection:Disconnect()
                FlyConnection = nil
                local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then HumanoidRootPart.Velocity = Vector3.new(0,0,0) end
            end
        end
    end
})
MovementGB:AddSlider('FlySpeed', {
    Text = 'Fly Speed',
    Default = FlySpeed,
    Min = 1,
    Max = 200,
    Rounding = 0,
    Callback = function(v)
        FlySpeed = v
    end
})
UserInputService.InputBegan:Connect(function(Input, Processed)
    if Processed then return end
    if not FlyHack then return end
    if Input.KeyCode == Enum.KeyCode.W then Movement.Forward = 1 end
    if Input.KeyCode == Enum.KeyCode.S then Movement.Back = 1 end
    if Input.KeyCode == Enum.KeyCode.A then Movement.Left = 1 end
    if Input.KeyCode == Enum.KeyCode.D then Movement.Right = 1 end
    if Input.KeyCode == Enum.KeyCode.Space then Movement.Up = 1 end
    if Input.KeyCode == Enum.KeyCode.LeftControl then Movement.Down = 1 end
end)
UserInputService.InputEnded:Connect(function(Input, Processed)
    if Processed then return end
    if Input.KeyCode == Enum.KeyCode.W then Movement.Forward = 0 end
    if Input.KeyCode == Enum.KeyCode.S then Movement.Back = 0 end
    if Input.KeyCode == Enum.KeyCode.A then Movement.Left = 0 end
    if Input.KeyCode == Enum.KeyCode.D then Movement.Right = 0 end
    if Input.KeyCode == Enum.KeyCode.Space then Movement.Up = 0 end
    if Input.KeyCode == Enum.KeyCode.LeftControl then Movement.Down = 0 end
end)
local LocalGB = Tabs.Misc:AddLeftGroupbox('Local')
LocalGB:AddToggle('ThirdPerson', { Text = 'Third Person', Default = ThirdPerson, Callback = function(v) ThirdPerson = v end })
LocalGB:AddSlider('ThirdPersonDistance', { Text = 'Third Person Dist', Default = ThirdPersonDistance, Min = 5, Max = 25, Rounding = 0, Callback = function(v) ThirdPersonDistance = v end })
LocalGB:AddToggle('InfiniteStamina', {
    Text = 'Infinite Stamina',
    Default = InfiniteStamina,
    Callback = function(v)
        InfiniteStamina = v
        if v then
            SetupInfiniteStamina()
        elseif StaminaConnection then
            StaminaConnection:Enable()
            StaminaConnection = nil
        end
    end
})
local ExtraGB = Tabs.Misc:AddLeftGroupbox('Extra')
ExtraGB:AddToggle('AntiScreenShake', {
    Text = 'Anti Screenshake',
    Default = AntiScreenShake,
    Callback = function(v)
        AntiScreenShake = v
        if ScreenShakeLS then
            ScreenShakeLS.Disabled = v
        end
    end
})
ExtraGB:AddToggle('ModDetection', { 
    Text = 'Moderator Detection', 
    Default = ModDetection, 
    Callback = function(v) 
        ModDetection = v
        if v then
            if type(CheckPlayersInGroup) == "function" then
                CheckPlayersInGroup()
            end
        end
    end
})
local ExploitsGB = Tabs.Misc:AddLeftGroupbox('Exploits')
ExploitsGB:AddToggle('SilentStep', { 
    Text = 'Silent Step', 
    Default = SilentStep, 
    Callback = function(v) 
        SilentStep = v
    end
})
ExploitsGB:AddToggle('Anti096Face', { 
    Text = 'Anti 096 Face', 
    Default = Anti096Face, 
    Callback = function(v) 
        Anti096Face = v
    end
})
local MenuGB = Tabs.UISettings:AddLeftGroupbox('Menu')
MenuGB:AddButton('Unload', function() Library:Unload() end)
MenuGB:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('skibidihook')
SaveManager:SetFolder('skibidihook/configs')
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()
