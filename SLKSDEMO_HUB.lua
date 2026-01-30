-- SLKS GAMING | DEMO HUB V0.1 (FIX UI)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-------------------------------------------------
-- MENU GUI
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui", player.PlayerGui)
MenuGui.ResetOnSpawn = false

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.25
Menu.Active = true
Menu.Draggable = true
Menu.ZIndex = 1
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

-------------------------------------------------
-- HEADER
-------------------------------------------------
local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,55)
header.Position = UDim2.new(0,0,0,0)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING  |  DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)
header.ZIndex = 2

-------------------------------------------------
-- BUTTONS (- X)
-------------------------------------------------
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,12)
minBtn.Text = "-"
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 24
minBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
minBtn.TextColor3 = Color3.fromRGB(0,255,140)
minBtn.ZIndex = 3
Instance.new("UICorner", minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,12)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(70,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
closeBtn.ZIndex = 3
Instance.new("UICorner", closeBtn)

-------------------------------------------------
-- INFO TAB BUTTON
-------------------------------------------------
local infoBtn = Instance.new("TextButton", Menu)
infoBtn.Size = UDim2.new(0,90,0,30)
infoBtn.Position = UDim2.new(0,15,0,65)
infoBtn.Text = "INFO"
infoBtn.Font = Enum.Font.Code
infoBtn.TextSize = 16
infoBtn.TextColor3 = Color3.fromRGB(0,255,140)
infoBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
infoBtn.ZIndex = 2
Instance.new("UICorner", infoBtn)

-------------------------------------------------
-- INFO FRAME
-------------------------------------------------
local infoFrame = Instance.new("Frame", Menu)
infoFrame.Size = UDim2.new(1,-30,1,-110)
infoFrame.Position = UDim2.new(0,15,0,105)
infoFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
infoFrame.BackgroundTransparency = 0.15
infoFrame.Visible = false
infoFrame.ZIndex = 2
Instance.new("UICorner", infoFrame)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1,-20,0,90)
infoText.Position = UDim2.new(0,10,0,10)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.Text = "SLKS GAMING HUB\nDemo Version V0.1\n\nMục tiêu: Discord đông người 😎"
infoText.Font = Enum.Font.Code
infoText.TextSize = 15
infoText.TextColor3 = Color3.fromRGB(255,255,255)
infoText.ZIndex = 3

local yt = Instance.new("TextButton", infoFrame)
yt.Size = UDim2.new(0.45,0,0,36)
yt.Position = UDim2.new(0.03,0,1,-46)
yt.Text = "YouTube"
yt.BackgroundColor3 = Color3.fromRGB(200,60,60)
yt.TextColor3 = Color3.new(1,1,1)
yt.ZIndex = 3
Instance.new("UICorner", yt)

local dc = Instance.new("TextButton", infoFrame)
dc.Size = UDim2.new(0.45,0,0,36)
dc.Position = UDim2.new(0.52,0,1,-46)
dc.Text = "Discord"
dc.BackgroundColor3 = Color3.fromRGB(80,100,220)
dc.TextColor3 = Color3.new(1,1,1)
dc.ZIndex = 3
Instance.new("UICorner", dc)

-------------------------------------------------
-- LOGIC
-------------------------------------------------
infoBtn.MouseButton1Click:Connect(function()
	infoFrame.Visible = not infoFrame.Visible
end)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	infoFrame.Visible = false
	Menu.Size = minimized and UDim2.new(0,420,0,55) or UDim2.new(0,420,0,260)
end)

closeBtn.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
