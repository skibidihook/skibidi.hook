--// Design & Scripting by minerlover

--// Variables & Constants

cloneref = cloneref or function(i)
	return i
end

clonefunction = clonefunction or function(f)
	return f
end

protect_gui = protect_gui
	or protectgui
	or (syn and syn.protect_gui)
	or function(gui)
		return gui
	end

gethui = gethui
	or function()
		local success, result = pcall(function()
			local cg = game:GetService('CoreGui')
			return cg:FindFirstChild('RobloxGui') or cg
		end)
		return success and result or game:GetService('CoreGui')
	end

function ui_parent()
	local parent
	local success, result = pcall(function()
		return gethui()
	end)
	if success and result and typeof(result) == 'Instance' then
		parent = protect_gui(result)
	end
	if not parent or not parent.Parent then
		local cg = game:GetService('CoreGui')
		if cg then
			local robloxGui = cg:FindFirstChild('RobloxGui')
			if robloxGui then
				parent = protect_gui(robloxGui)
			end
		end
	end
	if not parent or not parent.Parent then
		local cg = game:GetService('CoreGui')
		if cg then
			parent = protect_gui(cg)
		end
	end
	if not parent or not parent.Parent then
		local players = game:GetService('Players')
		local lp = players.LocalPlayer
		if lp then
			parent = lp:FindFirstChild('PlayerGui')
				or lp:WaitForChild('PlayerGui')
		end
	end
	return parent
end


--// Main

local Library = {}

local camera = workspace.CurrentCamera
local viewportSize = camera.ViewportSize


local nTable = {
	main_color = Color3.fromRGB(85, 85, 255),
	border_color = Color3.fromRGB(38, 38, 115),
	lib_name = "noname"
}

--// Functions

local function getService(name)
	if (name and typeof(name) == 'string') then
		return game.GetService(game, name)
	end 
end

function Library:validate(defaults, options)
	local opt_lc = {}
	for k, v in pairs(options) do
		opt_lc[string.lower(k)] = v
	end
	for i, v in pairs(defaults) do
		local found = opt_lc[string.lower(i)]
		if found == nil then
			options[i] = v
		else
			options[i] = found
		end
	end
	return options
end

local players = getService('Players')
local myPlayer = players.LocalPlayer
local mouse = myPlayer:GetMouse()


function Library:create(options)
	options = Library:validate({
		color = Color3.fromRGB(255, 25, 207),
		border_color = Color3.fromRGB(98, 10, 80),
		name = "unknown_library",
		logo = "rbxassetid://95571520599338",
		open_bind = Enum.KeyCode.RightShift		
	}, options or {})
	nTable.main_color = options.color
	nTable.lib_name = options.name
	nTable.border_color = options.border_color
	local Miner = {
		CurrentTab = nil,
		listsOpened = {},
		sectors = {}
	}
	
	--// Main Window Render
	
	do
		
		Miner["1"] = Instance.new("ScreenGui")
		Miner["1"].Parent = ui_parent()
		Miner["1"]["IgnoreGuiInset"] = true;
		Miner["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		Miner["1"]["Name"] = math.random(999999, 10000000);
		Miner["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Global;
		
		
		-- StarterGui.skibidihook.GlowEffect
		Miner["glow"] = Instance.new("ImageLabel", Miner["1"]);
		Miner["glow"]["ZIndex"] = -1;
		Miner["glow"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
		Miner["glow"]["ImageColor3"] = options.color;
		Miner["glow"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Miner["glow"]["Image"] = [[http://www.roblox.com/asset/?id=6906809185]];
		Miner["glow"].ImageTransparency = 0.5;
		Miner["glow"]["Size"] = UDim2.new(0, 800, 0, 534);
		Miner["glow"]["BorderColor3"] = Color3.fromRGB(29, 44, 55);
		Miner["glow"]["BackgroundTransparency"] = 1;
		Miner["glow"]["Name"] = [[GlowEffect]];
		Miner["glow"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


		-- StarterGui.skibidihook.GlowEffect.Main
		Miner["2"] = Instance.new("Frame", Miner["glow"]);
		Miner["2"]["ZIndex"] = 0;
		Miner["2"]["BorderSizePixel"] = 0;
		Miner["2"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
		Miner["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Miner["2"]["ClipsDescendants"] = true;
		Miner["2"]["Size"] = UDim2.new(0, 735, 0, 487);
		Miner["2"]["Position"] = UDim2.new(0.5,0,0.5,0) -- UDim2.fromOffset((viewportSize.X/2) - (Miner["2"].Size.X.Offset / 2), (viewportSize.Y/2) - (Miner["2"].Size.Y.Offset / 2));
		Miner["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Miner["2"]["Name"] = [[Main]];
		
		Miner["3"] = Instance.new("UICorner", Miner["2"]);
		Miner["3"]["CornerRadius"] = UDim.new(0, 5);
		Miner["4"] = Instance.new("UIStroke", Miner["2"]);
		Miner["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		Miner["4"]["Thickness"] = 2;
		Miner["4"]["Color"] = Color3.fromRGB(31, 31, 31);
		Miner["5"] = Instance.new("Frame", Miner["2"]);
		Miner["5"]["BorderSizePixel"] = 0;
		Miner["5"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		Miner["5"]["Size"] = UDim2.new(0, 162, 0, 487);
		Miner["5"]["Position"] = UDim2.new(0, 70, 0, 0);
		Miner["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Miner["5"]["Name"] = [[tabInTab]];
		Miner["d"] = Instance.new("Frame", Miner["2"]);
		Miner["d"]["BorderSizePixel"] = 0;
		Miner["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Miner["d"]["Size"] = UDim2.new(0, 62, 0, 423);
		Miner["d"]["Position"] = UDim2.new(0, 3, 0, 50);
		Miner["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Miner["d"]["Name"] = [[container]];
		Miner["d"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.skibidihook.GlowEffect.Main.Logo
		Miner["logo"] = Instance.new("ImageLabel", Miner["2"]);
		Miner["logo"]["BorderSizePixel"] = 0;
		Miner["logo"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
		Miner["logo"]["Image"] = options.logo;
		Miner["logo"]["Size"] = UDim2.new(0, 38, 0, 38);
		Miner["logo"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Miner["logo"]["BackgroundTransparency"] = 1;
		Miner["logo"]["Name"] = [[Logo]];
		Miner["logo"]["Position"] = UDim2.new(0.02031, 0, 0.0176, 0);
		
		Miner["e"] = Instance.new("UIListLayout", Miner["d"]);
		Miner["e"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		Miner["e"]["Padding"] = UDim.new(0, 5);
		Miner["19"] = Instance.new("Frame", Miner["2"]);
		Miner["19"]["BorderSizePixel"] = 0;
		Miner["19"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
		Miner["19"]["Size"] = UDim2.new(0, 480, 0, 467);
		Miner["19"]["Position"] = UDim2.new(0, 245, 0, 14);
		Miner["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Miner["19"]["Name"] = [[tabs]];
		Miner["19"]["BackgroundTransparency"] = 1;
	end
	
	--// Render Colorpicker
	
	
	game:GetService("UserInputService").InputBegan:Connect(function(i, gpe)
		if (i.KeyCode == options.open_bind and not gpe) then
			Miner["1"].Enabled = not Miner["1"].Enabled
		end
	end)
	
	--// Dragging
	
	local UIS = game:GetService('UserInputService')
	local frame = Miner["glow"]
	local dragToggle = nil
	local dragSpeed = 0.05
	local dragStart = nil
	local startPos = nil
	local topHeight = 50

	local function isInputOnTopPart(input)
		local frameTop = frame.AbsolutePosition.Y
		local frameBottom = frameTop + frame.AbsoluteSize.Y
		return input.Position.Y >= frameTop and input.Position.Y <= frameTop + topHeight
	end

	local function updateInput(input)
		if (Miner["glow"].Visible == false) then
			return
		end

		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then

			if isInputOnTopPart(input) then
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)


	--// Navigation
	
	function Miner:newTab(options)
		options = Library:validate({
			name = "none",
			icon = "rbxassetid://9762988755"
		}, options or {})
		local Tab = {
			Hover = false,
			Active = false,
			Contents = {}
		}
		--// navigation creation & controller
		Tab["f"] = Instance.new("Frame", Miner["d"]);
		Tab["f"]["BorderSizePixel"] = 0;
		Tab["f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		Tab["f"]["Size"] = UDim2.new(0, 47, 0, 42);
		Tab["f"]["Position"] = UDim2.new(0.08824, 0, 0, 0);
		Tab["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["f"]["BackgroundTransparency"] = 1;
		Tab["10"] = Instance.new("UICorner", Tab["f"]);
		Tab["10"]["CornerRadius"] = UDim.new(0, 5);
		Tab["11"] = Instance.new("UIStroke", Tab["f"]);
		Tab["11"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		Tab["11"]["Color"] = Color3.fromRGB(31, 31, 31);
		Tab["11"]["Transparency"] = 1;
		Tab["12"] = Instance.new("ImageLabel", Tab["f"]);
		Tab["12"]["BorderSizePixel"] = 0;
		Tab["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Tab["12"]["Image"] = options.icon;
		Tab["12"]["Size"] = UDim2.new(0, 38, 0, 38);
		Tab["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["12"]["BackgroundTransparency"] = 1;
		Tab["12"]["Name"] = [[iconfr]];
		Tab["12"]["Position"] = UDim2.new(0.18085, 0, 0.14286, 0);
		Tab["13"] = Instance.new("UIGridLayout", Tab["f"]);
		Tab["13"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		Tab["13"]["CellSize"] = UDim2.new(0, 30, 0, 30);
		Tab["13"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
		Tab["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		Tab["12"].MouseEnter:Connect(function()
			if (Tab.Active) then
				Tab.Hover = false
				return
			end
			Tab.Hover = true
			getService('TweenService'):Create(Tab["12"], TweenInfo.new(.25), {ImageColor3 = Color3.fromRGB(163, 163, 163)}):Play()
		end)
		Tab["12"].MouseLeave:Connect(function()
			if (Tab.Active) then
				Tab.Hover = false
				return
			end
			Tab.Hover = false
			getService('TweenService'):Create(Tab["12"], TweenInfo.new(.25), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		end)
		Tab["12"].InputBegan:Connect(function(i, gpe)
			if (gpe) then return end
			if (i.UserInputType == Enum.UserInputType.MouseButton1 and Tab.Hover) then
				if (Miner.CurrentTab == nil) then
					Tab.Active = true
					Miner.CurrentTab = Tab
					getService('TweenService'):Create(Tab["f"], TweenInfo.new(.5), {BackgroundTransparency = 0}):Play()
					getService('TweenService'):Create(Tab["11"], TweenInfo.new(.5), {Transparency = 0}):Play()
					getService('TweenService'):Create(Tab["12"], TweenInfo.new(.5), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					
					for i,v in pairs(Miner["19"]:GetChildren()) do
						if (v:IsA('Frame')) then
							v.Visible = false
						end
					end
					
					pcall(function()
						Miner["5"][options.name].Visible = true
						Miner["19"][options.name].Visible = true
					end)
				else
					Tab.Active = true
					getService('TweenService'):Create(Miner.CurrentTab["f"], TweenInfo.new(.5), {BackgroundTransparency = 1}):Play()
					getService('TweenService'):Create(Miner.CurrentTab["11"], TweenInfo.new(.5), {Transparency = 1}):Play()
					getService('TweenService'):Create(Tab["f"], TweenInfo.new(.5), {BackgroundTransparency = 0}):Play()
					getService('TweenService'):Create(Tab["11"], TweenInfo.new(.5), {Transparency = 0}):Play()
					getService('TweenService'):Create(Tab["12"], TweenInfo.new(.5), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					Miner.CurrentTab.Active = false
					Miner.CurrentTab = Tab
					
					for i,v in pairs(Miner["19"]:GetChildren()) do
						if (v:IsA('Frame')) then
							v.Visible = false
						end
					end
					
					for i,v in pairs(Miner["5"]:GetChildren()) do
						if v:IsA('Frame') then
							v.Visible = false
						end
					end
					pcall(function()
						Miner["5"][options.name].Visible = true
						Miner["19"][options.name].Visible = true
					end)
				end
			end
		end)
		
		function Tab:newSector(options)
			options = Library:validate({
				name = "holder",
				list = {}
			}, options or {})
			local Sector = {
				CurrentSector = nil,
				lists = {}
			}
			do
				Sector["6"] = Instance.new("Frame", Miner["5"]);
				Sector["6"]["BorderSizePixel"] = 0;
				Sector["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Sector["6"]["Size"] = UDim2.new(0, 162, 0, 487);
				Sector["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Sector["6"]["Name"] = options.name;
				Sector["6"]["BackgroundTransparency"] = 1;
				Sector["6"].Visible = false
				Sector["c"] = Instance.new("UIPadding", Sector["6"]);
				Sector["c"]["PaddingTop"] = UDim.new(0, 14);
				Sector["d"] = Instance.new("UIListLayout", Sector["6"]);
				Sector["d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
				Sector["d"]["Padding"] = UDim.new(0, 5);
				Sector["d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			local fromList = options.list
			
			Sector["2f"] = Instance.new("Frame", Miner["19"]);
			Sector["2f"]["BorderSizePixel"] = 0;
			Sector["2f"].Visible = false
			Sector["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Sector["2f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Sector["2f"]["Size"] = UDim2.new(0, 480, 0, 467);
			Sector["2f"]["Position"] = UDim2.new(0, 240, 0, 233);
			Sector["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Sector["2f"]["Name"] = options.name;
			Sector["2f"]["BackgroundTransparency"] = 1;
			
			for i,v in pairs(fromList) do
				local vName = v.name or "no_text"
				Sector.lists[vName] = {
					Active = false,
					Hover = false
				}
				Sector.lists[vName]["e"] = Instance.new("Frame", Sector["6"]);
				Sector.lists[vName]["e"]["BorderSizePixel"] = 0;
				Sector.lists[vName]["e"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
				Sector.lists[vName]["e"]["Size"] = UDim2.new(0, 147, 0, 26);
				Sector.lists[vName]["e"]["Position"] = UDim2.new(0, 8, 0, 0);
				Sector.lists[vName]["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Sector.lists[vName]["e"]["Name"] = "tab_"..vName;
				Sector.lists[vName]["e"]["BackgroundTransparency"] = 1;
				Sector.lists[vName]["f"] = Instance.new("UICorner", Sector.lists[vName]["e"]);
				Sector.lists[vName]["f"]["CornerRadius"] = UDim.new(0, 4);
				Sector.lists[vName]["10"] = Instance.new("UIStroke", Sector.lists[vName]["e"]);
				Sector.lists[vName]["10"]["Transparency"] = 1;
				Sector.lists[vName]["10"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Sector.lists[vName]["10"]["Thickness"] = 1.5;
				Sector.lists[vName]["10"]["Color"] = Color3.fromRGB(40, 40, 40);
				Sector.lists[vName]["a"] = Instance.new("TextLabel", Sector.lists[vName]["e"]);
				Sector.lists[vName]["a"]["TextWrapped"] = true;
				Sector.lists[vName]["a"]["BorderSizePixel"] = 0;
				Sector.lists[vName]["a"]["TextSize"] = 17;
				Sector.lists[vName]["a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Sector.lists[vName]["a"]["TextScaled"] = true;
				Sector.lists[vName]["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Sector.lists[vName]["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				Sector.lists[vName]["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Sector.lists[vName]["a"]["BackgroundTransparency"] = 1;
				Sector.lists[vName]["a"]["Size"] = UDim2.new(0, 134, 0, 26);
				Sector.lists[vName]["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Sector.lists[vName]["a"]["Text"] = vName;
				Sector.lists[vName]["a"]["Name"] = [[sometext]];
				Sector.lists[vName]["a"]["Position"] = UDim2.new(0, 7, 0, 0);
				Sector.lists[vName]["b"] = Instance.new("UITextSizeConstraint", Sector.lists[vName]["a"]);
				Sector.lists[vName]["b"]["MaxTextSize"] = 17;
				Sector.lists[vName]["7"] = Instance.new("Frame", Sector.lists[vName]["5"]);
				Sector.lists[vName]["7"]["BorderSizePixel"] = 0;
				Sector.lists[vName]["7"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
				Sector.lists[vName]["7"]["Size"] = UDim2.new(0, 147, 0, 26);
				Sector.lists[vName]["7"]["Position"] = UDim2.new(0, 8, 0, 0);
				Sector.lists[vName]["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Sector.lists[vName]["7"]["BackgroundTransparency"] = 1;
				Sector.lists[vName]["a"].MouseEnter:Connect(function()
					if (Sector.lists[vName].Active) then
						Sector.lists[vName].Hover = false
						return
					end
					Sector.lists[vName].Hover = true
					getService('TweenService'):Create(Sector.lists[vName]["e"], TweenInfo.new(.5), {BackgroundTransparency = 0}):Play()
					getService('TweenService'):Create(Sector.lists[vName]["10"], TweenInfo.new(.5), {Transparency = 0}):Play()
					getService('TweenService'):Create(Sector.lists[vName]["a"], TweenInfo.new(.5), {TextColor3 = Color3.fromRGB(163,163,163)}):Play()
				end)
				
				Sector.lists[vName]["a"].MouseLeave:Connect(function()
					if (Sector.lists[vName].Active) then
						Sector.lists[vName].Hover = false
						return
					end
					Sector.lists[vName].Hover = true
					getService('TweenService'):Create(Sector.lists[vName]["e"], TweenInfo.new(.5), {BackgroundTransparency = 1}):Play()
					getService('TweenService'):Create(Sector.lists[vName]["10"], TweenInfo.new(.5), {Transparency = 1}):Play()
					getService('TweenService'):Create(Sector.lists[vName]["a"], TweenInfo.new(.5), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
				end)
				
				Sector.lists[vName]["a"].InputBegan:Connect(function(i, gpe)
					if (gpe) then return end
					if (i.UserInputType == Enum.UserInputType.MouseButton1 and Sector.lists[vName].Hover) then
						if (Sector.CurrentSector == nil) then
							Sector.CurrentSector = Sector.lists[vName]
							Sector.lists[vName].Active = true
							getService('TweenService'):Create(Sector.lists[vName]["e"], TweenInfo.new(.5), {BackgroundTransparency = 0}):Play()
							getService('TweenService'):Create(Sector.lists[vName]["10"], TweenInfo.new(.5), {Transparency = 0}):Play()
							getService('TweenService'):Create(Sector.lists[vName]["a"], TweenInfo.new(.5), {TextColor3 = nTable.main_color}):Play()
							Sector.lists[vName].Tab.Contents["1a"].Visible = true
						else
							Sector.lists[vName].Active = true
							getService('TweenService'):Create(Sector.CurrentSector["e"], TweenInfo.new(.5), {BackgroundTransparency = 1}):Play()
							getService('TweenService'):Create(Sector.CurrentSector["10"], TweenInfo.new(.5), {Transparency = 1}):Play()
							getService('TweenService'):Create(Sector.CurrentSector["a"], TweenInfo.new(.5), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
							getService('TweenService'):Create(Sector.lists[vName]["e"], TweenInfo.new(.5), {BackgroundTransparency = 0}):Play()
							getService('TweenService'):Create(Sector.lists[vName]["10"], TweenInfo.new(.5), {Transparency = 0}):Play()
							getService('TweenService'):Create(Sector.lists[vName]["a"], TweenInfo.new(.5), {TextColor3 = nTable.main_color}):Play()
							
							Sector.CurrentSector.Tab.Contents["1a"].Visible = false
							Sector.lists[vName].Tab.Contents["1a"].Visible = true
							
							Sector.CurrentSector.Active = false
							Sector.CurrentSector = Sector.lists[vName]
						end
					end
				end)
				
				Sector.lists[vName].Tab = {
					Contents = {}
				}
				
				do
					Sector.lists[vName].Tab.Contents["1a"] = Instance.new("Frame", Sector["2f"]);
					Sector.lists[vName].Tab.Contents["1a"]["BorderSizePixel"] = 0;
					Sector.lists[vName].Tab.Contents["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
					Sector.lists[vName].Tab.Contents["1a"]["Size"] = UDim2.new(0, 480, 0, 467);
					Sector.lists[vName].Tab.Contents["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Sector.lists[vName].Tab.Contents["1a"]["Name"] = "tab_"..vName;
					Sector.lists[vName].Tab.Contents["1a"]["BackgroundTransparency"] = 1;
					Sector.lists[vName].Tab.Contents["1a"].Visible = false
					Sector.lists[vName].Tab.Contents["1b"] = Instance.new("UIListLayout", Sector.lists[vName].Tab.Contents["1a"]);
					Sector.lists[vName].Tab.Contents["1b"]["Padding"] = UDim.new(0, 10);
					Sector.lists[vName].Tab.Contents["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					Sector.lists[vName].Tab.Contents["1b"]["FillDirection"] = Enum.FillDirection.Horizontal;
					Sector.lists[vName].Tab.Contents["1c"] = Instance.new("ScrollingFrame", Sector.lists[vName].Tab.Contents["1a"]);
					Sector.lists[vName].Tab.Contents["1c"]["Active"] = true;
					Sector.lists[vName].Tab.Contents["1c"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
					Sector.lists[vName].Tab.Contents["1c"]["BorderSizePixel"] = 0;
					Sector.lists[vName].Tab.Contents["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Sector.lists[vName].Tab.Contents["1c"]["Name"] = [[left]];
					Sector.lists[vName].Tab.Contents["1c"]["ClipsDescendants"] = false;
					Sector.lists[vName].Tab.Contents["1c"]["Size"] = UDim2.new(0, 235, 0, 467);
					Sector.lists[vName].Tab.Contents["1c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
					Sector.lists[vName].Tab.Contents["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Sector.lists[vName].Tab.Contents["1c"]["ScrollBarThickness"] = 0;
					Sector.lists[vName].Tab.Contents["1c"]["BackgroundTransparency"] = 1;
					Sector.lists[vName].Tab.Contents["1d"] = Instance.new("UIListLayout", Sector.lists[vName].Tab.Contents["1c"]);
					Sector.lists[vName].Tab.Contents["1d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Sector.lists[vName].Tab.Contents["1d"]["Padding"] = UDim.new(0, 7);
					Sector.lists[vName].Tab.Contents["1d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					Sector.lists[vName].Tab.Contents["68"] = Instance.new("ScrollingFrame", Sector.lists[vName].Tab.Contents["1a"]);
					Sector.lists[vName].Tab.Contents["68"]["Active"] = true;
					Sector.lists[vName].Tab.Contents["68"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
					Sector.lists[vName].Tab.Contents["68"]["BorderSizePixel"] = 0;
					Sector.lists[vName].Tab.Contents["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Sector.lists[vName].Tab.Contents["68"]["Name"] = [[right]];
					Sector.lists[vName].Tab.Contents["68"]["ClipsDescendants"] = false;
					Sector.lists[vName].Tab.Contents["68"]["Size"] = UDim2.new(0, 235, 0, 467);
					Sector.lists[vName].Tab.Contents["68"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
					Sector.lists[vName].Tab.Contents["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Sector.lists[vName].Tab.Contents["68"]["ScrollBarThickness"] = 0;
					Sector.lists[vName].Tab.Contents["68"]["BackgroundTransparency"] = 1;
					Sector.lists[vName].Tab.Contents["6e"] = Instance.new("UIListLayout", Sector.lists[vName].Tab.Contents["68"]);
					Sector.lists[vName].Tab.Contents["6e"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Sector.lists[vName].Tab.Contents["6e"]["Padding"] = UDim.new(0, 7);
					Sector.lists[vName].Tab.Contents["6e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				end


			end
			
			
			function Sector:createSection(options)
				local options = Library:validate({
					side = "left",
					located = "none"
				}, options or {})
				local Section = {}
				print('Created new section')
				
				local whereLocated = Sector["2f"]
				for i,v in pairs(whereLocated:GetChildren()) do
					if (v:IsA('Frame') and v.Name == 'tab_'..options.located) then
						whereLocated = v[options.side]
					end
				end
				
				--// creation
				
				do
					Section["1e"] = Instance.new("Frame", whereLocated);
					Section["1e"]["BorderSizePixel"] = 0;
					Section["1e"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23);
					Section["1e"]["Size"] = UDim2.new(0, 229, 0, 10);
					Section["1e"]["Position"] = UDim2.new(-0.00426, 0, 0, 0);
					Section["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Section["1e"]["Name"] = [[section]];

					Section["1f"] = Instance.new("UICorner", Section["1e"]);
					Section["1f"]["CornerRadius"] = UDim.new(0, 3);

					Section["20"] = Instance.new("UIStroke", Section["1e"]);
					Section["20"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					Section["20"]["Thickness"] = 1.5;
					Section["20"]["Color"] = Color3.fromRGB(28, 28, 28);

					Section["21"] = Instance.new("UIPadding", Section["1e"]);
					Section["21"]["PaddingTop"] = UDim.new(0, 12);

					Section["22"] = Instance.new("UIListLayout", Section["1e"]);
					Section["22"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Section["22"]["Padding"] = UDim.new(0, 2);
					Section["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				end
				
				Section["22"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					Section["1e"].Size = UDim2.new(1, 0, 0, Section["22"].AbsoluteContentSize.Y + 25)
				end)
				
				--// elements
				
				function Section:addToggle(options)
					options = Library:validate({
						title = "Toggle",
						cb = function() end
					}, options or {})
					
					local Toggle = {
						Hover = false,
						State = false
					}
					
					--// render toggle
					
					do
						Toggle["23"] = Instance.new("Frame", Section["1e"]);
						Toggle["23"]["ZIndex"] = 1;
						Toggle["23"]["BorderSizePixel"] = 0;
						Toggle["23"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
						Toggle["23"]["Size"] = UDim2.new(0, 227, 0, 25);
						Toggle["23"]["Position"] = UDim2.new(0.00437, 0, 0, 0);
						Toggle["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Toggle["23"]["Name"] = [[toggle]];
						Toggle["23"]["BackgroundTransparency"] = 1;

						Toggle["24"] = Instance.new("Frame", Toggle["23"]);
						Toggle["24"]["BorderSizePixel"] = 0;
						Toggle["24"]["BackgroundColor3"] = Color3.fromRGB(21,21,21);
						Toggle["24"]["Size"] = UDim2.new(0, 17, 0, 17);
						Toggle["24"]["Position"] = UDim2.new(-0.00441, 7, 0.16, 0);
						Toggle["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Toggle["24"]["Name"] = [[box]];

						Toggle["25"] = Instance.new("UICorner", Toggle["24"]);
						Toggle["25"]["CornerRadius"] = UDim.new(0, 3);

						Toggle["26"] = Instance.new("UIStroke", Toggle["24"]);
						Toggle["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						Toggle["26"]["Color"] = Color3.fromRGB(31,31,31);

						Toggle["27"] = Instance.new("ImageLabel", Toggle["24"]);
						Toggle["27"]["BorderSizePixel"] = 0;
						Toggle["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Toggle["27"].ImageTransparency = 1

						Toggle["27"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Toggle["27"]["Image"] = [[rbxassetid://101086631701242]];
						Toggle["27"]["Size"] = UDim2.new(0, 10, 0, 10);
						Toggle["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Toggle["27"]["BackgroundTransparency"] = 1;
						Toggle["27"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

						Toggle["28"] = Instance.new("TextLabel", Toggle["23"]);
						Toggle["28"]["TextWrapped"] = true;
						Toggle["28"]["BorderSizePixel"] = 0;
						Toggle["28"]["TextSize"] = 17;
						Toggle["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Toggle["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Toggle["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Toggle["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Toggle["28"]["BackgroundTransparency"] = 1;
						Toggle["28"]["Size"] = UDim2.new(0, 137, 0, 24);
						Toggle["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Toggle["28"]["Text"] = options.title;
						Toggle["28"]["Name"] = [[label]];
						Toggle["28"]["Position"] = UDim2.new(0, 31, 0, 0);
					end
					
					--// functions
					
					function Toggle:setState(boolean)
						Toggle.State = boolean
						if (boolean) then
							getService('TweenService'):Create(Toggle["27"], TweenInfo.new(.25), {ImageTransparency = 0}):Play()
							getService('TweenService'):Create(Toggle["24"], TweenInfo.new(.25), {BackgroundColor3 = nTable.main_color}):Play()
							getService('TweenService'):Create(Toggle["26"], TweenInfo.new(.25), {Color = nTable.border_color}):Play()
						else
							getService('TweenService'):Create(Toggle["27"], TweenInfo.new(.25), {ImageTransparency = 1}):Play()
							getService('TweenService'):Create(Toggle["24"], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(21,21,21)}):Play()
							getService('TweenService'):Create(Toggle["26"], TweenInfo.new(.25), {Color = Color3.fromRGB(31,31,31)}):Play()
						end
						
						options.cb(boolean)
						
					end
					
					function Toggle:colorPicker(options)
						options = Library:validate({
							default = nTable.main_color,
							cb = function() end
						}, options or {})
						local Colorpicker = {
							Hover = false,
							Sizes = {
								Open = UDim2.new(0, 172, 0, 143),
								Closed = UDim2.new(0, 172, 0, 0)
							},
							rgbActive = false,
							sideActive = false,
							Connection = nil
						}
						
						--// Render colorpicker
						
						do
							
							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker
							Colorpicker["60"] = Instance.new("Frame", Toggle["23"]);
							Colorpicker["60"]["BorderSizePixel"] = 0;
							Colorpicker["60"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
							Colorpicker["60"]["Size"] = UDim2.new(0, 43, 0, 19);
							Colorpicker["60"]["Position"] = UDim2.new(0.77974, 0, 0.12, 0);
							Colorpicker["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["60"]["Name"] = [[colorpicker]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UICorner
							Colorpicker["61"] = Instance.new("UICorner", Colorpicker["60"]);
							Colorpicker["61"]["CornerRadius"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.ImageLabel
							Colorpicker["62"] = Instance.new("ImageLabel", Colorpicker["60"]);
							Colorpicker["62"]["BorderSizePixel"] = 0;
							Colorpicker["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
							Colorpicker["62"]["Image"] = [[rbxassetid://126619232017499]];
							Colorpicker["62"]["Size"] = UDim2.new(0, 13, 0, 13);
							Colorpicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["62"]["BackgroundTransparency"] = 1;
							Colorpicker["62"]["Position"] = UDim2.new(0, 0, 0.15789, 0);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UIStroke
							Colorpicker["63"] = Instance.new("UIStroke", Colorpicker["60"]);
							Colorpicker["63"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["63"]["Thickness"] = 1.5;
							Colorpicker["63"]["Color"] = Color3.fromRGB(29, 29, 29);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UIPadding
							Colorpicker["64"] = Instance.new("UIPadding", Colorpicker["60"]);
							Colorpicker["64"]["PaddingRight"] = UDim.new(0, 10);
							Colorpicker["64"]["PaddingLeft"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.coldisplay
							Colorpicker["65"] = Instance.new("Frame", Colorpicker["60"]);
							Colorpicker["65"]["BorderSizePixel"] = 0;
							Colorpicker["65"]["BackgroundColor3"] = options.default;
							Colorpicker["65"]["Size"] = UDim2.new(0, 12, 0, 12);
							Colorpicker["65"]["Position"] = UDim2.new(0.68421, 0, 0.18421, 0);
							Colorpicker["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["65"]["Name"] = [[coldisplay]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.coldisplay.UICorner
							Colorpicker["66"] = Instance.new("UICorner", Colorpicker["65"]);
							Colorpicker["66"]["CornerRadius"] = UDim.new(0, 4);



							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker
							Colorpicker["67"] = Instance.new("Frame", Colorpicker["60"]);
							Colorpicker["67"].Visible = false
							Colorpicker["67"].ZIndex = 2
							Colorpicker["67"]["BorderSizePixel"] = 0;
							Colorpicker["67"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
							Colorpicker["67"]["ClipsDescendants"] = true;
							Colorpicker["67"]["Size"] = UDim2.new(0, 172, 0, 143);
							Colorpicker["67"]["Position"] = UDim2.new(-0.17857, 0, 1.26316, 0);
							Colorpicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["67"]["Name"] = [[picker]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.UICorner
							Colorpicker["68"] = Instance.new("UICorner", Colorpicker["67"]);
							Colorpicker["68"]["CornerRadius"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.UIStroke
							Colorpicker["69"] = Instance.new("UIStroke", Colorpicker["67"]);
							Colorpicker["69"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["69"]["Thickness"] = 1.5;
							Colorpicker["69"]["Color"] = Color3.fromRGB(29, 29, 29);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame
							Colorpicker["6a"] = Instance.new("ImageButton", Colorpicker["67"]);
							Colorpicker["6a"]["Active"] = false;
							Colorpicker["6a"].ZIndex = 2
							Colorpicker["6a"]["AutoButtonColor"] = false;
							Colorpicker["6a"]["BackgroundColor3"] = options.default;
							Colorpicker["6a"]["Selectable"] = false;
							Colorpicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6a"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["6a"]["Name"] = [[Frame]];
							Colorpicker["6a"]["Position"] = UDim2.new(0, 75, 0, 71);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame
							Colorpicker["6b"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["6b"]["BorderSizePixel"] = 0;
							Colorpicker["6b"].ZIndex = 2
							Colorpicker["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6b"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
							Colorpicker["6b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UIGradient
							Colorpicker["6c"] = Instance.new("UIGradient", Colorpicker["6b"]);
							Colorpicker["6c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UICorner
							Colorpicker["6d"] = Instance.new("UICorner", Colorpicker["6b"]);
							Colorpicker["6d"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame
							Colorpicker["6e"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["6e"]["BorderSizePixel"] = 0;
							Colorpicker["6e"].ZIndex = 2
							Colorpicker["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["6e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6e"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
							Colorpicker["6e"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UIGradient
							Colorpicker["6f"] = Instance.new("UIGradient", Colorpicker["6e"]);
							Colorpicker["6f"]["Rotation"] = -90;
							Colorpicker["6f"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};
							Colorpicker["6f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UICorner
							Colorpicker["70"] = Instance.new("UICorner", Colorpicker["6e"]);
							Colorpicker["70"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.UICorner
							Colorpicker["71"] = Instance.new("UICorner", Colorpicker["6a"]);
							Colorpicker["71"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer
							Colorpicker["72"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["72"]["BorderSizePixel"] = 0;
							Colorpicker["72"].ZIndex = 2
							Colorpicker["72"]["BackgroundColor3"] = options.default;
							Colorpicker["72"]["Size"] = UDim2.new(0, 12, 0, 12);
							Colorpicker["72"]["Position"] = UDim2.new(0, 128, 0, -1);
							Colorpicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["72"]["Name"] = [[Pointer]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer.UICorner
							Colorpicker["73"] = Instance.new("UICorner", Colorpicker["72"]);
							Colorpicker["73"]["CornerRadius"] = UDim.new(0, 100);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer.UIStroke
							Colorpicker["74"] = Instance.new("UIStroke", Colorpicker["72"]);
							Colorpicker["74"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["74"]["Color"] = Color3.fromRGB(255, 255, 255);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip
							Colorpicker["75"] = Instance.new("ImageButton", Colorpicker["67"]);
							Colorpicker["75"]["Active"] = false;
							Colorpicker["75"].ZIndex = 2
							Colorpicker["75"]["AutoButtonColor"] = false;
							-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
							Colorpicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["75"]["Selectable"] = false;
							Colorpicker["75"]["Image"] = [[rbxassetid://252684207]];
							Colorpicker["75"]["Size"] = UDim2.new(0, 13, 0, 130);
							Colorpicker["75"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["75"]["Name"] = [[Strip]];
							Colorpicker["75"]["Position"] = UDim2.new(0, 151, 0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.Pointer
							Colorpicker["76"] = Instance.new("Frame", Colorpicker["75"]);
							Colorpicker["76"]["BorderSizePixel"] = 0;
							Colorpicker["76"].ZIndex = 2
							Colorpicker["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0);
							Colorpicker["76"]["Size"] = UDim2.new(0, 13, 0, 3);
							Colorpicker["76"]["Position"] = UDim2.new(0, 6, 0, 0);
							Colorpicker["76"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["76"]["Name"] = [[Pointer]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.Pointer.UIStroke
							Colorpicker["77"] = Instance.new("UIStroke", Colorpicker["76"]);
							Colorpicker["77"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.UICorner
							Colorpicker["78"] = Instance.new("UICorner", Colorpicker["75"]);
							Colorpicker["78"]["CornerRadius"] = UDim.new(0, 3);
						end
						
						Colorpicker["60"].MouseEnter:Connect(function()
							Colorpicker.Hover = true
							getService('TweenService'):Create(Colorpicker['60'], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}):Play()
						end)
						Colorpicker["60"].MouseLeave:Connect(function()
							Colorpicker.Hover = false
							getService('TweenService'):Create(Colorpicker['60'], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(31,31,31)}):Play()
						end)
						
						Colorpicker["60"].InputBegan:Connect(function(i, gpe)
							if (gpe) then
								return
							end
							if (i.UserInputType == Enum.UserInputType.MouseButton1 and Colorpicker.Hover) then
								if (Colorpicker["67"].Visible) then
									getService('TweenService'):Create(Colorpicker["67"], TweenInfo.new(.25), {Size = Colorpicker.Sizes.Closed}):Play()
									task.wait(.25)
									Colorpicker["67"].Visible = false
								else
									Colorpicker["67"].Size = Colorpicker.Sizes.Closed
									if (#Miner.listsOpened >= 1) then
										local idx = Miner.listsOpened[1]
										for i,v in pairs(idx.instances) do
											getService('TweenService'):Create(v[1], TweenInfo.new(.25), v[2] or {}):Play()
										end
										idx.instances[1][1].Visible = false
										Miner.listsOpened = {}
									end
									Miner.listsOpened[1] = {
										instances = {
											{Colorpicker["67"], {Size = Colorpicker.Sizes.Open}}
										}
									}
									Colorpicker["67"].Visible = true
									getService('TweenService'):Create(Colorpicker["67"], TweenInfo.new(.25), {Size = Colorpicker.Sizes.Open}):Play()
								end
								
								--// Colorpicker controller

								
								--* Main gradient
								local mouse = getService('Players').LocalPlayer:GetMouse()
								local function inBounds(frame)
									local x,y = mouse.X - frame.AbsolutePosition.X,mouse.Y - frame.AbsolutePosition.Y
									local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
									if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
										return x/maxX,y/maxY
									end
								end
								local pointerRgb = Colorpicker["72"]
								local output = Colorpicker["65"]
								local rgbGradient = Colorpicker["6a"]
								
								local pointerSide = Colorpicker["76"]
								local darknessGradient = Colorpicker["75"]


								rgbGradient.InputBegan:Connect(function(i, gpe)
									if (gpe) then
										return
									end
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										if (Colorpicker.Connection) then
											return
										end
										Colorpicker.rgbActive = true
										Colorpicker.Connection = getService('RunService').RenderStepped:Connect(function()
											if (not inBounds(rgbGradient)) then
												return
											end
											pointerRgb:TweenPosition(
												UDim2.new(0,game.Players.LocalPlayer:GetMouse().X,0,game.Players.LocalPlayer:GetMouse().Y)-UDim2.new(0,rgbGradient.AbsolutePosition.X,0,rgbGradient.AbsolutePosition.Y)
												,Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0,true)
											local h,s,v = output.BackgroundColor3:ToHSV()
											local colour = Color3.fromHSV(h,math.clamp(pointerRgb.Position.X.Offset/rgbGradient.AbsoluteSize.X,0,1),(1-math.clamp(pointerRgb.Position.Y.Offset/rgbGradient.AbsoluteSize.Y,0,1)))
											output.BackgroundColor3 = colour
											pointerRgb.BackgroundColor3 = colour
											options.cb(colour)
										end)
									end
								end)
								
								rgbGradient.InputEnded:Connect(function(i)
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										Colorpicker.rgbActive = false
										if (Colorpicker.Connection) then
											Colorpicker.Connection:Disconnect()
											Colorpicker.Connection = nil
										end
									end
								end)

								
								--* side slider
								
								darknessGradient.InputBegan:Connect(function(i, gpe)
									if (gpe) then
										return
									end
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										if Colorpicker.Connection then
											return
										end

										Colorpicker.sideActive = true

										Colorpicker.Connection = getService('RunService').RenderStepped:Connect(function()

											if (not inBounds(darknessGradient)) then
												return
											end

											pointerSide:TweenPosition(
												UDim2.new(0.5,0,0,game.Players.LocalPlayer:GetMouse().Y)-UDim2.new(0,0,0,darknessGradient.AbsolutePosition.Y)
												,Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0,true)
											local h,s,v = output.BackgroundColor3:ToHSV()
											local colour = Color3.fromHSV(pointerSide.Position.Y.Offset/darknessGradient.AbsoluteSize.Y,s,v)
											rgbGradient.BackgroundColor3 = Color3.fromHSV(pointerSide.Position.Y.Offset/darknessGradient.AbsoluteSize.Y,1,1)
											output.BackgroundColor3 = colour
											pointerRgb.BackgroundColor3 = colour
											options.cb(colour)
										end)
									end
								end)
								darknessGradient.InputEnded:Connect(function(i)
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										Colorpicker.sideActive = false
										if (Colorpicker.Connection) then
											Colorpicker.Connection:Disconnect()
											Colorpicker.Connection = nil
										end
									end
								end)

								
								
							end
						end)
						
						return Colorpicker
					end
					

					
					--// handling
					
					Toggle["24"].MouseEnter:Connect(function()
						Toggle.Hover = true
						if (Toggle.State) then
							return
						end
						getService('TweenService'):Create(Toggle["27"], TweenInfo.new(.25), {ImageTransparency = 0.5}):Play()
					end)
					Toggle["24"].MouseLeave:Connect(function()
						Toggle.Hover = false
						if (Toggle.State) then
							return
						end
						getService('TweenService'):Create(Toggle["27"], TweenInfo.new(.25), {ImageTransparency = 1}):Play()
					end)
					Toggle["24"].InputBegan:Connect(function(i, gpe)
						if (gpe) then
							return
						end
						if (i.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover) then
							Toggle:setState(not Toggle.State)
						end
					end)
					
					return Toggle
					
				end
				
				function Section:addSlider(options)
					options = Library:validate({
						title = "Slider",
						min = 0,
						max = 100,
						default = 50,
						slider_icon = "%",
						cb = function(v) print(v) end
					}, options or {})
					local Slider = {
						MouseDown = false,
						Hover = false,
						Connection = nil,
						currentValue = options.default
					}
					
					--// render slider
					
					do
						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider
						Slider["36"] = Instance.new("Frame", Section["1e"]);
						Slider["36"]["ZIndex"] = 1;
						Slider["36"]["BorderSizePixel"] = 0;
						Slider["36"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
						Slider["36"]["Size"] = UDim2.new(0, 227, 0, 42);
						Slider["36"]["Position"] = UDim2.new(-0.30568, 0, 0.1831, 0);
						Slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Slider["36"]["Name"] = [[slider]];
						Slider["36"]["BackgroundTransparency"] = 1.01;


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.label
						Slider["37"] = Instance.new("TextLabel", Slider["36"]);
						Slider["37"]["TextWrapped"] = true;
						Slider["37"]["BorderSizePixel"] = 0;
						Slider["37"]["TextSize"] = 17;
						Slider["37"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Slider["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Slider["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Slider["37"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Slider["37"]["BackgroundTransparency"] = 1;
						Slider["37"]["Size"] = UDim2.new(0, 207, 0, 24);
						Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Slider["37"]["Text"] = `{options.title} ({options.default}{options.slider_icon})`;
						Slider["37"]["Name"] = [[label]];
						Slider["37"]["Position"] = UDim2.new(0, 6, 0, 0);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.sliderframe
						Slider["38"] = Instance.new("Frame", Slider["36"]);
						Slider["38"]["BorderSizePixel"] = 0;
						Slider["38"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Slider["38"]["Size"] = UDim2.new(0.70925, 0, 0.16667, 0);
						Slider["38"]["Position"] = UDim2.new(0, 6, 0, 25);
						Slider["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Slider["38"]["Name"] = [[sliderframe]];


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.sliderframe.UICorner
						Slider["39"] = Instance.new("UICorner", Slider["38"]);
						Slider["39"]["CornerRadius"] = UDim.new(0, 10);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.sliderframe.UIStroke
						Slider["3a"] = Instance.new("UIStroke", Slider["38"]);
						Slider["3a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						Slider["3a"]["Color"] = Color3.fromRGB(31, 31, 31);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.sliderframe.bar
						Slider["3b"] = Instance.new("Frame", Slider["38"]);
						Slider["3b"]["BorderSizePixel"] = 0;
						Slider["3b"]["BackgroundColor3"] = nTable.main_color;
						Slider["3b"]["Size"] = UDim2.new(0.5, 0, 1, 0);
						Slider["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Slider["3b"]["Name"] = [[bar]];


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.slider.sliderframe.bar.UICorner
						Slider["3c"] = Instance.new("UICorner", Slider["3b"]);
						Slider["3c"]["CornerRadius"] = UDim.new(0, 10);
					end
					
					--// funcs
					
					function Slider:setValue(v)
						if (v == nil) then
							local percentage = math.clamp((mouse.X - Slider["38"].AbsolutePosition.X) / (Slider["38"].AbsoluteSize.X), 0, 1)
							local value = math.floor(((options.max - options.min) * percentage) + options.min)
							Slider["37"].Text = `{options.title} ({tostring(value)}{options.slider_icon})`
							Slider["3b"].Size = UDim2.fromScale(percentage, 1)
							Slider.currentValue = value
						else
							Slider["37"].Text = `{options.title} ({tostring(v)}{options.slider_icon})`
							local sizeX = ((v - options.min) / (options.max - options.min))
							Slider["3b"].Size = UDim2.fromScale(sizeX, 1)
							Slider.currentValue = v
						end
						
						options.cb(Slider:getValue())
					end
					
					function Slider:getValue()
						return Slider.currentValue
					end
					
					Slider["38"].MouseEnter:Connect(function()
						Slider.Hover = true
					end)
					
					Slider["38"].MouseLeave:Connect(function()
						Slider.Hover = false
					end)
					
					
					Slider["38"].InputBegan:Connect(function(i, gpe)
						if (gpe) then
							return
						end
						if (i.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover) then
							Slider.MouseDown = true
							if (not Slider.Connection) then
								Slider.Connection = getService('RunService').RenderStepped:Connect(function()
									Slider:setValue()
								end)
							end
						end
					end)
					
					Slider["38"].InputEnded:Connect(function(i, gpe)
						if (gpe) then
							return
						end
						if (i.UserInputType == Enum.UserInputType.MouseButton1) then
							Slider.MouseDown = false
							if (Slider.Connection) then
								Slider.Connection:Disconnect()
								Slider.Connection = nil
							end
						end
					end)
					
				end

				function Section:addDropdown(options)
					options = Library:validate({
						title = 'Dropdown',
						list = {},
						cb = function() end
					}, options or {})
					
					local Dropdown = {
						Hover = false,
						list = {},
						listInstances = {},
						Selected = "...",
						SelectedInstance = nil,
						Opened = nil
					}
					
					local standardOption = options.list[1] or "..."
					Dropdown.list = options.list
					
					Dropdown.Selected = standardOption
					
					
					--// render dropdown
					
					do
						Dropdown["3d"] = Instance.new("Frame", Section["1e"]);
						Dropdown["3d"]["ZIndex"] = 1;
						Dropdown["3d"]["BorderSizePixel"] = 0;
						Dropdown["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
						Dropdown["3d"]["Size"] = UDim2.new(0, 227, 0, 25);
						Dropdown["3d"]["Position"] = UDim2.new(-0.1048, 0, 0.28873, 0);
						Dropdown["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["3d"]["Name"] = [[Dropdown]];
						Dropdown["3d"]["BackgroundTransparency"] = 1;


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.label
						Dropdown["3e"] = Instance.new("TextLabel", Dropdown["3d"]);
						Dropdown["3e"]["TextWrapped"] = true;
						Dropdown["3e"]["ZIndex"] = 1;
						Dropdown["3e"]["BorderSizePixel"] = 0;
						Dropdown["3e"]["TextSize"] = 17;
						Dropdown["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Dropdown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Dropdown["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Dropdown["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Dropdown["3e"]["BackgroundTransparency"] = 1;
						Dropdown["3e"]["Size"] = UDim2.new(0, 102, 0, 24);
						Dropdown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["3e"]["Text"] = options.title;
						Dropdown["3e"]["Name"] = [[label]];
						Dropdown["3e"]["Position"] = UDim2.new(0, 6, 0, 0);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown
						Dropdown["3f"] = Instance.new("Frame", Dropdown["3d"]);
						Dropdown["3f"]["BorderSizePixel"] = 0;
						Dropdown["3f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Dropdown["3f"]["Size"] = UDim2.new(0, 105, 0, 19);
						Dropdown["3f"]["Position"] = UDim2.new(0.50661, 0, 0.12, 0);
						Dropdown["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["3f"]["Name"] = [[dropdown]];


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.UICorner
						Dropdown["40"] = Instance.new("UICorner", Dropdown["3f"]);
						Dropdown["40"]["CornerRadius"] = UDim.new(0, 5);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.UIStroke
						Dropdown["41"] = Instance.new("UIStroke", Dropdown["3f"]);
						Dropdown["41"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						Dropdown["41"]["Thickness"] = 1.5;
						Dropdown["41"]["Color"] = Color3.fromRGB(28, 28, 28);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.ImageLabel
						Dropdown["42"] = Instance.new("ImageLabel", Dropdown["3f"]);
						Dropdown["42"]["BorderSizePixel"] = 0;
						Dropdown["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
						Dropdown["42"]["Image"] = [[rbxassetid://77493928288559]];
						Dropdown["42"]["Size"] = UDim2.new(0, 10, 0, 10);
						Dropdown["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["42"]["BackgroundTransparency"] = 1;
						Dropdown["42"]["Position"] = UDim2.new(0.89674, 0, 0.21053, 0);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.label
						Dropdown["43"] = Instance.new("TextLabel", Dropdown["3f"]);
						Dropdown["43"]["TextWrapped"] = true;
						Dropdown["43"]["BorderSizePixel"] = 0;
						Dropdown["43"]["TextSize"] = 17;
						Dropdown["43"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Dropdown["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Dropdown["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Dropdown["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Dropdown["43"]["BackgroundTransparency"] = 1;
						Dropdown["43"]["Size"] = UDim2.new(0, 74, 0, 15);
						Dropdown["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["43"]["Text"] = standardOption;
						Dropdown["43"]["Name"] = [[label]];
						Dropdown["43"]["Position"] = UDim2.new(0, 6, 0, 1);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.UIPadding
						Dropdown["44"] = Instance.new("UIPadding", Dropdown["3f"]);
						Dropdown["44"]["PaddingRight"] = UDim.new(0, 7);
						
						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.options
						Dropdown["45"] = Instance.new("Frame", Dropdown["3f"]);
						Dropdown["45"]["Visible"] = false;
						Dropdown["45"]["ZIndex"] = 2;
						Dropdown["45"]["BorderSizePixel"] = 0;
						Dropdown["45"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Dropdown["45"]["ClipsDescendants"] = true;
						Dropdown["45"]["Size"] = UDim2.new(0, 197, 0, 0);
						Dropdown["45"]["Position"] = UDim2.new(-0.93878, 0, 1.26316, 0);
						Dropdown["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown["45"]["Name"] = [[options]];


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.options.UICorner
						Dropdown["46"] = Instance.new("UICorner", Dropdown["45"]);
						Dropdown["46"]["CornerRadius"] = UDim.new(0, 5);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.options.UIStroke
						Dropdown["47"] = Instance.new("UIStroke", Dropdown["45"]);
						Dropdown["47"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						Dropdown["47"]["Thickness"] = 1.5;
						Dropdown["47"]["Color"] = Color3.fromRGB(28, 28, 28);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.options.UIPadding
						Dropdown["48"] = Instance.new("UIPadding", Dropdown["45"]);
						Dropdown["48"]["PaddingTop"] = UDim.new(0, 5);
						Dropdown["48"]["PaddingLeft"] = UDim.new(0, 10);


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.Dropdown.dropdown.options.UIListLayout
						Dropdown["49"] = Instance.new("UIListLayout", Dropdown["45"]);
						Dropdown["49"]["Padding"] = UDim.new(0, 5);
						Dropdown["49"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					end
					
					Dropdown["3f"].MouseEnter:Connect(function()
						Dropdown.Hover = true
					end)
					Dropdown["3f"].MouseLeave:Connect(function()
						Dropdown.Hover = false
					end)
					
					Dropdown["3f"].InputBegan:Connect(function(i, gpe)
						if (gpe) then
							return
						end
						if (i.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover) then
							Dropdown:toggle()
						end
					end)
					
					--// function n shit
					
					function Dropdown:refreshList()
						for i,v in pairs(Dropdown["45"]:GetChildren()) do
							if (v:IsA('TextLabel')) then
								v:Destroy()
							end
						end
						Dropdown.listInstances = {}
						
						--//create
						
						for i,v in pairs(Dropdown.list) do
							
							
							Dropdown.listInstances[i] = Instance.new("TextLabel", Dropdown["45"]);
							Dropdown.listInstances[i]["BorderSizePixel"] = 0;
							Dropdown.listInstances[i]["TextSize"] = 16;
							Dropdown.listInstances[i]["TextXAlignment"] = Enum.TextXAlignment.Left;
							Dropdown.listInstances[i]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Dropdown.listInstances[i]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
							Dropdown.listInstances[i]["TextColor3"] = Color3.fromRGB(255, 255, 255);
							Dropdown.listInstances[i]["BackgroundTransparency"] = 1;
							Dropdown.listInstances[i]["Size"] = UDim2.new(0, 187, 0, 12);
							Dropdown.listInstances[i]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Dropdown.listInstances[i]["Text"] = v;
							Dropdown.listInstances[i]["Name"] = `option_{v}`;
							local current = Dropdown.listInstances[i]
							current.ZIndex = 2
							if (Dropdown.Selected == v) then
								current["TextColor3"] = nTable.main_color;
								Dropdown.SelectedInstance = current
							end
							
							current.MouseEnter:Connect(function()
								Dropdown.Hover = true
							end)
							current.MouseLeave:Connect(function()
								Dropdown.Hover = false
							end)
							
							current.InputBegan:Connect(function(i, gpe)
								if (gpe) then
									return
								end
								if (i.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover) then
									if (v ~= Dropdown.Selected) then
										getService('TweenService'):Create(current, TweenInfo.new(.25), {TextColor3 = nTable.main_color}):Play()
										getService('TweenService'):Create(Dropdown.SelectedInstance, TweenInfo.new(.25), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
										Dropdown.Selected = v
										Dropdown.SelectedInstance = current
										Dropdown["43"].Text = v
										options.cb(v)
									end
								end
							end)
							
						end
						
					end
					
					function Dropdown:toggle()
						if (Dropdown["45"].Visible) then
						
							getService('TweenService'):Create(Dropdown["45"], TweenInfo.new(.25), {Size = UDim2.new(0, 197, 0, 0)}):Play()
							getService('TweenService'):Create(Dropdown["42"], TweenInfo.new(.25), {Rotation = 0}):Play()
							task.wait(.25)
							Dropdown["45"].Visible = false
						else
							
							if (#Miner.listsOpened >= 1) then
								local idx = Miner.listsOpened[1]
								for i,v in pairs(idx.instances) do
									getService('TweenService'):Create(v[1], TweenInfo.new(.25), v[2] or {}):Play()
								end
								idx.instances[1][1].Visible = false
								Miner.listsOpened = {}
							end

							Miner.listsOpened[1] = {
								instances = {
									{Dropdown["45"], {Size = UDim2.new(0, 197, 0, 0)}},
									{Dropdown["42"], {Rotation = 0}}
								}
							}
							
							local sizeY = UDim2.new(0, 197, 0, Dropdown["49"].AbsoluteContentSize.Y + 10)
							Dropdown["45"].Size = UDim2.new(0, 197, 0, 0)
							Dropdown["45"].Visible = true
							getService('TweenService'):Create(Dropdown["45"], TweenInfo.new(.25), {Size = sizeY}):Play()
							getService('TweenService'):Create(Dropdown["42"], TweenInfo.new(.25), {Rotation = 90}):Play()
							
						end
					end
					
					function Dropdown:add(index)
						if (index == nil) then
							return
						end
						table.insert(Dropdown.list, index)
						Dropdown:refreshList()
					end
					
					function Dropdown:remove(index)
						if (index == nil) then
							return
						end
						table.remove(Dropdown.list, table.find(Dropdown.list, index))
						Dropdown:refreshList()
					end
					
					Dropdown:refreshList()
					
					
					return Dropdown
					
				end
				
				function Section:addButton(options)
					options = Library:validate({
						title = "Button",
						cb = function() print('Button pressed but isnt custom functioned') end
					}, options or {})
					
					local Button = {
						Hover = false
					}
					
					do
						Button["2"] = Instance.new("Frame", Section["1e"]);
						Button["2"]["ZIndex"] = 0;
						Button["2"]["BorderSizePixel"] = 0;
						Button["2"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
						Button["2"]["Size"] = UDim2.new(0, 227, 0, 32);
						Button["2"]["Position"] = UDim2.new(0.00437, 0, 0.35681, 0);
						Button["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Button["2"]["Name"] = [[button]];
						Button["2"]["BackgroundTransparency"] = 1;


						-- StarterGui.unknown.button.Frame
						Button["3"] = Instance.new("Frame", Button["2"]);
						Button["3"]["BorderSizePixel"] = 0;
						Button["3"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Button["3"]["Size"] = UDim2.new(0, 214, 0, 25);
						Button["3"]["Position"] = UDim2.new(0.02643, 0, 0.09375, 0);
						Button["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


						-- StarterGui.unknown.button.Frame.label
						Button["4"] = Instance.new("TextLabel", Button["3"]);
						Button["4"]["TextWrapped"] = true;
						Button["4"]["BorderSizePixel"] = 0;
						Button["4"]["TextSize"] = 17;
						Button["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Button["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Button["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Button["4"]["BackgroundTransparency"] = 1;
						Button["4"]["Size"] = UDim2.new(0, 208, 0, 17);
						Button["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Button["4"]["Text"] = options.title;
						Button["4"]["Name"] = [[label]];
						Button["4"]["Position"] = UDim2.new(0, 0, 0.16, 0);


						-- StarterGui.unknown.button.Frame.UIStroke
						Button["5"] = Instance.new("UIStroke", Button["3"]);
						Button["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						Button["5"]["Color"] = Color3.fromRGB(31, 31, 31);


						-- StarterGui.unknown.button.Frame.UICorner
						Button["6"] = Instance.new("UICorner", Button["3"]);
						Button["6"]["CornerRadius"] = UDim.new(0, 3);


						-- StarterGui.unknown.button.Frame.UIPadding
						Button["7"] = Instance.new("UIPadding", Button["3"]);
					end
					
					Button["3"].MouseEnter:Connect(function()
						Button.Hover = true
						getService('TweenService'):Create(Button["3"], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(31,31,31)}):Play()
						getService('TweenService'):Create(Button["5"], TweenInfo.new(.25), {Color = Color3.fromRGB(21,21,21)}):Play()
						getService('TweenService'):Create(Button["4"], TweenInfo.new(.25), {TextColor3 = nTable.main_color}):Play()
					end)
					
					Button["3"].MouseLeave:Connect(function()
						Button.Hover = false
						getService('TweenService'):Create(Button["3"], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(21,21,21)}):Play()
						getService('TweenService'):Create(Button["5"], TweenInfo.new(.25), {Color = Color3.fromRGB(31,31,31)}):Play()
						getService('TweenService'):Create(Button["4"], TweenInfo.new(.25), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
					end)
					
					Button["3"].InputBegan:Connect(function(i, gpe)
						if (gpe) then
							return
						end
						if (i.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover) then
							options.cb()
						end
					end)
					
				end
				
				function Section:addLabel(options)
					options = Library:validate({
						text = "TextLabel"
					}, options or {})
					
					local Label = {}
					--// Create label
					
					do
						Label["6e"] = Instance.new("Frame", Section["1e"]);
						Label["6e"]["ZIndex"] = 1;
						Label["6e"]["BorderSizePixel"] = 0;
						Label["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
						Label["6e"]["Size"] = UDim2.new(0, 227, 0, 25);
						Label["6e"]["Position"] = UDim2.new(0.00437, 0, 0, 0);
						Label["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Label["6e"]["Name"] = [[txtLabel]];
						Label["6e"]["BackgroundTransparency"] = 1;


						-- StarterGui.ui1_unfinished.Main.tabs.tab.left.section.txtLabel.label
						Label["6f"] = Instance.new("TextLabel", Label["6e"]);
						Label["6f"]["TextWrapped"] = true;
						Label["6f"]["ZIndex"] = 1;
						Label["6f"]["BorderSizePixel"] = 0;
						Label["6f"]["TextSize"] = 17;
						Label["6f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Label["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Label["6f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Nunito.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Label["6f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Label["6f"]["BackgroundTransparency"] = 1;
						Label["6f"]["Size"] = UDim2.new(0, 161, 0, 24);
						Label["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Label["6f"]["Text"] = options.text;
						Label["6f"]["Name"] = [[label]];
						Label["6f"]["Position"] = UDim2.new(0, 6, 0, 0);
					end
					
					function Label:colorPicker(options)
						options = Library:validate({
							default = nTable.main_color,
							cb = function() end
						}, options or {})
						local Colorpicker = {
							Hover = false,
							Sizes = {
								Open = UDim2.new(0, 172, 0, 143),
								Closed = UDim2.new(0, 172, 0, 0)
							},
							rgbActive = false,
							sideActive = false,
							Connection = nil
						}

						--// Render colorpicker

						do

							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker
							Colorpicker["60"] = Instance.new("Frame", Label["6e"]);
							Colorpicker["60"]["BorderSizePixel"] = 0;
							Colorpicker["60"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
							Colorpicker["60"]["Size"] = UDim2.new(0, 43, 0, 19);
							Colorpicker["60"]["Position"] = UDim2.new(0.77974, 0, 0.12, 0);
							Colorpicker["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["60"]["Name"] = [[colorpicker]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UICorner
							Colorpicker["61"] = Instance.new("UICorner", Colorpicker["60"]);
							Colorpicker["61"]["CornerRadius"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.ImageLabel
							Colorpicker["62"] = Instance.new("ImageLabel", Colorpicker["60"]);
							Colorpicker["62"]["BorderSizePixel"] = 0;
							Colorpicker["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
							Colorpicker["62"]["Image"] = [[rbxassetid://126619232017499]];
							Colorpicker["62"]["Size"] = UDim2.new(0, 13, 0, 13);
							Colorpicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["62"]["BackgroundTransparency"] = 1;
							Colorpicker["62"]["Position"] = UDim2.new(0, 0, 0.15789, 0);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UIStroke
							Colorpicker["63"] = Instance.new("UIStroke", Colorpicker["60"]);
							Colorpicker["63"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["63"]["Thickness"] = 1.5;
							Colorpicker["63"]["Color"] = Color3.fromRGB(29, 29, 29);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.UIPadding
							Colorpicker["64"] = Instance.new("UIPadding", Colorpicker["60"]);
							Colorpicker["64"]["PaddingRight"] = UDim.new(0, 10);
							Colorpicker["64"]["PaddingLeft"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.coldisplay
							Colorpicker["65"] = Instance.new("Frame", Colorpicker["60"]);
							Colorpicker["65"]["BorderSizePixel"] = 0;
							Colorpicker["65"]["BackgroundColor3"] = options.default;
							Colorpicker["65"]["Size"] = UDim2.new(0, 12, 0, 12);
							Colorpicker["65"]["Position"] = UDim2.new(0.68421, 0, 0.18421, 0);
							Colorpicker["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["65"]["Name"] = [[coldisplay]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.coldisplay.UICorner
							Colorpicker["66"] = Instance.new("UICorner", Colorpicker["65"]);
							Colorpicker["66"]["CornerRadius"] = UDim.new(0, 4);



							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker
							Colorpicker["67"] = Instance.new("Frame", Colorpicker["60"]);
							Colorpicker["67"].Visible = false
							Colorpicker["67"].ZIndex = 2
							Colorpicker["67"]["BorderSizePixel"] = 0;
							Colorpicker["67"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
							Colorpicker["67"]["ClipsDescendants"] = true;
							Colorpicker["67"]["Size"] = UDim2.new(0, 172, 0, 143);
							Colorpicker["67"]["Position"] = UDim2.new(-0.17857, 0, 1.26316, 0);
							Colorpicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["67"]["Name"] = [[picker]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.UICorner
							Colorpicker["68"] = Instance.new("UICorner", Colorpicker["67"]);
							Colorpicker["68"]["CornerRadius"] = UDim.new(0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.UIStroke
							Colorpicker["69"] = Instance.new("UIStroke", Colorpicker["67"]);
							Colorpicker["69"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["69"]["Thickness"] = 1.5;
							Colorpicker["69"]["Color"] = Color3.fromRGB(29, 29, 29);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame
							Colorpicker["6a"] = Instance.new("ImageButton", Colorpicker["67"]);
							Colorpicker["6a"]["Active"] = false;
							Colorpicker["6a"].ZIndex = 2
							Colorpicker["6a"]["AutoButtonColor"] = false;
							Colorpicker["6a"]["BackgroundColor3"] = options.default;
							Colorpicker["6a"]["Selectable"] = false;
							Colorpicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6a"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["6a"]["Name"] = [[Frame]];
							Colorpicker["6a"]["Position"] = UDim2.new(0, 75, 0, 71);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame
							Colorpicker["6b"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["6b"]["BorderSizePixel"] = 0;
							Colorpicker["6b"].ZIndex = 2
							Colorpicker["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6b"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
							Colorpicker["6b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UIGradient
							Colorpicker["6c"] = Instance.new("UIGradient", Colorpicker["6b"]);
							Colorpicker["6c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UICorner
							Colorpicker["6d"] = Instance.new("UICorner", Colorpicker["6b"]);
							Colorpicker["6d"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame
							Colorpicker["6e"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["6e"]["BorderSizePixel"] = 0;
							Colorpicker["6e"].ZIndex = 2
							Colorpicker["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["6e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
							Colorpicker["6e"]["Size"] = UDim2.new(0, 140, 0, 130);
							Colorpicker["6e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
							Colorpicker["6e"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UIGradient
							Colorpicker["6f"] = Instance.new("UIGradient", Colorpicker["6e"]);
							Colorpicker["6f"]["Rotation"] = -90;
							Colorpicker["6f"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};
							Colorpicker["6f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Frame.UICorner
							Colorpicker["70"] = Instance.new("UICorner", Colorpicker["6e"]);
							Colorpicker["70"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.UICorner
							Colorpicker["71"] = Instance.new("UICorner", Colorpicker["6a"]);
							Colorpicker["71"]["CornerRadius"] = UDim.new(0, 3);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer
							Colorpicker["72"] = Instance.new("Frame", Colorpicker["6a"]);
							Colorpicker["72"]["BorderSizePixel"] = 0;
							Colorpicker["72"].ZIndex = 2
							Colorpicker["72"]["BackgroundColor3"] = options.default;
							Colorpicker["72"]["Size"] = UDim2.new(0, 12, 0, 12);
							Colorpicker["72"]["Position"] = UDim2.new(0, 128, 0, -1);
							Colorpicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
							Colorpicker["72"]["Name"] = [[Pointer]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer.UICorner
							Colorpicker["73"] = Instance.new("UICorner", Colorpicker["72"]);
							Colorpicker["73"]["CornerRadius"] = UDim.new(0, 100);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Frame.Pointer.UIStroke
							Colorpicker["74"] = Instance.new("UIStroke", Colorpicker["72"]);
							Colorpicker["74"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
							Colorpicker["74"]["Color"] = Color3.fromRGB(255, 255, 255);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip
							Colorpicker["75"] = Instance.new("ImageButton", Colorpicker["67"]);
							Colorpicker["75"]["Active"] = false;
							Colorpicker["75"].ZIndex = 2
							Colorpicker["75"]["AutoButtonColor"] = false;
							-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
							Colorpicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["75"]["Selectable"] = false;
							Colorpicker["75"]["Image"] = [[rbxassetid://252684207]];
							Colorpicker["75"]["Size"] = UDim2.new(0, 13, 0, 130);
							Colorpicker["75"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["75"]["Name"] = [[Strip]];
							Colorpicker["75"]["Position"] = UDim2.new(0, 151, 0, 5);


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.Pointer
							Colorpicker["76"] = Instance.new("Frame", Colorpicker["75"]);
							Colorpicker["76"]["BorderSizePixel"] = 0;
							Colorpicker["76"].ZIndex = 2
							Colorpicker["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
							Colorpicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0);
							Colorpicker["76"]["Size"] = UDim2.new(0, 13, 0, 3);
							Colorpicker["76"]["Position"] = UDim2.new(0, 6, 0, 0);
							Colorpicker["76"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
							Colorpicker["76"]["Name"] = [[Pointer]];


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.Pointer.UIStroke
							Colorpicker["77"] = Instance.new("UIStroke", Colorpicker["76"]);
							Colorpicker["77"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


							-- StarterGui.skibidihook.GlowEffect.Main.tabs.tab_Aimbot.left.section.toggle.colorpicker.picker.Strip.UICorner
							Colorpicker["78"] = Instance.new("UICorner", Colorpicker["75"]);
							Colorpicker["78"]["CornerRadius"] = UDim.new(0, 3);
						end

						Colorpicker["60"].MouseEnter:Connect(function()
							Colorpicker.Hover = true
							getService('TweenService'):Create(Colorpicker['60'], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}):Play()
						end)
						Colorpicker["60"].MouseLeave:Connect(function()
							Colorpicker.Hover = false
							getService('TweenService'):Create(Colorpicker['60'], TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(31,31,31)}):Play()
						end)

						Colorpicker["60"].InputBegan:Connect(function(i, gpe)
							if (gpe) then
								return
							end
							if (i.UserInputType == Enum.UserInputType.MouseButton1 and Colorpicker.Hover) then
								if (Colorpicker["67"].Visible) then
									getService('TweenService'):Create(Colorpicker["67"], TweenInfo.new(.25), {Size = Colorpicker.Sizes.Closed}):Play()
									task.wait(.25)
									Colorpicker["67"].Visible = false
								else
									Colorpicker["67"].Size = Colorpicker.Sizes.Closed
									if (#Miner.listsOpened >= 1) then
										local idx = Miner.listsOpened[1]
										for i,v in pairs(idx.instances) do
											getService('TweenService'):Create(v[1], TweenInfo.new(.25), v[2] or {}):Play()
										end
										idx.instances[1][1].Visible = false
										Miner.listsOpened = {}
									end
									Miner.listsOpened[1] = {
										instances = {
											{Colorpicker["67"], {Size = Colorpicker.Sizes.Open}}
										}
									}
									Colorpicker["67"].Visible = true
									getService('TweenService'):Create(Colorpicker["67"], TweenInfo.new(.25), {Size = Colorpicker.Sizes.Open}):Play()
								end

								--// Colorpicker controller


								--* Main gradient
								local mouse = getService('Players').LocalPlayer:GetMouse()
								local function inBounds(frame)
									local x,y = mouse.X - frame.AbsolutePosition.X,mouse.Y - frame.AbsolutePosition.Y
									local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
									if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
										return x/maxX,y/maxY
									end
								end
								local pointerRgb = Colorpicker["72"]
								local output = Colorpicker["65"]
								local rgbGradient = Colorpicker["6a"]

								local pointerSide = Colorpicker["76"]
								local darknessGradient = Colorpicker["75"]


								rgbGradient.InputBegan:Connect(function(i, gpe)
									if (gpe) then
										return
									end
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										if (Colorpicker.Connection) then
											return
										end
										Colorpicker.rgbActive = true
										Colorpicker.Connection = getService('RunService').RenderStepped:Connect(function()
											if (not inBounds(rgbGradient)) then
												return
											end
											pointerRgb:TweenPosition(
												UDim2.new(0,game.Players.LocalPlayer:GetMouse().X,0,game.Players.LocalPlayer:GetMouse().Y)-UDim2.new(0,rgbGradient.AbsolutePosition.X,0,rgbGradient.AbsolutePosition.Y)
												,Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0,true)
											local h,s,v = output.BackgroundColor3:ToHSV()
											local colour = Color3.fromHSV(h,math.clamp(pointerRgb.Position.X.Offset/rgbGradient.AbsoluteSize.X,0,1),(1-math.clamp(pointerRgb.Position.Y.Offset/rgbGradient.AbsoluteSize.Y,0,1)))
											output.BackgroundColor3 = colour
											pointerRgb.BackgroundColor3 = colour
											options.cb(colour)
										end)
									end
								end)

								rgbGradient.InputEnded:Connect(function(i)
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										Colorpicker.rgbActive = false
										if (Colorpicker.Connection) then
											Colorpicker.Connection:Disconnect()
											Colorpicker.Connection = nil
										end
									end
								end)


								--* side slider

								darknessGradient.InputBegan:Connect(function(i, gpe)
									if (gpe) then
										return
									end
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										if Colorpicker.Connection then
											return
										end

										Colorpicker.sideActive = true

										Colorpicker.Connection = getService('RunService').RenderStepped:Connect(function()

											if (not inBounds(darknessGradient)) then
												return
											end

											pointerSide:TweenPosition(
												UDim2.new(0.5,0,0,game.Players.LocalPlayer:GetMouse().Y)-UDim2.new(0,0,0,darknessGradient.AbsolutePosition.Y)
												,Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0,true)
											local h,s,v = output.BackgroundColor3:ToHSV()
											local colour = Color3.fromHSV(pointerSide.Position.Y.Offset/darknessGradient.AbsoluteSize.Y,s,v)
											rgbGradient.BackgroundColor3 = Color3.fromHSV(pointerSide.Position.Y.Offset/darknessGradient.AbsoluteSize.Y,1,1)
											output.BackgroundColor3 = colour
											pointerRgb.BackgroundColor3 = colour
											options.cb(colour)
										end)
									end
								end)
								darknessGradient.InputEnded:Connect(function(i)
									if (i.UserInputType == Enum.UserInputType.MouseButton1) then
										Colorpicker.sideActive = false
										if (Colorpicker.Connection) then
											Colorpicker.Connection:Disconnect()
											Colorpicker.Connection = nil
										end
									end
								end)



							end
						end)

						return Colorpicker
					end
					
					return Label
					
				end
				
				return Section
			end
			
			return Sector
			
		end

		
		return Tab
	end
	
	return Miner
end

return Library