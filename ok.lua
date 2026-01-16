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
    for i, v in getgc(true) do
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
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local TeamCheck = true
local SilentAim = true
local Fov = 300
local ShowFov = true
local Snaplines = true
local VisibleCheck = true
local TargetBodyPart = "Head"

local ModDetection = true

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

local function IsVisible(TargetCharacter, TargetPart)
    local LocalCharacter = LocalPlayer.Character
    if not LocalCharacter then return false end
    local Origin
    local WeaponTool = LocalCharacter:FindFirstChildOfClass("Tool")
    if WeaponTool then
        local WeaponModel = WeaponTool:FindFirstChild("_WeaponModel")
        if WeaponModel then
            local Handle = WeaponModel:FindFirstChild("_Handle")
            if Handle then
                local Barrel = Handle:FindFirstChild("Barrel")
                if Barrel then
                    Origin = Barrel.WorldPosition
                end
            end
        end
    end
    
    if not Origin then
        Origin = Camera.CFrame.Position
    end
    
    local Direction = (TargetPart.Position - Origin)
    local Params = RaycastParams.new()
    Params.RespectCanCollide = true
    Params.FilterType = Enum.RaycastFilterType.Exclude
    Params.FilterDescendantsInstances = {LocalPlayer.Character, TargetCharacter, workspace.CurrentCamera}
    
    local Result = workspace:Raycast(Origin, Direction, Params)
    return not Result or Result.Instance:IsDescendantOf(TargetCharacter)
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
end)

local OldNamecall;OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    if Method == "Raycast"
      and typeof(Arguments[1]) == "Vector3"
      and typeof(Arguments[2]) == "Vector3"
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

local StaminaScript = nil
local InfiniteStamina = false
local StaminaConnection

local function SetupInfiniteStamina()
    if InfiniteStamina and LocalPlayer.Character then
        task.wait(0.5)
        StaminaScript = LocalPlayer.Character:FindFirstChild("RunController")
        
        if StaminaScript then
            if StaminaConnection then
                StaminaConnection:Enable()
                StaminaConnection:Disable()
                StaminaConnection = nil
            end
            for _, Connection in pairs(getconnections(RunService.Heartbeat)) do
                local Func = Connection.Function
                if Func and getfenv then
                    local success, env = pcall(getfenv, Func)
                    if success and env.script == StaminaScript then
                        StaminaConnection = Connection
                        Connection:Disable()
                        break
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

local InfiniteAmmo = false

local AmmoThreads = {}

local MagSize = 30

local function SetReserveToMax(ReserveValue)
    if ReserveValue:IsA("NumberValue") or ReserveValue:IsA("IntValue") then
        local MaxValue = ReserveValue:GetAttribute("MaxValue")
        if MaxValue then
            ReserveValue.Value = MaxValue
        end
    end
end

local function CleanupAmmoThreads(Character)
    for GunName, Thread in pairs(AmmoThreads) do
        if not Character or not GunName:find(tostring(Character)) then
            coroutine.close(Thread)
            AmmoThreads[GunName] = nil
        end
    end
end

local function SetupAmmoControl(Character)
    CleanupAmmoThreads(Character)
    
    local PlayerFolder = Character
    local CharacterId = tostring(Character)
    
    for _, Child in ipairs(PlayerFolder:GetChildren()) do
        local AmmoFolder = Child:FindFirstChild("Ammo")
        if AmmoFolder then
            local GunName = CharacterId .. "_" .. Child.Name
            local MagValue = AmmoFolder:WaitForChild("Mag")
            local ReserveValue = AmmoFolder:WaitForChild("Reserve")
            
            MagValue.Value = MagSize
            SetReserveToMax(ReserveValue)
            
            local AmmoThread = coroutine.create(function()
                while InfiniteAmmo and Character and Character.Parent do
                    task.wait()
                    
                    if MagValue.Value ~= MagSize then
                        MagValue.Value = MagSize
                    end
                    
                    SetReserveToMax(ReserveValue)
                end
                AmmoThreads[GunName] = nil
            end)
            
            AmmoThreads[GunName] = AmmoThread
            if InfiniteAmmo then
                coroutine.resume(AmmoThread)
            end
        end
    end
    
    PlayerFolder.ChildAdded:Connect(function(Child)
        task.wait(0.1)
        
        local AmmoFolder = Child:FindFirstChild("Ammo")
        if AmmoFolder then
            local GunName = CharacterId .. "_" .. Child.Name
            local MagValue = AmmoFolder:WaitForChild("Mag")
            local ReserveValue = AmmoFolder:WaitForChild("Reserve")
            
            MagValue.Value = MagSize
            SetReserveToMax(ReserveValue)
            
            local AmmoThread = coroutine.create(function()
                while InfiniteAmmo and Character and Character.Parent do
                    task.wait()
                    
                    if MagValue.Value ~= MagSize then
                        MagValue.Value = MagSize
                    end
                    
                    SetReserveToMax(ReserveValue)
                end
                AmmoThreads[GunName] = nil
            end)
            
            AmmoThreads[GunName] = AmmoThread
            if InfiniteAmmo then
                coroutine.resume(AmmoThread)
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(Character)
    if InfiniteAmmo then
        SetupAmmoControl(Character)
    end
end)

if LocalPlayer.Character and InfiniteAmmo then
    SetupAmmoControl(LocalPlayer.Character)
end

local repo = 'https://raw.githubusercontent.com/smi9/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local GroupId = 526116898
local TargetRanksSet = {
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

local function CheckPlayerGroupRank(player)
	local ok, role = pcall(function()
		return player:GetRoleInGroup(GroupId)
	end)
	if ok and role and TargetRanksSet[role] then
		return true, role
	end
	return false
end

local function NotifyIfInGroup(player)
	if not ModDetection then
		return
	end
	local inGroup, role = CheckPlayerGroupRank(player)
	if inGroup then
		Library:Notify(string.format("%s (%s) from group %d is detected.", player.Name, role, GroupId))
	end
end

local function CheckPlayersInGroup()
	if not ModDetection then
		return
	end
	for _, player in ipairs(Players:GetPlayers()) do
		NotifyIfInGroup(player)
	end
end

Players.PlayerAdded:Connect(function(player)
	NotifyIfInGroup(player)
end)

local Window = Library:CreateWindow({
    Title = 'skibidi.hook | SCP: Retro Breach',
    Center = true,
    AutoShow = true,
    MenuFadeTime = 0,
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    UISettings = Window:AddTab('UI Settings'),
}

local SilentAimGB = Tabs.Combat:AddLeftGroupbox('Silent Aim')

SilentAimGB:AddToggle('SilentAimEnabled', {
    Text = 'Silent Aim',
    Default = true,
    Callback = function(Value)
        SilentAim = Value
    end
})

SilentAimGB:AddToggle('TeamCheck', {
    Text = 'Team Check',
    Default = true,
    Callback = function(Value)
        TeamCheck = Value
    end
})

SilentAimGB:AddToggle('VisibleCheck', {
    Text = 'Visible Check',
    Default = true,
    Callback = function(Value)
        VisibleCheck = Value
    end
})

SilentAimGB:AddToggle('Snaplines', {
    Text = 'Snaplines',
    Default = true,
    Callback = function(Value)
        Snaplines = Value
    end
})

SilentAimGB:AddToggle('ShowFov', {
    Text = 'Show FOV',
    Default = true,
    Callback = function(Value)
        ShowFov = Value
    end
})

SilentAimGB:AddSlider('Fov', {
    Text = 'FOV',
    Default = 300,
    Min = 50,
    Max = 600,
    Rounding = 0,
    Callback = function(Value)
        Fov = Value
    end
})

SilentAimGB:AddDropdown('TargetBodyPart', {
    Values = { 'Head', 'Torso', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg', 'HumanoidRootPart' },
    Default = 'Head',
    Multi = false,
    Text = 'Target Part',
    Callback = function(Value)
        TargetBodyPart = Value
    end
})

SilentAimGB:AddToggle('InfiniteStamina', {
    Text = 'Infinite Stamina',
    Default = false,
    Callback = function(Value)
        InfiniteStamina = Value
        if Value then
            SetupInfiniteStamina()
        else
            if StaminaConnection then
                StaminaConnection:Enable()
                StaminaConnection = nil
            end
        end
    end
})

local GunmodsGB = Tabs.Combat:AddRightGroupbox('Gun Mods')

GunmodsGB:AddToggle('InfiniteAmmo', {
    Text = 'Infinite Ammo',
    Default = false,
    Callback = function(Value)
        InfiniteAmmo = Value
        
        if Value then
            if LocalPlayer.Character then
                SetupAmmoControl(LocalPlayer.Character)
            end
        else
            CleanupAmmoThreads()
        end
    end
})

local ModDetectionGroup = Tabs.Misc:AddRightGroupbox('Extra')
ModDetectionGroup:AddToggle('ModDetectionEnabled', {
    Text = 'Mod Detection',
    Default = true,
    Callback = function(Value)
        ModDetection = Value
        if Value then
            CheckPlayersInGroup()
        end
    end
})

local MenuGroup = Tabs.UISettings:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('skibidihook')
SaveManager:SetFolder('skibidihook/SCPretrobreach')
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()

Library:OnUnload(function()
    Library.Unloaded = true
end)
