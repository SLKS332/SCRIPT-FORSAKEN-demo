--// SLKS GAMING HUB V0.1 | FULL
--// Loading + Menu + Tabs + Teleport Speed + ESP
--// Mobile / Delta Safe

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-------------------------------------------------
-- LOADING
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui", player.PlayerGui)
LoadingGui.IgnoreGuiInset = true
LoadingGui.ResetOnSpawn = false

local bg = Instance.new("Frame", LoadingGui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(5,10,15)

local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,360,0,180)
box.Position = UDim2.new(0.5,-180,0.5,-90)
box.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", box)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-40)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)

for i = 1,100 do
	percent.Text = "Loading "..i.."%"
	task.wait(0.02)
end
LoadingGui:Destroy()

-------------------------------------------------
-- MENU
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.ResetOnSpawn = false

local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,460,0,320)
Menu.Position = UDim2.new(0.5,-230,0.5,-160)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.25
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,50)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING HUB | DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

local function topBtn(txt, x, col)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,30,0,30)
	b.Position = UDim2.new(1,x,0,10)
	b.Text = txt
	b.Font = Enum.Font.Code
	b.TextSize = 18
	b.BackgroundColor3 = col
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	return b
end

local minBtn = topBtn("-", -70, Color3.fromRGB(30,30,30))
local closeBtn = topBtn("X", -35, Color3.fromRGB(80,30,30))

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs, pages = {}, {}

local function tabBtn(name, x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,110,0,30)
	b.Position = UDim2.new(0,x,0,60)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(0,255,140)
	b.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = tabBtn("MAIN", 15)
tabs.Info = tabBtn("INFO", 135)
tabs.Set = tabBtn("SETTING", 255)

local function page()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-30,1,-110)
	f.Position = UDim2.new(0,15,0,100)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = page()
pages.Info = page()
pages.Set = page()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end
switch("Main")

tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
tabs.Set.MouseButton1Click:Connect(function() switch("Set") end)

-------------------------------------------------
-- MAIN : TELEPORT SPEED
-------------------------------------------------
local speed = 16
local speedOn = false

local speedLabel = Instance.new("TextLabel", pages.Main)
speedLabel.Size = UDim2.new(1,0,0,30)
speedLabel.Text = "Teleport Speed: 16"
speedLabel.Font = Enum.Font.Code
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.BackgroundTransparency = 1

local slider = Instance.new("Frame", pages.Main)
slider.Position = UDim2.new(0,0,0,35)
slider.Size = UDim2.new(1,0,0,16)
slider.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", slider)

local fill = Instance.new("Frame", slider)
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", fill)

slider.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		local move
		move = UIS.InputChanged:Connect(function(m)
			if m.UserInputType == Enum.UserInputType.Touch or m.UserInputType == Enum.UserInputType.MouseMovement then
				local p = math.clamp((m.Position.X - slider.AbsolutePosition.X)/slider.AbsoluteSize.X,0,1)
				speed = math.floor(p * 50)
				fill.Size = UDim2.new(p,0,1,0)
				speedLabel.Text = "Teleport Speed: "..speed
			end
		end)
		UIS.InputEnded:Wait()
		move:Disconnect()
	end
end)

local speedBtn = Instance.new("TextButton", pages.Main)
speedBtn.Position = UDim2.new(0,0,0,60)
speedBtn.Size = UDim2.new(0,160,0,30)
speedBtn.Text = "SPEED : OFF"
speedBtn.Font = Enum.Font.Code
speedBtn.BackgroundColor3 = Color3.fromRGB(80,30,30)
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	speedBtn.Text = speedOn and "SPEED : ON" or "SPEED : OFF"
	speedBtn.BackgroundColor3 = speedOn and Color3.fromRGB(30,80,30) or Color3.fromRGB(80,30,30)
end)

RunService.Heartbeat:Connect(function()
	if speedOn and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = player.Character.HumanoidRootPart
		hrp.Velocity = hrp.CFrame.LookVector * speed
	end
end)

-------------------------------------------------
-- MAIN : ESP
-------------------------------------------------
local espK, espS, espG = false,false,false
local ESPs = {}

local function clearESP()
	for _,v in pairs(ESPs) do if v then v:Destroy() end end
	table.clear(ESPs)
end

local function addESP(obj, col)
	if obj and not ESPs[obj] then
		local h = Instance.new("Highlight")
		h.FillColor = col
		h.OutlineColor = col
		h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		h.Parent = obj
		ESPs[obj] = h
	end
end

local function updateESP()
	clearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character then
			if espK and plr.Character:FindFirstChildOfClass("Tool") then
				addESP(plr.Character, Color3.fromRGB(255,0,0))
			end
			if espS then
				addESP(plr.Character, Color3.fromRGB(0,255,0))
			end
		end
	end
	if espG then
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") and v.Name:lower():find("generator") then
				addESP(v, Color3.fromRGB(255,255,0))
			end
		end
	end
end

local function espBtn(text, y, cb)
	local b = Instance.new("TextButton", pages.Main)
	b.Size = UDim2.new(0,180,0,30)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text.." : OFF"
	b.Font = Enum.Font.Code
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Instance.new("UICorner", b)
	local on = false
	b.MouseButton1Click:Connect(function()
		on = not on
		b.Text = text..(on and " : ON" or " : OFF")
		cb(on)
		updateESP()
	end)
end

espBtn("ESP KILLER", 100, function(v) espK=v end)
espBtn("ESP SURVIVAL", 135, function(v) espS=v end)
espBtn("ESP GENERATOR", 170, function(v) espG=v end)

-------------------------------------------------
-- INFO
-------------------------------------------------
local info = Instance.new("TextLabel", pages.Info)
info.Size = UDim2.new(1,0,1,0)
info.TextWrapped = true
info.Text = "SLKS GAMING HUB\nDemo V0.1\n\nYouTube & Discord sắp mở 🔥"
info.Font = Enum.Font.Code
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1

-------------------------------------------------
-- MIN / CLOSE
-------------------------------------------------
local mini = false
minBtn.MouseButton1Click:Connect(function()
	mini = not mini
	for _,v in pairs(Menu:GetChildren()) do
		if v:IsA("GuiObject") and v ~= header and v ~= minBtn and v ~= closeBtn then
			v.Visible = not mini
		end
	end
	Menu.Size = mini and UDim2.new(0,460,0,50) or UDim2.new(0,460,0,320)
end)

closeBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)
