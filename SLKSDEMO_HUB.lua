-- SLKS GAMING | DEMO HUB V0.1
-- Loading + Menu + Info Tab (Mobile Safe)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
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
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
bar.Size = UDim2.new(0,0,1,0)
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
	TweenService:Create(bar,TweenInfo.new(0.03),{
		Size=UDim2.new(i/100,0,1,0)
	}):Play()
	task.wait(0.03)
end

task.wait(0.4)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui", player.PlayerGui)
MenuGui.IgnoreGuiInset = true
MenuGui.ResetOnSpawn = false

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.35
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,-80,0,60)
header.Position = UDim2.new(0,10,0,0)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING\nBY SLKS GAMING\nVERSION DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)
header.TextXAlignment = Left

-- MIN / CLOSE
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,15)
minBtn.Text="-"
minBtn.Font=Enum.Font.Code
minBtn.TextSize=22
minBtn.BackgroundColor3=Color3.fromRGB(20,20,20)
minBtn.TextColor3=Color3.fromRGB(0,255,140)
Instance.new("UICorner",minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,15)
closeBtn.Text="X"
closeBtn.Font=Enum.Font.Code
closeBtn.TextSize=18
closeBtn.BackgroundColor3=Color3.fromRGB(60,20,20)
closeBtn.TextColor3=Color3.fromRGB(255,80,80)
Instance.new("UICorner",closeBtn)

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local infoBtn = Instance.new("TextButton", Menu)
infoBtn.Size = UDim2.new(0,100,0,32)
infoBtn.Position = UDim2.new(0,15,0,70)
infoBtn.Text="INFO"
infoBtn.Font=Enum.Font.Code
infoBtn.TextSize=16
infoBtn.TextColor3=Color3.fromRGB(0,255,140)
infoBtn.BackgroundColor3=Color3.fromRGB(20,20,20)
Instance.new("UICorner",infoBtn)

local infoFrame = Instance.new("Frame", Menu)
infoFrame.Size = UDim2.new(1,-30,1,-120)
infoFrame.Position = UDim2.new(0,15,0,110)
infoFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
infoFrame.BackgroundTransparency = 0.2
infoFrame.Visible=false
Instance.new("UICorner",infoFrame)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size=UDim2.new(1,-20,0,90)
infoText.Position=UDim2.new(0,10,0,10)
infoText.BackgroundTransparency=1
infoText.TextWrapped=true
infoText.Font=Enum.Font.Code
infoText.TextSize=15
infoText.TextColor3=Color3.new(1,1,1)
infoText.Text="SLKS GAMING HUB\nDemo Version V0.1\n\nDiscord & YouTube bên dưới"

local yt = Instance.new("TextButton", infoFrame)
yt.Size=UDim2.new(0.45,0,0,35)
yt.Position=UDim2.new(0.03,0,1,-45)
yt.Text="YouTube"
yt.BackgroundColor3=Color3.fromRGB(200,60,60)
Instance.new("UICorner",yt)

local dc = Instance.new("TextButton", infoFrame)
dc.Size=UDim2.new(0.45,0,0,35)
dc.Position=UDim2.new(0.52,0,1,-45)
dc.Text="Discord"
dc.BackgroundColor3=Color3.fromRGB(60,90,200)
Instance.new("UICorner",dc)

infoBtn.MouseButton1Click:Connect(function()
	infoFrame.Visible=not infoFrame.Visible
end)

-------------------------------------------------
-- MINIMIZE
-------------------------------------------------
local minimized=false
minBtn.MouseButton1Click:Connect(function()
	minimized=not minimized
	infoFrame.Visible=false
	Menu.Size = minimized and UDim2.new(0,420,0,60) or UDim2.new(0,420,0,260)
end)

closeBtn.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
