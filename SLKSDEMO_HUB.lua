-- SLKS HUB | NEW CLEAN VERSION
-- Loading + Menu + Tabs (MAIN / INFO / SETTING)
-- Mobile + Delta Safe

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
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
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "SLKS HUB"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(1,-40,0,16)
barBG.Position = UDim2.new(0,20,1,-40)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
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
percent.Text = "Loading 0%"

for i = 1,100 do
	percent.Text = "Loading "..i.."%"
	TweenService:Create(bar,TweenInfo.new(0.03),{
		Size = UDim2.new(i/100,0,1,0)
	}):Play()
	task.wait(0.03)
end

task.wait(0.3)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui", player.PlayerGui)
MenuGui.ResetOnSpawn = false

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.3
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

-- Header
local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,50)
header.BackgroundTransparency = 1
header.Text = "SLKS HUB | v0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

-- Buttons
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,10)
minBtn.Text = "-"
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 22
minBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
minBtn.TextColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,10)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(60,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", closeBtn)

-------------------------------------------------
-- TAB BUTTONS
-------------------------------------------------
local tabHolder = Instance.new("Frame", Menu)
tabHolder.Size = UDim2.new(1,-20,0,35)
tabHolder.Position = UDim2.new(0,10,0,55)
tabHolder.BackgroundTransparency = 1

local function makeTab(text, x)
	local b = Instance.new("TextButton", tabHolder)
	b.Size = UDim2.new(0,120,1,0)
	b.Position = UDim2.new(0,x,0,0)
	b.Text = text
	b.Font = Enum.Font.Code
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(0,255,140)
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Instance.new("UICorner", b)
	return b
end

local mainTab = makeTab("MAIN",0)
local infoTab = makeTab("INFO",130)
local setTab  = makeTab("SETTING",260)

-------------------------------------------------
-- PAGES
-------------------------------------------------
local pages = Instance.new("Frame", Menu)
pages.Size = UDim2.new(1,-20,1,-100)
pages.Position = UDim2.new(0,10,0,95)
pages.BackgroundTransparency = 1

local function makePage(text)
	local f = Instance.new("TextLabel", pages)
	f.Size = UDim2.new(1,0,1,0)
	f.BackgroundTransparency = 1
	f.Text = text
	f.Font = Enum.Font.Code
	f.TextSize = 16
	f.TextColor3 = Color3.fromRGB(255,255,255)
	f.Visible = false
	return f
end

local mainPage = makePage("MAIN TAB\n\nScript chính ở đây")
local infoPage = makePage("INFO TAB\n\nYouTube | Discord")
local setPage  = makePage("SETTING TAB\n\nCài đặt")

-- ✅ FIX QUAN TRỌNG
mainPage.Visible = true

local function switch(page)
	mainPage.Visible = false
	infoPage.Visible = false
	setPage.Visible = false
	page.Visible = true
end

mainTab.MouseButton1Click:Connect(function() switch(mainPage) end)
infoTab.MouseButton1Click:Connect(function() switch(infoPage) end)
setTab.MouseButton1Click:Connect(function() switch(setPage) end)

-------------------------------------------------
-- MINIMIZE / CLOSE
-------------------------------------------------
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	pages.Visible = not minimized
	tabHolder.Visible = not minimized
	Menu.Size = minimized and UDim2.new(0,420,0,60) or UDim2.new(0,420,0,260)
end)

closeBtn.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
