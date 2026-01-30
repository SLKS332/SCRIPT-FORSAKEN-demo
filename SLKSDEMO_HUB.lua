-- SLKS GAMING | LOADING + MENU + TAB (STABLE)
-- Mobile Safe (Delta)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-------------------------------------------------
-- LOADING GUI
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
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local binary = Instance.new("TextLabel", box)
binary.Size = UDim2.new(1,-20,0,60)
binary.Position = UDim2.new(0,10,0,50)
binary.BackgroundTransparency = 1
binary.TextWrapped = true
binary.Font = Enum.Font.Code
binary.TextSize = 14
binary.TextColor3 = Color3.fromRGB(0,200,120)

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(1,-40,0,16)
barBG.Position = UDim2.new(0,20,1,-40)
barBG.BackgroundColor3 = Color3.fromRGB(30,50,60)
Instance.new("UICorner", barBG)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", bar)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-65)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)

task.spawn(function()
	while LoadingGui.Parent do
		local s = ""
		for i=1,math.random(40,70) do
			s ..= math.random(0,1)
		end
		binary.Text = s
		task.wait(0.15)
	end
end)

for i=1,100 do
	percent.Text = "Loading "..i.."%"
	TweenService:Create(bar,TweenInfo.new(0.025),{
		Size = UDim2.new(i/100,0,1,0)
	}):Play()
	task.wait(0.025)
end

task.wait(0.4)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU GUI
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main.BackgroundTransparency = 0.25
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(0,255,140)
Stroke.Thickness = 2

-------------------------------------------------
-- HEADER
-------------------------------------------------
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundTransparency = 1

local Title2 = Instance.new("TextLabel", Header)
Title2.Size = UDim2.new(1,-100,1,0)
Title2.Position = UDim2.new(0,10,0,0)
Title2.BackgroundTransparency = 1
Title2.Text = "SLKS GAMING | DEMO V0.1"
Title2.Font = Enum.Font.Code
Title2.TextSize = 18
Title2.TextColor3 = Color3.fromRGB(0,255,140)
Title2.TextXAlignment = Left

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size = UDim2.new(0,30,0,30)
MinBtn.Position = UDim2.new(1,-70,0,10)
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.Code
MinBtn.TextSize = 22
MinBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
MinBtn.TextColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", MinBtn)

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0,30,0,30)
CloseBtn.Position = UDim2.new(1,-35,0,10)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 18
CloseBtn.BackgroundColor3 = Color3.fromRGB(60,20,20)
CloseBtn.TextColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", CloseBtn)

-------------------------------------------------
-- TAB BAR + CONTENT
-------------------------------------------------
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(0,120,1,-60)
TabBar.Position = UDim2.new(0,10,0,50)
TabBar.BackgroundTransparency = 1

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-150,1,-60)
Content.Position = UDim2.new(0,140,0,50)
Content.BackgroundTransparency = 1

-------------------------------------------------
-- TAB SYSTEM
-------------------------------------------------
local CurrentTab
local TabIndex = 0

local function CreateTab(name)
	local btn = Instance.new("TextButton", TabBar)
	btn.Size = UDim2.new(1,0,0,40)
	btn.Position = UDim2.new(0,0,0,TabIndex*45)
	btn.Text = name
	btn.Font = Enum.Font.Code
	btn.TextSize = 16
	btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
	btn.TextColor3 = Color3.fromRGB(0,255,140)
	Instance.new("UICorner", btn)

	local page = Instance.new("Frame", Content)
	page.Size = UDim2.new(1,0,1,0)
	page.Visible = false
	page.BackgroundTransparency = 1

	btn.MouseButton1Click:Connect(function()
		if CurrentTab then CurrentTab.Visible = false end
		page.Visible = true
		CurrentTab = page
	end)

	if not CurrentTab then
		page.Visible = true
		CurrentTab = page
	end

	TabIndex += 1
	return page
end

-------------------------------------------------
-- TABS
-------------------------------------------------
local InfoTab = CreateTab("INFO")
local MainTab = CreateTab("MAIN")
local SettingTab = CreateTab("SETTING")

-------------------------------------------------
-- TAB CONTENT
-------------------------------------------------
local function MakeLabel(parent,text)
	local lb = Instance.new("TextLabel", parent)
	lb.Size = UDim2.new(1,0,0,80)
	lb.BackgroundTransparency = 1
	lb.TextWrapped = true
	lb.Text = text
	lb.Font = Enum.Font.Code
	lb.TextSize = 16
	lb.TextColor3 = Color3.new(1,1,1)
end

MakeLabel(InfoTab,"SLKS GAMING HUB\nDemo V0.1\n\nYouTube | Discord")
MakeLabel(MainTab,"MAIN TAB\nGắn ESP / Teleport sau")
MakeLabel(SettingTab,"SETTING TAB\nUI / Option")

-------------------------------------------------
-- MINIMIZE + CLOSE
-------------------------------------------------
local minimized = false
local fullSize = Main.Size

MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	TabBar.Visible = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,420,0,50) or fullSize
end)

CloseBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)
