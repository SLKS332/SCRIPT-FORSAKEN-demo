-- SLKS GAMING HUB V0.1 (FINAL)
-- Loading + Menu + Tabs + Smooth Slider
-- Mobile / Delta Safe

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
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
box.Size = UDim2.new(0,360,0,160)
box.Position = UDim2.new(0.5,-180,0.5,-80)
box.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local percent = Instance.new("TextLabel", box)
percent.Position = UDim2.new(0,0,1,-40)
percent.Size = UDim2.new(1,0,0,30)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)

for i=1,100 do
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
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,50)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING HUB | V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

-- top buttons
local function topBtn(txt, x, color)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,30,0,30)
	b.Position = UDim2.new(1,x,0,10)
	b.Text = txt
	b.Font = Enum.Font.Code
	b.TextSize = 20
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = color
	Instance.new("UICorner", b)
	return b
end

local minBtn = topBtn("-", -70, Color3.fromRGB(30,30,30))
local closeBtn = topBtn("X", -35, Color3.fromRGB(80,30,30))

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs = {}
local pages = {}

local function createTab(name, x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,110,0,32)
	b.Position = UDim2.new(0,x,0,60)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextSize = 16
	b.TextColor3 = Color3.fromRGB(0,255,140)
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = createTab("MAIN", 15)
tabs.Info = createTab("INFO", 135)
tabs.Set = createTab("SETTING", 255)

local function createPage()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-30,1,-120)
	f.Position = UDim2.new(0,15,0,105)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = createPage()
pages.Info = createPage()
pages.Set = createPage()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end
switch("Main")

tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
tabs.Set.MouseButton1Click:Connect(function() switch("Set") end)

-------------------------------------------------
-- MAIN TAB : TELEPORT SPEED
-------------------------------------------------
local speed = 16
local speedOn = false

local speedLabel = Instance.new("TextLabel", pages.Main)
speedLabel.Size = UDim2.new(1,0,0,30)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.Code
speedLabel.TextSize = 16
speedLabel.TextColor3 = Color3.fromRGB(0,255,140)
speedLabel.Text = "Teleport Speed: 16"

-- slider bg
local sliderBG = Instance.new("Frame", pages.Main)
sliderBG.Position = UDim2.new(0,0,0,40)
sliderBG.Size = UDim2.new(1,0,0,14)
sliderBG.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", sliderBG).CornerRadius = UDim.new(1,0)

local sliderFill = Instance.new("Frame", sliderBG)
sliderFill.Size = UDim2.new(0,0,1,0)
sliderFill.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1,0)

local knob = Instance.new("Frame", sliderBG)
knob.Size = UDim2.new(0,22,0,22)
knob.Position = UDim2.new(0,-11,0.5,-11)
knob.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

local dragging = false
knob.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
	end
end)

UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
		local x = math.clamp((i.Position.X - sliderBG.AbsolutePosition.X)/sliderBG.AbsoluteSize.X,0,1)
		speed = math.floor(x*50)
		speedLabel.Text = "Teleport Speed: "..speed
		sliderFill.Size = UDim2.new(x,0,1,0)
		knob.Position = UDim2.new(x,-11,0.5,-11)
	end
end)

local speedBtn = Instance.new("TextButton", pages.Main)
speedBtn.Position = UDim2.new(0,0,0,80)
speedBtn.Size = UDim2.new(0,150,0,32)
speedBtn.Text = "SPEED : OFF"
speedBtn.Font = Enum.Font.Code
speedBtn.TextSize = 16
speedBtn.TextColor3 = Color3.fromRGB(0,255,140)
speedBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	speedBtn.Text = speedOn and "SPEED : ON" or "SPEED : OFF"
end)

RunService.Heartbeat:Connect(function()
	if speedOn and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame *= CFrame.new(0,0,-speed/100)
	end
end)

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local info = Instance.new("TextLabel", pages.Info)
info.Size = UDim2.new(1,0,1,0)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.TextYAlignment = Enum.TextYAlignment.Top
info.Font = Enum.Font.Code
info.TextSize = 14
info.TextColor3 = Color3.fromRGB(255,255,255)
info.Text = [[
SLKS GAMING HUB
VERSION : V0.1

FEATURES :
• Teleport Speed (Slider + ON/OFF)
• Mobile / Delta Safe
• Stable UI

AUTHOR :
SLKS GAMING

YouTube : SLKS GAMING
Discord : Coming Soon
]]

-------------------------------------------------
-- SETTING TAB
-------------------------------------------------
local setTxt = Instance.new("TextLabel", pages.Set)
setTxt.Size = UDim2.new(1,0,0,30)
setTxt.BackgroundTransparency = 1
setTxt.Font = Enum.Font.Code
setTxt.TextSize = 14
setTxt.TextColor3 = Color3.fromRGB(255,255,255)
setTxt.Text = "Setting đang phát triển..."

-------------------------------------------------
-- MINIMIZE / CLOSE
-------------------------------------------------
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _,v in ipairs(Menu:GetChildren()) do
		if v:IsA("GuiObject") and v ~= header and v ~= minBtn and v ~= closeBtn then
			v.Visible = not minimized
		end
	end
	Menu.Size = minimized and UDim2.new(0,460,0,50) or UDim2.new(0,460,0,320)
end)

closeBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)
