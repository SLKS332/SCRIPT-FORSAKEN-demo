-- SLKS GAMING HUB | STABLE VERSION
-- Loading + Menu + Tabs | Delta Mobile Safe

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
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local binary = Instance.new("TextLabel", box)
binary.Size = UDim2.new(1,-20,0,60)
binary.Position = UDim2.new(0,10,0,50)
binary.BackgroundTransparency = 1
binary.Font = Enum.Font.Code
binary.TextWrapped = true
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
		local s=""
		for i=1,math.random(40,70) do
			s..=math.random(0,1)
		end
		binary.Text=s
		task.wait(0.15)
	end
end)

for i=1,100 do
	percent.Text="Loading "..i.."%"
	bar.Size=UDim2.new(i/100,0,1,0)
	task.wait(0.02)
end

task.wait(0.3)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.ResetOnSpawn = false

local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,430,0,280)
Menu.Position = UDim2.new(0.5,-215,0.5,-140)
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

-- Buttons
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,10)
minBtn.Text="-"
minBtn.Font=Enum.Font.Code
minBtn.TextSize=22
minBtn.BackgroundColor3=Color3.fromRGB(25,25,25)
minBtn.TextColor3=Color3.fromRGB(0,255,140)
Instance.new("UICorner",minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,10)
closeBtn.Text="X"
closeBtn.Font=Enum.Font.Code
closeBtn.TextSize=18
closeBtn.BackgroundColor3=Color3.fromRGB(80,25,25)
closeBtn.TextColor3=Color3.fromRGB(255,90,90)
Instance.new("UICorner",closeBtn)

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabBar = Instance.new("Frame", Menu)
tabBar.Size = UDim2.new(0,110,1,-60)
tabBar.Position = UDim2.new(0,10,0,55)
tabBar.BackgroundTransparency = 1

local function makeTab(name,y)
	local b=Instance.new("TextButton",tabBar)
	b.Size=UDim2.new(1,0,0,35)
	b.Position=UDim2.new(0,0,0,y)
	b.Text=name
	b.Font=Enum.Font.Code
	b.TextSize=14
	b.TextColor3=Color3.fromRGB(0,255,140)
	b.BackgroundColor3=Color3.fromRGB(20,20,20)
	Instance.new("UICorner",b)
	return b
end

local mainTab=makeTab("MAIN",0)
local infoTab=makeTab("INFO",45)
local setTab=makeTab("SETTING",90)

local function makePage()
	local f=Instance.new("Frame",Menu)
	f.Size=UDim2.new(1,-140,1,-70)
	f.Position=UDim2.new(0,130,0,60)
	f.BackgroundTransparency=1
	f.Visible=false
	return f
end

local MainPage=makePage()
local InfoPage=makePage()
local SetPage=makePage()

MainPage.Visible=true

local function switch(p)
	MainPage.Visible=false
	InfoPage.Visible=false
	SetPage.Visible=false
	p.Visible=true
end

mainTab.MouseButton1Click:Connect(function()switch(MainPage)end)
infoTab.MouseButton1Click:Connect(function()switch(InfoPage)end)
setTab.MouseButton1Click:Connect(function()switch(SetPage)end)

-------------------------------------------------
-- MAIN CONTENT
-------------------------------------------------
local function toggle(parent,text,y)
	local b=Instance.new("TextButton",parent)
	b.Size=UDim2.new(0.8,0,0,35)
	b.Position=UDim2.new(0.1,0,0,y)
	b.Text=text..": OFF"
	b.Font=Enum.Font.Code
	b.TextSize=14
	b.TextColor3=Color3.fromRGB(255,255,255)
	b.BackgroundColor3=Color3.fromRGB(40,40,40)
	Instance.new("UICorner",b)
	local on=false
	b.MouseButton1Click:Connect(function()
		on=not on
		b.Text=text..(on and ": ON" or ": OFF")
	end)
end

toggle(MainPage,"ESP Survivor",0)
toggle(MainPage,"ESP Killer",45)
toggle(MainPage,"ESP Generator",90)
toggle(MainPage,"Teleport Speed (0-50)",135)

-------------------------------------------------
-- INFO CONTENT
-------------------------------------------------
local infoText=Instance.new("TextLabel",InfoPage)
infoText.Size=UDim2.new(1,0,0,120)
infoText.BackgroundTransparency=1
infoText.TextWrapped=true
infoText.Text="SLKS GAMING HUB\nDemo V0.1\n\nYouTube & Discord để phát triển cộng đồng"
infoText.Font=Enum.Font.Code
infoText.TextSize=14
infoText.TextColor3=Color3.fromRGB(255,255,255)

-------------------------------------------------
-- MINIMIZE & CLOSE
-------------------------------------------------
local minimized=false
minBtn.MouseButton1Click:Connect(function()
	minimized=not minimized
	for _,v in ipairs(Menu:GetChildren()) do
		if v~=header and v~=minBtn and v~=closeBtn then
			v.Visible=not minimized
		end
	end
	Menu.Size=minimized and UDim2.new(0,430,0,50) or UDim2.new(0,430,0,280)
end)

closeBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)
