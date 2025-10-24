if not game:IsLoaded() then
	game.Loaded:Wait()
end

local g = getgenv()
if g.skibidi_hook_loaded then
	return
else
	g.skibidi_hook_loaded = true
end

local url = "https://raw.githubusercontent.com/skibidihook/skibidi.hook/main/status.txt"
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function disableit()
	LocalPlayer:Kick("skibidihook: script disabled")
	task.wait(1)
	game:Shutdown()
end

local function isitdisable()
	local ok, resp = pcall(function()
		return game:HttpGet(url)
	end)
	if not ok then
		return false
	end
	return type(resp) == "string" and resp:lower():match("%f[%w]off%f[%W]") ~= nil
end

if isitdisable() then
	disableit()
	return
end

task.spawn(function()
	while true do
		task.wait(60)
		if isitdisable() then
			disableit()
			break
		end
	end
end)

local MarketplaceService = game:GetService("MarketplaceService")

local success, gameInfo = pcall(function()
	return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local GameName = success and gameInfo.Name or "UnknownGame"
local ConfigFolder = "skibidihook/" .. GameName

local Workspace          = game:GetService("Workspace")
local Camera             = Workspace.CurrentCamera
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local UserInputService   = game:GetService("UserInputService")
local ReplicatedFirst    = game:GetService("ReplicatedFirst")
local Lighting           = game:GetService("Lighting")
local RunService         = game:GetService("RunService")

local colorcorrection = Lighting:FindFirstChild("ColorCorrection")
if not (colorcorrection and colorcorrection:IsA("ColorCorrectionEffect")) then
    colorcorrection = Instance.new("ColorCorrectionEffect")
    colorcorrection.Name = "ColorCorrection"
    colorcorrection.Parent = Lighting
end

local MAX_RANGE = 400
local HUGE = math.huge
local V3 = Vector3.new
local V2 = Vector2.new
local C3 = Color3.new
local HSV = Color3.fromHSV
local NaN3 = V3(0 / 0, 0 / 0, 0 / 0)

local RaycastModule = ReplicatedFirst.Modules.Client.Utilities.Raycast
local RaycastLib = require(RaycastModule)
local PlayerHitEvent = RaycastLib.PlayerHit
local ShootRemote = ReplicatedStorage.Remotes.CarbonEngine.Shoot

local WeaponSystemGui = LocalPlayer.PlayerGui:FindFirstChild("WeaponSystem")
local WeaponSystemEnv = WeaponSystemGui and getsenv(WeaponSystemGui)

local anti_killcam_enabled = false
local anti_spectate_enabled = false

local recoil_percent   = 100
local spread_percent   = 100
local firerate_percent = 100

local is_full_auto          = false
local is_insta_aim          = false
local is_infinite_ammo      = false
local is_can_aim            = false
local is_can_bolt           = false
local is_can_shoot          = false
local is_instant_bolt       = false
local is_prevent_slide_lock = false

local weapon_originals = {}

local silent_aim                  = true
local silentaim_visible_check     = false
local bullet_tp                   = false
local force_headshot              = false
local fov_radius                  = 200
local silentaim_bodypart          = "Head"
local show_fov                    = true
local show_snapline               = true
local silentaim_rainbow_snaplines = false
local silentaim_rainbow_fov       = false

local killall = false
local ragebot_enabled = false
local ragebot_autoshoot = false

local group_detection_enabled = false
local speedhack_enabled = false
local speedhack_value = 32

local triggerbot_enabled = false
local triggerbot_delay_ms = 0
local triggerbot_last_fire = 0

local autoload_enabled = false

local r6_bodyparts = {
	"Head",
	"Torso",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg"
}
local aimlock_enabled = false
local aimlock_tracking = false
local aimlock_showfov = true
local aimlock_fov_radius = 200
local aimlock_smoothness = 0.12
local aimlock_fov_color = Color3.fromRGB(255, 255, 255)
local aimlock_highlight_target_enabled = false
local aimlock_rainbow_fov = false
local aimlock_rainbow_snaplines = false
local aimlock_snaplines_enabled = false
local aimlock_bodypart = "Head"
local aimlock_visible_check = false

local highlight_esp_enabled = false
local health_esp_enabled = false

local arm_chams_enabled = false
local arm_chams_color = Color3.fromRGB(255, 255, 255)
local arm_chams_material_name = "ForceField"
local arm_chams_materials = {
	"ForceField",
	"Neon",
	"Plastic",
	"SmoothPlastic",
	"Metal",
	"Glass",
	"Wood",
	"WoodPlanks",
	"Slate",
	"Concrete"
}
local arm_chams_material_map = {
	ForceField = Enum.Material.ForceField,
	Neon = Enum.Material.Neon,
	Plastic = Enum.Material.Plastic,
	SmoothPlastic = Enum.Material.SmoothPlastic,
	Metal = Enum.Material.Metal,
	Glass = Enum.Material.Glass,
	Wood = Enum.Material.Wood,
	WoodPlanks = Enum.Material.WoodPlanks,
	Slate = Enum.Material.Slate,
	Concrete = Enum.Material.Concrete,
}

local zoom_fov = 30
local original_fov = Camera.FieldOfView
local zoom_connection = nil

local customHitsounds = {
    ['panhit'] = 'https://github.com/skibidihook/skibidi.hook/raw/main/Assets/Hitsounds/panhit.wav',
    ['splatoon'] = 'https://github.com/skibidihook/skibidi.hook/raw/main/Assets/Hitsounds/splatoon.wav',
}

local predefinedSounds = {
    ['neverlose'] = '6607204501',
    ['osu'] = '7148004421',
    ['rust headshot'] = '4764109000'
}

local hitsound_selected = 'neverlose'
local hitsound_enabled = false

local function fetch_and_register_hitsound(name, url)
    local fileName = name .. ".wav"
    if not isfile(fileName) then
        local resp = request({Url = url, Method = "GET"})
        if resp and resp.StatusCode == 200 then
            writefile(fileName, resp.Body)
        end
    end
    return getcustomasset(fileName)
end

local silentaim_fov_circle = Drawing.new("Circle")
silentaim_fov_circle.Color = C3(1, 1, 1)
silentaim_fov_circle.Thickness = 2
silentaim_fov_circle.Filled = false
silentaim_fov_circle.Transparency = 1
silentaim_fov_circle.NumSides = 100
silentaim_fov_circle.Radius = fov_radius
silentaim_fov_circle.Visible = false

local silentaim_snapline = Drawing.new("Line")
silentaim_snapline.Color = C3(1, 1, 1)
silentaim_snapline.Thickness = 2
silentaim_snapline.Transparency = 1
silentaim_snapline.Visible = false

local aimlock_fov_circle = Drawing.new("Circle")
aimlock_fov_circle.Visible = false
aimlock_fov_circle.NumSides = 64
aimlock_fov_circle.Thickness = 2
aimlock_fov_circle.Filled = false
aimlock_fov_circle.Color = aimlock_fov_color
aimlock_fov_circle.Radius = aimlock_fov_radius

local aimlock_snapline = Drawing.new("Line")
aimlock_snapline.Thickness = 2
aimlock_snapline.Transparency = 0.9
aimlock_snapline.Visible = false
aimlock_snapline.Color = aimlock_fov_color

local visibleParams = RaycastParams.new()
visibleParams.FilterType = Enum.RaycastFilterType.Exclude

local mouseParams = RaycastParams.new()
mouseParams.FilterType = Enum.RaycastFilterType.Exclude

local function update_visibility_filter()
	local char = LocalPlayer.Character
	if char then
		visibleParams.FilterDescendantsInstances = {
			char
		}
		mouseParams.FilterDescendantsInstances = {
			char
		}
	else
		visibleParams.FilterDescendantsInstances = {}
		mouseParams.FilterDescendantsInstances = {}
	end
end
update_visibility_filter()
LocalPlayer.CharacterAdded:Connect(update_visibility_filter)

local function is_in_range(target_part, max_range)
	local lp_char = LocalPlayer.Character
	local lp_root = lp_char and lp_char:FindFirstChild("HumanoidRootPart")
	if not lp_root or not target_part then
		return false
	end
	return (lp_root.Position - target_part.Position).Magnitude <= max_range
end

local function is_visible(part)
	if not part then
		return false
	end
	local origin = Camera.CFrame.Position
	local dir = (part.Position - origin)
	local result = Workspace:Raycast(origin, dir, visibleParams)
	return result and result.Instance == part
end

local function valid_enemy_player(player)
	if player == LocalPlayer then
		return false
	end
	if not player.Character then
		return false
	end
	local humanoid = player.Character:FindFirstChild("Humanoid")
	if not humanoid or humanoid.Health <= 0 then
		return false
	end
	if player.Team == LocalPlayer.Team then
		return false
	end
	return true
end

local function get_closest_target(fov, bodypart_name, visible_check)
	local screen_center = V2(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	local closest_part, closest_player, min_dist = nil, nil, HUGE
	for _, player in ipairs(Players:GetPlayers()) do
		if valid_enemy_player(player) then
			local part = player.Character:FindFirstChild(bodypart_name)
			if part and is_in_range(part, MAX_RANGE) then
				if visible_check and not is_visible(part) then
				else
					local screen_pos, on_screen = Camera:WorldToViewportPoint(part.Position)
					if on_screen and screen_pos.Z > 0 then
						local dist = (V2(screen_pos.X, screen_pos.Y) - screen_center).Magnitude
						if dist < min_dist and dist < fov then
							min_dist = dist
							closest_part = part
							closest_player = player
						end
					end
				end
			end
		end
	end
	return closest_player, closest_part
end

local function get_closest_player(visible_check)
	local lp_char = LocalPlayer.Character
	local lp_root = lp_char and lp_char:FindFirstChild("HumanoidRootPart")
	if not lp_root then
		return nil
	end
	local closest, min_dist = nil, HUGE
	for _, player in ipairs(Players:GetPlayers()) do
		if valid_enemy_player(player) then
			local root = player.Character:FindFirstChild("HumanoidRootPart")
			local part = player.Character:FindFirstChild(silentaim_bodypart)
			if root then
				if visible_check and part and not is_visible(part) then
				else
					local dist = (lp_root.Position - root.Position).Magnitude
					if dist < min_dist and dist <= MAX_RANGE then
						min_dist = dist
						closest = player
					end
				end
			end
		end
	end
	return closest
end

local function get_mouse_enemy_hit()
	local mouse_pos = UserInputService:GetMouseLocation()
	local ray = Camera:ViewportPointToRay(mouse_pos.X, mouse_pos.Y)
	local result = Workspace:Raycast(ray.Origin, ray.Direction * 1e4, mouseParams)
	if not result then
		return nil
	end
	local inst = result.Instance
	if not inst then
		return nil
	end
	local model = inst:FindFirstAncestorOfClass("Model")
	if not model then
		return nil
	end
	local plr = Players:GetPlayerFromCharacter(model)
	if not plr or not valid_enemy_player(plr) then
		return nil
	end
	local humanoid = model:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then
		return nil
	end
	return plr, inst, humanoid
end

local function cache_original_weapon_values()
	local weapons_folder = ReplicatedFirst.Modules.Shared.Configs.Weapons
	for _, weapon_module in ipairs(weapons_folder:GetChildren()) do
		local ok, config = pcall(require, weapon_module)
		if ok and config then
			weapon_originals[weapon_module.Name] = table.clone(config)
		end
	end
end

local function apply_weapon_configurations()
	local weapons_folder = ReplicatedFirst.Modules.Shared.Configs.Weapons
	for _, weapon_module in ipairs(weapons_folder:GetChildren()) do
		local ok, config = pcall(require, weapon_module)
		if not ok or not config then
			warn("load failed for:", weapon_module.Name)
			continue
		end
		local original = weapon_originals[weapon_module.Name]
		if not original then
			warn("orig failed for:", weapon_module.Name)
			continue
		end
		local recoil_factor = recoil_percent / 100
		config.gunRecoilMin    = original.gunRecoilMin    * recoil_factor
		config.gunRecoilMax    = original.gunRecoilMax    * recoil_factor
		config.AimGunRecoilMin = original.AimGunRecoilMin * recoil_factor
		config.AimGunRecoilMax = original.AimGunRecoilMax * recoil_factor
		config.CamShakeMin     = original.CamShakeMin     * recoil_factor
		config.CamShakeMax     = original.CamShakeMax     * recoil_factor
		config.AimCamShakeMin  = original.AimCamShakeMin  * recoil_factor
		config.AimCamShakeMax  = original.AimCamShakeMax  * recoil_factor
		config.KickbackMin     = original.KickbackMin     * recoil_factor
		config.KickbackMax     = original.KickbackMax     * recoil_factor
		config.AimKickbackMin  = original.AimKickbackMin  * recoil_factor
		config.AimKickbackMax  = original.AimKickbackMax  * recoil_factor
		config.SideKickMin     = original.SideKickMin     * recoil_factor
		config.SideKickMax     = original.SideKickMax     * recoil_factor
		config.AimSideKickMin  = original.AimSideKickMin  * recoil_factor
		config.AimSideKickMax  = original.AimSideKickMax  * recoil_factor
		local spread_factor = spread_percent / 100
		config.MaxSpread = original.MaxSpread * spread_factor
		config.MinSpread = original.MinSpread * spread_factor
		local firerate_factor = math.max(firerate_percent / 100, 0.01)
		config.Firerate = original.Firerate / firerate_factor
		if is_full_auto then
			config.FireMode, config.AutoEnabled, config.SemiEnabled = 2, true, false
		else
			config.FireMode    = original.FireMode
			config.AutoEnabled = original.AutoEnabled
			config.SemiEnabled = original.SemiEnabled
		end
		if is_insta_aim then
			config.AimZoomSpeed = 100
			config.AimSpeedMult = 100
		else
			config.AimZoomSpeed = original.AimZoomSpeed
			config.AimSpeedMult = original.AimSpeedMult
		end
		if is_infinite_ammo then
			config.Ammo, config.StoredAmmo, config.MagCount = HUGE, HUGE, HUGE
		else
			config.Ammo       = original.Ammo
			config.StoredAmmo = original.StoredAmmo
			config.MagCount   = original.MagCount
		end
		config.CanAim       = is_can_aim            or original.CanAim
		config.CanBolt      = is_can_bolt           or original.CanBolt
		config.CanAutoBolt  = is_instant_bolt       or original.CanAutoBolt
		config.CanSlideLock = (not is_prevent_slide_lock and original.CanSlideLock) or false
	end
end

local function apply_weapon_canshoot()
	local wsGui = LocalPlayer.PlayerGui:FindFirstChild("WeaponSystem")
	local dataModule = wsGui and wsGui:FindFirstChild("WeaponData")
	local weapon_data = dataModule and require(dataModule)
	if weapon_data then
		weapon_data.CanShoot = is_can_shoot
	end
end

local function ragebot_fire()
	local target = get_closest_player(true)
	if not target or not target.Character then
		return
	end
	local part = target.Character:FindFirstChild(silentaim_bodypart)
	local humanoid = target.Character:FindFirstChild("Humanoid")
	if not part or not humanoid then
		return
	end
	ShootRemote:FireServer(humanoid, part.Name, NaN3, NaN3, part)
end

local mb1_down, mb2_down = false, false
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then
		return
	end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		mb1_down = true
	end
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		mb2_down = true
	end
	aimlock_tracking = mb1_down or mb2_down
end)
UserInputService.InputEnded:Connect(function(input, gp)
	if gp then
		return
	end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		mb1_down = false
	end
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		mb2_down = false
	end
	aimlock_tracking = mb1_down or mb2_down
end)

local original_raycast = RaycastLib.Raycast
RaycastLib.Raycast = function(self, shooter, bullet_data, ...)
	if shooter == LocalPlayer then
		if ragebot_enabled then
			local target = get_closest_player(true)
			local origin = bullet_data.origin
			if target and target.Character then
				local target_part = target.Character:FindFirstChild(silentaim_bodypart)
				local humanoid = target.Character:FindFirstChild("Humanoid")
				if target_part and humanoid and humanoid.Health > 0 and is_in_range(target_part, MAX_RANGE) and is_visible(target_part) then
					bullet_data.direction = (target_part.Position - origin).Unit
				end
			end
		elseif silent_aim then
			local origin = bullet_data.origin
			local _, target_part = get_closest_target(fov_radius, silentaim_bodypart, silentaim_visible_check)
			if target_part then
				if bullet_tp then
					origin = target_part.Position + V3(0, 5, 0)
					bullet_data.origin = origin
				end
				bullet_data.direction = (target_part.Position - origin).Unit
			end
		end
	end
	return original_raycast(self, shooter, bullet_data, ...)
end

local function play_hitsound()
    if not hitsound_enabled then return end
    local soundId
    if predefinedSounds[hitsound_selected] then
        soundId = "rbxassetid://" .. predefinedSounds[hitsound_selected]
    elseif customHitsounds[hitsound_selected] then
        soundId = fetch_and_register_hitsound(hitsound_selected, customHitsounds[hitsound_selected])
    end
    if not soundId then return end
    local old = Camera:FindFirstChild("skbhk_hitsound")
    if old then old:Destroy() end

    local sound = Instance.new("Sound")
    sound.Name = "skbhk_hitsound"
    sound.SoundId = soundId
    sound.Volume = 10
    sound.Parent = Camera
    sound.PlayOnRemove = true
    sound:Destroy()
end

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local killcamRemotes = {
    Remotes:FindFirstChild("Killcam"),
    Remotes:FindFirstChild("SendKillcamData"),
    Remotes:FindFirstChild("TriggerKillcam")
}
local UpdateSpectate = Remotes.Spectate:FindFirstChild("UpdateSpectate")

local old_namecall
old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if anti_killcam_enabled and not checkcaller() and method == "FireServer" then
        for _, remote in ipairs(killcamRemotes) do
            if self == remote then
                return
            end
        end
    end
    if anti_spectate_enabled and not checkcaller() and method == "FireServer" and self == UpdateSpectate then
        if typeof(args[1]) == "buffer" and buffer.len(args[1]) == 37 then
            for i = 0, 8 do
                buffer.writef32(args[1], i * 4, 0/0)
            end
            buffer.writeu8(args[1], 24, 0)
            for i = 0, 2 do
                buffer.writef32(args[1], 25 + i * 4, 0/0)
            end
        end
        return old_namecall(self, unpack(args))
    end
    if method == "Fire" and self == PlayerHitEvent then
        play_hitsound()
        if force_headshot then
            args[2] = "Head"
        end
        return old_namecall(self, table.unpack(args, 1, select("#", ...)))
    end
    if not checkcaller() and method == "FireServer" and self == ShootRemote then
        if bullet_tp then
            args[3] = NaN3
            args[4] = NaN3
        end
        if force_headshot then
            args[2] = "Head"
        end
        return old_namecall(self, table.unpack(args, 1, select("#", ...)))
    end
    return old_namecall(self, ...)
end))

local HitboxSettings = {
	HitboxEnabled = false,
	HitboxSize = Vector3.new(24, 24, 24),
	HitboxTransparency = 0.5,
	HitboxCanCollide = false,
}

local OriginalSizes = {}

local function StoreOriginalSizes()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local head = player.Character:FindFirstChild("Head")
			if head and head:IsA("BasePart") and not OriginalSizes[player] then
				OriginalSizes[player] = head.Size
			end
		end
	end
end

local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
	if not checkcaller() and key == "Size" and self:IsA("BasePart") and self.Name == "Head" then
		local character = self.Parent
		local player = Players:GetPlayerFromCharacter(character)
		if player and player ~= LocalPlayer and OriginalSizes[player] then
			return OriginalSizes[player]
		end
	end
	return oldIndex(self, key)
end)

local function UpdateHitboxes()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local head = player.Character:FindFirstChild("Head")
			if head and head:IsA("BasePart") then
				if HitboxSettings.HitboxEnabled then
					head.Size = HitboxSettings.HitboxSize
					head.Transparency = HitboxSettings.HitboxTransparency
					head.CanCollide = HitboxSettings.HitboxCanCollide
					head.Massless = true
				else
					head.Size = OriginalSizes[player] or Vector3.new(4, 5, 1.5)
					head.Transparency = 1
					head.CanCollide = false
					head.Massless = true
				end
			end
		end
	end
end

local function OnCharacterAdded(player)
	if player ~= LocalPlayer then
		player.CharacterAdded:Connect(function()
			task.wait(1)
			StoreOriginalSizes()
			if HitboxSettings.HitboxEnabled then
				UpdateHitboxes()
			end
		end)
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	OnCharacterAdded(player)
end
Players.PlayerAdded:Connect(OnCharacterAdded)

StoreOriginalSizes()
UpdateHitboxes()

local repo = "https://raw.githubusercontent.com/smi9/LinoriaLib/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager  = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

function update_zoom_state()
    if zoom_connection then
        zoom_connection:Disconnect()
        zoom_connection = nil
    end
    if not Toggles.ZoomEnabled.Value then
        Camera.FieldOfView = original_fov
        return
    end
    zoom_connection = RunService.RenderStepped:Connect(function()
        local active = Options.ZoomKey:GetState()
        if active then
            Camera.FieldOfView = zoom_fov
        else
            Camera.FieldOfView = original_fov
        end
    end)
end

local GROUP_ID = 8885174
local TARGET_RANKS_SET = {
	["Staff"] = true,
	["Helper"] = true,
	["Senior Staff"] = true,
	["Automation"] = true,
	["Department Director"] = true,
	["manny"] = true,
	["eno"] = true,
	["fyre"] = true,
}

local function check_player_group_rank(player)
	local ok, role = pcall(function()
		return player:GetRoleInGroup(GROUP_ID)
	end)
	if ok and role and TARGET_RANKS_SET[role] then
		return true, role
	end
	return false
end

local function notify_if_in_group(player)
	if not group_detection_enabled then
		return
	end
	local in_group, role = check_player_group_rank(player)
	if in_group then
		Library:Notify(string.format("%s (%s) from group %d is detected.", player.Name, role, GROUP_ID))
	end
end

local function check_players_in_group()
	if not group_detection_enabled then
		return
	end
	for _, p in ipairs(Players:GetPlayers()) do
		notify_if_in_group(p)
	end
end

Players.PlayerAdded:Connect(function(p)
	notify_if_in_group(p)
end)

local Window = Library:CreateWindow({
	Title = "skibidi.hook",
	Center = true,
	AutoShow = true,
})

local Tabs = {
	Combat     = Window:AddTab("Combat"),
	Visuals    = Window:AddTab("Visuals"),
	Misc       = Window:AddTab("Misc"),
	UISettings = Window:AddTab("UI Settings"),
}

local SilentAimGroupbox = Tabs.Combat:AddLeftGroupbox("Silent Aim")
SilentAimGroupbox:AddToggle("SilentAim", {
	Text = "Master Toggle",
	Default = silent_aim,
	Callback = function(v)
		silent_aim = v
	end,
})
SilentAimGroupbox:AddToggle("SilentAimVisible", {
	Text = "Visible Check",
	Default = silentaim_visible_check,
	Callback = function(v)
		silentaim_visible_check = v
	end,
})
SilentAimGroupbox:AddToggle("BulletTP", {
	Text = "Bullet TP",
	Default = bullet_tp,
	Callback = function(v)
		bullet_tp = v
	end,
})
SilentAimGroupbox:AddToggle("ShowSnapline", {
	Text = "Show Snapline",
	Default = show_snapline,
	Callback = function(v)
		show_snapline = v
	end,
})
SilentAimGroupbox:AddToggle("ShowFOV", {
	Text = "Show FOV",
	Default = show_fov,
	Callback = function(v)
		show_fov = v
	end,
})
SilentAimGroupbox:AddSlider("FOVRadius", {
	Text = "FOV Radius",
	Default = fov_radius,
	Min = 1,
	Max = 1000,
	Rounding = 0,
	Callback = function(v)
		fov_radius = v
	end,
})
SilentAimGroupbox:AddToggle("SilentAimRainbowFOV", {
	Text = "Rainbow FOV",
	Default = silentaim_rainbow_fov,
	Callback = function(v)
		silentaim_rainbow_fov = v
	end,
})
SilentAimGroupbox:AddToggle("SilentAimRainbowSnaplines", {
	Text = "Rainbow Snapline",
	Default = silentaim_rainbow_snaplines,
	Callback = function(v)
		silentaim_rainbow_snaplines = v
	end,
})
SilentAimGroupbox:AddDropdown("Bodypart", {
	Values = r6_bodyparts,
	Default = 1,
	Text = "Target Bodypart",
	Callback = function(v)
		silentaim_bodypart = v
	end,
})

local AimlockGroupbox = Tabs.Combat:AddRightGroupbox("Aimlock")
AimlockGroupbox:AddToggle("AimlockEnabled", {
	Text = "Master Toggle",
	Default = aimlock_enabled,
	Callback = function(v)
		aimlock_enabled = v
	end,
})
AimlockGroupbox:AddToggle("AimlockSnaplines", {
	Text = "Show Snapline",
	Default = aimlock_snaplines_enabled,
	Callback = function(v)
		aimlock_snaplines_enabled = v
	end,
})
AimlockGroupbox:AddToggle("AimlockHighlight", {
	Text = "Highlight Target",
	Default = aimlock_highlight_target_enabled,
	Callback = function(v)
		aimlock_highlight_target_enabled = v
	end,
})
AimlockGroupbox:AddToggle("AimlockShowFOV", {
	Text = "Show FOV",
	Default = aimlock_showfov,
	Callback = function(v)
		aimlock_showfov = v
	end,
})
AimlockGroupbox:AddToggle("AimlockVisible", {
	Text = "Visible Check",
	Default = aimlock_visible_check,
	Callback = function(v)
		aimlock_visible_check = v
	end,
})
AimlockGroupbox:AddToggle("AimlockRainbowFOV", {
	Text = "Rainbow FOV",
	Default = aimlock_rainbow_fov,
	Callback = function(v)
		aimlock_rainbow_fov = v
	end,
})
AimlockGroupbox:AddToggle("AimlockRainbowSnap", {
	Text = "Rainbow Snapline",
	Default = aimlock_rainbow_snaplines,
	Callback = function(v)
		aimlock_rainbow_snaplines = v
	end,
})
AimlockGroupbox:AddSlider("AimlockFOV", {
	Text = "FOV Radius",
	Default = aimlock_fov_radius,
	Min = 1,
	Max = 1000,
	Rounding = 0,
	Callback = function(v)
		aimlock_fov_radius = v
	end,
})
AimlockGroupbox:AddSlider("AimlockSmooth", {
	Text = "Smoothness",
	Default = aimlock_smoothness,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Callback = function(v)
		aimlock_smoothness = v
	end,
})
AimlockGroupbox:AddDropdown("AimlockBodypart", {
	Values = r6_bodyparts,
	Default = 1,
	Text = "Bodypart",
	Callback = function(v)
		aimlock_bodypart = v
	end,
})

local TriggerbotGroupbox = Tabs.Combat:AddLeftGroupbox("Triggerbot")
local TriggerbotToggle = TriggerbotGroupbox:AddToggle("TriggerbotEnabled", {
	Text = "Triggerbot",
	Default = triggerbot_enabled,
	Callback = function(v)
		triggerbot_enabled = v
	end,
})
TriggerbotToggle:AddKeyPicker("TriggerbotKey", {
	Default = "V",
	SyncToggleState = false,
	Mode = "Hold",
	Text = "Triggerbot Key",
	NoUI = false,
	Callback = function(v)
	end
})
TriggerbotGroupbox:AddSlider("TriggerbotDelay", {
	Text = "Delay (ms)",
	Default = triggerbot_delay_ms,
	Min = 0,
	Max = 500,
	Rounding = 0,
	Callback = function(v)
		triggerbot_delay_ms = v
	end,
})

local GunmodsGroupbox = Tabs.Combat:AddRightGroupbox("Gunmods")
GunmodsGroupbox:AddSlider("Recoil", {
	Text = "Recoil",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function(v)
		recoil_percent = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddSlider("Spread", {
	Text = "Spread",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function(v)
		spread_percent = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddSlider("Firerate", {
	Text = "Firerate",
	Default = 100,
	Min = 100,
	Max = 1000,
	Rounding = 0,
	Suffix = "%",
	Callback = function(v)
		firerate_percent = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("FullAuto", {
	Text = "Full Auto",
	Default = is_full_auto,
	Callback = function(v)
		is_full_auto = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("InstaAim", {
	Text = "Insta Aim",
	Default = is_insta_aim,
	Callback = function(v)
		is_insta_aim = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("InfiniteAmmo", {
	Text = "Infinite Ammo",
	Default = is_infinite_ammo,
	Callback = function(v)
		is_infinite_ammo = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("CanAim", {
	Text = "Can Aim",
	Default = is_can_aim,
	Callback = function(v)
		is_can_aim = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("CanBolt", {
	Text = "Can Bolt",
	Default = is_can_bolt,
	Callback = function(v)
		is_can_bolt = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("CanShoot", {
	Text = "Can Shoot",
	Default = is_can_shoot,
	Callback = function(v)
		is_can_shoot = v;
		apply_weapon_canshoot()
	end,
})
GunmodsGroupbox:AddToggle("InstantBolt", {
	Text = "Instant Bolt",
	Default = is_instant_bolt,
	Callback = function(v)
		is_instant_bolt = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("PreventSlideLock", {
	Text = "Prevent Slide Lock",
	Default = is_prevent_slide_lock,
	Callback = function(v)
		is_prevent_slide_lock = v;
		apply_weapon_configurations()
	end,
})
GunmodsGroupbox:AddToggle("ForceHeadshot", {
	Text = "Force Headshot",
	Default = force_headshot,
	Callback = function(v)
		force_headshot = v
	end,
})

local RagebotGroupbox = Tabs.Combat:AddLeftGroupbox("Ragebot")
RagebotGroupbox:AddToggle("Ragebot", {
	Text = "Ragebot",
	Default = ragebot_enabled,
	Callback = function(v)
		ragebot_enabled = v
	end,
})
RagebotGroupbox:AddToggle("RagebotAutoshoot", {
	Text = "Autoshoot",
	Default = ragebot_autoshoot,
	Callback = function(v)
		ragebot_autoshoot = v
	end,
})

local HitboxGroupbox = Tabs.Combat:AddRightGroupbox("Hitbox Expander")
HitboxGroupbox:AddToggle("HitboxEnabled", {
	Text = "Master Toggle",
	Default = HitboxSettings.HitboxEnabled,
	Callback = function(v)
		HitboxSettings.HitboxEnabled = v
		UpdateHitboxes()
	end,
})

HitboxGroupbox:AddSlider("HitboxSizeX", {
	Text = "Size X",
	Default = HitboxSettings.HitboxSize.X,
	Min = 1,
	Max = 100,
	Rounding = 1,
	Callback = function(v)
		HitboxSettings.HitboxSize = Vector3.new(v, HitboxSettings.HitboxSize.Y, HitboxSettings.HitboxSize.Z)
		UpdateHitboxes()
	end,
})

HitboxGroupbox:AddSlider("HitboxSizeY", {
	Text = "Size Y",
	Default = HitboxSettings.HitboxSize.Y,
	Min = 1,
	Max = 100,
	Rounding = 1,
	Callback = function(v)
		HitboxSettings.HitboxSize = Vector3.new(HitboxSettings.HitboxSize.X, v, HitboxSettings.HitboxSize.Z)
		UpdateHitboxes()
	end,
})

HitboxGroupbox:AddSlider("HitboxSizeZ", {
	Text = "Size Z",
	Default = HitboxSettings.HitboxSize.Z,
	Min = 1,
	Max = 100,
	Rounding = 1,
	Callback = function(v)
		HitboxSettings.HitboxSize = Vector3.new(HitboxSettings.HitboxSize.X, HitboxSettings.HitboxSize.Y, v)
		UpdateHitboxes()
	end,
})

HitboxGroupbox:AddSlider("HitboxTransparency", {
	Text = "Transparency",
	Default = HitboxSettings.HitboxTransparency,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Callback = function(v)
		HitboxSettings.HitboxTransparency = v
		UpdateHitboxes()
	end,
})

HitboxGroupbox:AddToggle("HitboxCanCollide", {
	Text = "Can Collide",
	Default = HitboxSettings.HitboxCanCollide,
	Callback = function(v)
		HitboxSettings.HitboxCanCollide = v
		UpdateHitboxes()
	end,
})

local AntiCheatGroupbox = Tabs.Combat:AddLeftGroupbox("Anti Cheater")
AntiCheatGroupbox:AddButton("Kill Closest", function()
	local target = get_closest_player(false)
	if target and target.Character then
		local humanoid = target.Character:FindFirstChild("Humanoid")
		local head = target.Character:FindFirstChild("Head")
		if humanoid and head and humanoid.Health > 0 and is_in_range(head, MAX_RANGE) then
			ShootRemote:FireServer(humanoid, "Head", NaN3, NaN3, head)
			Library:Notify("killed player: " .. target.Name)
		else
			Library:Notify("target missing required parts or is dead")
		end
	else
		Library:Notify("no valid target")
	end
end)
AntiCheatGroupbox:AddButton("Kill All", function()
	local lp_char = LocalPlayer.Character
	local lp_root = lp_char and lp_char:FindFirstChild("HumanoidRootPart")
	if not lp_root then
		return
	end
	for _, target in ipairs(Players:GetPlayers()) do
		if valid_enemy_player(target) then
			local humanoid = target.Character:FindFirstChild("Humanoid")
			local head = target.Character:FindFirstChild("Head")
			if humanoid and head and is_in_range(head, MAX_RANGE) then
				ShootRemote:FireServer(humanoid, "Head", NaN3, NaN3, head)
			end
		end
	end
end)
AntiCheatGroupbox:AddToggle("KillAllLoopClosest", {
	Text = "Kill All",
	Default = killall,
	Callback = function(v)
		killall = v
	end,
})

local VisualsGroupbox = Tabs.Visuals:AddLeftGroupbox("Player ESP")
VisualsGroupbox:AddToggle("HighlightESP", {
	Text = "Highlight ESP",
	Default = highlight_esp_enabled,
	Callback = function(v)
		highlight_esp_enabled = v
	end,
})
VisualsGroupbox:AddToggle("HealthESP", {
	Text = "Health ESP",
	Default = health_esp_enabled,
	Callback = function(v)
		health_esp_enabled = v
	end,
})

local ArmChamsGroupbox = Tabs.Visuals:AddRightGroupbox("Local")
ArmChamsGroupbox:AddToggle("ArmChamsEnabled", {
	Text = "Arm Chams",
	Default = arm_chams_enabled,
	Callback = function(v)
		arm_chams_enabled = v
	end,
})
do
	local label = ArmChamsGroupbox:AddLabel("Chams Color")
	label:AddColorPicker("ArmChamsColor", {
		Default = arm_chams_color,
		Title = "Arm Chams Color",
		Callback = function(col)
			arm_chams_color = col
		end
	})
end
ArmChamsGroupbox:AddDropdown("ArmChamsMaterial", {
	Values = arm_chams_materials,
	Default = table.find(arm_chams_materials, arm_chams_material_name) or 1,
	Text = "Material",
	Callback = function(v)
		arm_chams_material_name = v
	end
})

local ZoomToggle = ArmChamsGroupbox:AddToggle("ZoomEnabled", {
    Text = "Zoom",
    Default = false,
    Callback = function(v)
        update_zoom_state()
    end,
})

ZoomToggle:AddKeyPicker("ZoomKey", {
    Default = "Z",
    SyncToggleState = false,
    Mode = "Hold",
    Text = "Zoom Key",
    NoUI = false,
    Callback = function(v)
        update_zoom_state()
    end,
    ChangedCallback = function(new)
        update_zoom_state()
    end,
})

ArmChamsGroupbox:AddSlider("ZoomFOV", {
    Text = "Zoom FOV",
    Default = zoom_fov,
    Min = 5,
    Max = 120,
    Rounding = 0,
    Callback = function(v)
        zoom_fov = v
        update_zoom_state()
    end,
})

local WorldGroupbox = Tabs.Visuals:AddRightGroupbox('Lighting')

WorldGroupbox:AddToggle('WorldSaturation', {
	Text = 'Saturation',
	Default = false,
	Callback = function(val)
		if val then
			colorcorrection.Saturation = 1
		else
			colorcorrection.Saturation = 0
		end
	end
})

local MovementGroupbox = Tabs.Misc:AddLeftGroupbox("Movement")
MovementGroupbox:AddToggle("Speedhack", {
	Text = "Speedhack",
	Default = speedhack_enabled,
	Callback = function(v)
		speedhack_enabled = v
	end,
})
MovementGroupbox:AddSlider("SpeedhackValue", {
	Text = "Speed",
	Default = speedhack_value,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Callback = function(v)
		speedhack_value = v
	end,
})

local MiscGroupbox = Tabs.Misc:AddRightGroupbox("Other")
MiscGroupbox:AddToggle("ModDetection", {
	Text = "Mod Detection",
	Default = group_detection_enabled,
	Callback = function(v)
		group_detection_enabled = v
		if v then
			check_players_in_group()
		end
	end,
})
MiscGroupbox:AddToggle("AntiKillcamToggle", {
    Text = "Anti Killcam",
    Default = anti_killcam_enabled,
    Callback = function(v)
        anti_killcam_enabled = v
    end,
})
MiscGroupbox:AddToggle("AntiSpectate", {
    Text = "Anti-Spectate",
    Default = anti_spectate_enabled,
    Callback = function(val)
        anti_spectate_enabled = val
    end,
})

local AutoloadGroupbox = Tabs.Misc:AddRightGroupbox("Autoload")
AutoloadGroupbox:AddToggle("AutoloadEnabled", {
	Text = "Autoload",
	Default = autoload_enabled,
	Callback = function(v)
		autoload_enabled = v
		if v then
			local qot = queue_on_teleport
			if qot then
				qot([[
loadstring(game:HttpGet('https://raw.githubusercontent.com/skibidihook/skibidi.hook/refs/heads/main/ok.luau'))()
                ]])
				Library:Notify("ready to autoload!")
			else
				Library:Notify("sorry ur executor is bad")
			end
		end
	end,
})

local allHitsounds = {}
for k, _ in pairs(predefinedSounds) do table.insert(allHitsounds, k) end
for k, _ in pairs(customHitsounds) do table.insert(allHitsounds, k) end

local HitsoundGroupbox = Tabs.Misc:AddLeftGroupbox("Hitsounds")
HitsoundGroupbox:AddToggle("HitsoundEnabled", {
    Text = "Master Toggle",
    Default = hitsound_enabled,
    Callback = function(v)
        hitsound_enabled = v
    end,
})

HitsoundGroupbox:AddDropdown("HitsoundDropdown", {
    Values = allHitsounds,
    Default = 1,
    Text = "Select Hitsound",
    Callback = function(v)
        hitsound_selected = v
    end,
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


local highlights = {}
local health_drawings = {}

Players.PlayerRemoving:Connect(function(p)
	local h = highlights[p]
	if h then
		h:Destroy()
	end
	highlights[p] = nil
	local txt = health_drawings[p]
	if txt then
		txt:Remove()
	end
	health_drawings[p] = nil
end)

local aimlock_highlight_obj = nil
local aimlock_highlight_target = nil

local function triggerbot_click(humanoid, part)
	if mouse1click then
		mouse1click()
		return
	end
	if mouse1press then
		mouse1press()
		task.wait(0.05)
		if mouse1release then
			mouse1release()
		end
		return
	end
	if ShootRemote and humanoid and part then
		pcall(function()
			ShootRemote:FireServer(humanoid, part.Name, NaN3, NaN3, part)
		end)
	end
end

local function apply_arm_chams()
	if not arm_chams_enabled then
		return
	end
	local arm_model = Camera:FindFirstChild("ArmModel")
	if not arm_model then
		return
	end
	local mat = arm_chams_material_map[arm_chams_material_name] or Enum.Material.ForceField
	local left = arm_model:FindFirstChild("Left Arm")
	local right = arm_model:FindFirstChild("Right Arm")
	if left and left:IsA("BasePart") then
		left.Color = arm_chams_color
		left.Material = mat
	end
	if right and right:IsA("BasePart") then
		right.Color = arm_chams_color
		right.Material = mat
	end
end

RunService.RenderStepped:Connect(function()
	for player, hl in pairs(highlights) do
		if not highlight_esp_enabled or not player or not player.Character then
			if hl then
				hl:Destroy()
			end
			highlights[player] = nil
		end
	end
	for player, txt in pairs(health_drawings) do
		if not health_esp_enabled or not player or not player.Character then
			if txt then
				txt.Visible = false
			end
			if not health_esp_enabled then
				txt:Remove()
				health_drawings[player] = nil
			end
		end
	end
	for _, player in ipairs(Players:GetPlayers()) do
		if valid_enemy_player(player) then
			local root = player.Character:FindFirstChild("HumanoidRootPart")
			local humanoid = player.Character:FindFirstChild("Humanoid")
			if root and humanoid and is_in_range(root, MAX_RANGE) then
				if highlight_esp_enabled then
					if not highlights[player] then
						local hl = Instance.new("Highlight")
						hl.Parent = player.Character
						hl.FillColor = C3(0.407843, 0.419607, 0.435294)
						hl.OutlineColor = C3(0.070588, 0.443137, 0.843137)
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlights[player] = hl
					end
				end
				if health_esp_enabled then
					local screen_pos, on_screen = Camera:WorldToViewportPoint(root.Position + V3(0, 3, 0))
					if not health_drawings[player] then
						local txt = Drawing.new("Text")
						txt.Size = 18
						txt.Center = true
						txt.Outline = true
						txt.Color = Color3.fromRGB(255, 0, 0)
						txt.Transparency = 1
						health_drawings[player] = txt
					end
					local txt = health_drawings[player]
					if on_screen and screen_pos.Z > 0 then
						txt.Position = V2(screen_pos.X, screen_pos.Y)
						txt.Text = string.format("HP: %d", math.floor(humanoid.Health))
						txt.Visible = true
					else
						txt.Visible = false
					end
				end
			else
				local hl = highlights[player]
				if hl then
					hl:Destroy()
				end
				highlights[player] = nil
				local txt = health_drawings[player]
				if txt then
					txt.Visible = false
				end
			end
		end
	end
	local center = V2(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	local rainbow_t = (os.clock() % 5) / 5
	silentaim_fov_circle.Position = center
	silentaim_fov_circle.Radius = fov_radius
	silentaim_fov_circle.Visible = show_fov and silent_aim
	silentaim_fov_circle.Color = silentaim_rainbow_fov and HSV(rainbow_t, 1, 1) or C3(1, 1, 1)
	local _, sa_part = get_closest_target(fov_radius, silentaim_bodypart, silentaim_visible_check)
	silentaim_snapline.Visible = false
	if show_snapline and silent_aim and sa_part then
		local sp, on = Camera:WorldToViewportPoint(sa_part.Position)
		if on then
			silentaim_snapline.From = center
			silentaim_snapline.To = V2(sp.X, sp.Y)
			silentaim_snapline.Visible = true
			silentaim_snapline.Color = silentaim_rainbow_snaplines and HSV(rainbow_t, 1, 1) or C3(1, 1, 1)
		end
	end
	aimlock_fov_circle.Position = center
	aimlock_fov_circle.Radius = aimlock_fov_radius
	aimlock_fov_circle.Visible = aimlock_showfov and aimlock_enabled
	aimlock_fov_circle.Color = aimlock_rainbow_fov and HSV(rainbow_t, 1, 1) or aimlock_fov_color
	local al_player, al_part = get_closest_target(aimlock_fov_radius, aimlock_bodypart, aimlock_visible_check)
	aimlock_snapline.Visible = false
	if aimlock_snaplines_enabled and aimlock_enabled and al_part then
		local sp, on = Camera:WorldToViewportPoint(al_part.Position)
		if on then
			aimlock_snapline.From = center
			aimlock_snapline.To = V2(sp.X, sp.Y)
			aimlock_snapline.Visible = true
			aimlock_snapline.Color = aimlock_rainbow_snaplines and HSV(rainbow_t, 1, 1) or aimlock_fov_color
		end
	end
	if not aimlock_highlight_target_enabled or not al_player or not al_player.Character or not aimlock_enabled then
		if aimlock_highlight_obj then
			aimlock_highlight_obj:Destroy()
		end
		aimlock_highlight_obj = nil
		aimlock_highlight_target = nil
	else
		if al_player ~= aimlock_highlight_target then
			if aimlock_highlight_obj then
				aimlock_highlight_obj:Destroy()
			end
			aimlock_highlight_obj = Instance.new("Highlight")
			aimlock_highlight_obj.Parent = al_player.Character
			aimlock_highlight_obj.FillColor = C3(1, 1, 0)
			aimlock_highlight_obj.OutlineColor = C3(1, 1, 1)
			aimlock_highlight_obj.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			aimlock_highlight_target = al_player
		elseif aimlock_highlight_obj and aimlock_highlight_obj.Parent ~= al_player.Character then
			aimlock_highlight_obj.Parent = al_player.Character
		end
	end
	if aimlock_enabled and aimlock_tracking and al_part then
		local sp = Camera:WorldToViewportPoint(al_part.Position)
		local mp = UserInputService:GetMouseLocation()
		local delta = (V2(sp.X, sp.Y) - V2(mp.X, mp.Y)) * aimlock_smoothness
		if mousemoverel then
			mousemoverel(delta.X, delta.Y)
		end
	end
	local TriggerbotKey = Options.TriggerbotKey
	local triggerbot_active = triggerbot_enabled and TriggerbotKey:GetState()
	if triggerbot_active then
		local now = time()
		if (now - triggerbot_last_fire) >= (triggerbot_delay_ms / 1000) then
			local hitPlayer, hitPart, hitHumanoid = get_mouse_enemy_hit()
			if hitPlayer and hitPart and hitHumanoid then
				triggerbot_last_fire = now
				task.spawn(function()
					task.wait(triggerbot_delay_ms / 1000)
					local p2, part2, hum2 = get_mouse_enemy_hit()
					if triggerbot_enabled and TriggerbotKey:GetState() and p2 and hum2 then
						triggerbot_click(hum2, part2)
					end
				end)
			end
		end
	end
	if killall then
		local target = get_closest_player(false)
		if target and target.Character then
			local humanoid = target.Character:FindFirstChild("Humanoid")
			local head = target.Character:FindFirstChild("Head")
			if humanoid and head and humanoid.Health > 0 and is_in_range(head, MAX_RANGE) then
				ShootRemote:FireServer(humanoid, "Head", NaN3, NaN3, head)
			end
		end
	end
	if ragebot_enabled and ragebot_autoshoot then
		ragebot_fire()
	end
	if speedhack_enabled then
		local char = LocalPlayer.Character
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if humanoid and hrp then
			local dir = humanoid.MoveDirection
			if dir.Magnitude > 0 then
				local planar = V3(dir.X, 0, dir.Z)
				if planar.Magnitude > 0 then
					planar = planar.Unit * speedhack_value
					local cur = hrp.AssemblyLinearVelocity
					hrp.AssemblyLinearVelocity = V3(planar.X, cur.Y, planar.Z)
					pcall(function()
						local legacy = hrp.Velocity
						hrp.Velocity = V3(planar.X, legacy.Y, planar.Z)
					end)
				end
			end
		end
	end
	if arm_chams_enabled then
		apply_arm_chams()
	end
end)
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({
	"MenuKeybind"
})
ThemeManager:SetFolder("skibidihook")
SaveManager:SetFolder(ConfigFolder)
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
cache_original_weapon_values()
apply_weapon_configurations()
apply_weapon_canshoot()
SaveManager:LoadAutoloadConfig()