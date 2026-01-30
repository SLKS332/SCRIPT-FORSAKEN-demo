-- SLKS GAMING | LOADING + MENU FIX (DELTA MOBILE SAFE)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-------------------------------------------------
-- LOADING GUI
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.IgnoreGuiInset = true
LoadingGui.ResetOnSpawn = false
LoadingGui.Parent = player:WaitForChild("PlayerGui")

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
binary.Font = Enum.Font.Code
binary.TextSize = 14
binary.TextWrapped = true
binary.TextColor3 = Color3.fromRGB(0,200,120)

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(1,-40,0,16)
barBG.Position = UDim2.new(0,20,1,-40)
barBG.BackgroundColor3 = Color3.fromRGB(30,50,60)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-65)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)
percent.Text = "Loading 0%"

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
	bar.Size = UDim2.new(i/100,0,1,0)
	task.wait(0.03)
end

task.wait(0.5)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU GUI (FIX 100%)
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui")
MenuGui.ResetOnSpawn = false
MenuGui.Parent = player.PlayerGui

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

-- TOP BAR
local Top = Instance.new("Frame", Menu)
Top.Size = UDim2.new(1,0,0,40)
Top.BackgroundColor3 = Color3.fromRGB(10,20,30)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-80,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLKS HUB | v0.1"
Title.Font = Enum.Font.Code
Title.TextSize = 18
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(0,255,140)

-- MINIMIZE
local Min = Instance.new("TextButton", Top)
Min.Size = UDim2.new(0,30,0,30)
Min.Position = UDim2.new(1,-70,0,5)
Min.Text = "-"
Min.Font = Enum.Font.Code
Min.TextSize = 22
Min.BackgroundColor3 = Color3.fromRGB(30,50,60)

-- CLOSE
local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-35,0,5)
Close.Text = "X"
Close.Font = Enum.Font.Code
Close.TextSize = 18
Close.BackgroundColor3 = Color3.fromRGB(60,30,30)

-------------------------------------------------
-- TABS
-------------------------------------------------
local Tabs = {"MAIN","INFO","SETTING"}
local TabButtons = {}
local Pages = {}

local TabBar = Instance.new("Frame", Menu)
TabBar.Position = UDim2.new(0,0,0,40)
TabBar.Size = UDim2.new(1,0,0,35)
TabBar.BackgroundTransparency = 1

for i,name in ipairs(Tabs) do
	local btn = Instance.new("TextButton", TabBar)
	btn.Size = UDim2.new(0,120,1,0)
	btn.Position = UDim2.new(0,(i-1)*130+10,0,0)
	btn.Text = name
	btn.Font = Enum.Font.Code
	btn.TextSize = 16
	btn.BackgroundColor3 = Color3.fromRGB(25,40,50)
	TabButtons[name] = btn

	local page = Instance.new("Frame", Menu)
	page.Position = UDim2.new(0,10,0,85)
	page.Size = UDim2.new(1,-20,1,-95)
	page.BackgroundTransparency = 1
	page.Visible = (name=="MAIN")
	Pages[name] = page
end

for name,btn in pairs(TabButtons) do
	btn.MouseButton1Click:Connect(function()
		for n,p in pairs(Pages) do
			p.Visible = (n==name)
		end
	end)
end

-------------------------------------------------
-- INFO TAB CONTENT
-------------------------------------------------
local info = Instance.new("TextLabel", Pages.INFO)
info.Size = UDim2.new(1,0,1,0)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Font = Enum.Font.Code
info.TextSize = 16
info.TextColor3 = Color3.fromRGB(0,255,140)
info.Text = "SLKS HUB\nForsaken Script\n\nYouTube: SLKS GAMING\nDiscord: Coming Soon"

-------------------------------------------------
-- MINIMIZE / CLOSE
-------------------------------------------------
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _,v in ipairs(Menu:GetChildren()) do
		if v ~= Top then
			v.Visible = not minimized
		end
	end
end)

Close.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
