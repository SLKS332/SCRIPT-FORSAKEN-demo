-- SLKS GAMING | DEMO HUB V0.1
-- FIXED MINIMIZE + INFO TAB (Mobile Safe)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-------------------------------------------------
-- MENU GUI
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

-------------------------------------------------
-- HEADER
-------------------------------------------------
local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,-90,0,60)
header.Position = UDim2.new(0,10,0,0)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING\nBY SLKS GAMING\nVERSION DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)
header.TextXAlignment = Left

-------------------------------------------------
-- BUTTONS (- / X)
-------------------------------------------------
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,15)
minBtn.Text = "-"
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 22
minBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
minBtn.TextColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,15)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(60,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", closeBtn)

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local infoBtn = Instance.new("TextButton", Menu)
infoBtn.Size = UDim2.new(0,100,0,32)
infoBtn.Position = UDim2.new(0,15,0,70)
infoBtn.Text = "INFO"
infoBtn.Font = Enum.Font.Code
infoBtn.TextSize = 16
infoBtn.TextColor3 = Color3.fromRGB(0,255,140)
infoBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
Instance.new("UICorner", infoBtn)

local infoFrame = Instance.new("Frame", Menu)
infoFrame.Size = UDim2.new(1,-30,1,-120)
infoFrame.Position = UDim2.new(0,15,0,110)
infoFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
infoFrame.BackgroundTransparency = 0.2
infoFrame.Visible = false
Instance.new("UICorner", infoFrame)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1,-20,0,90)
infoText.Position = UDim2.new(0,10,0,10)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.Font = Enum.Font.Code
infoText.TextSize = 15
infoText.TextColor3 = Color3.new(1,1,1)
infoText.Text = "SLKS GAMING HUB\nDemo Version V0.1\n\nYouTube & Discord bên dưới"

-------------------------------------------------
-- INFO BUTTON LOGIC
-------------------------------------------------
infoBtn.MouseButton1Click:Connect(function()
	infoFrame.Visible = not infoFrame.Visible
end)

-------------------------------------------------
-- MINIMIZE LOGIC (FIXED)
-------------------------------------------------
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized

	infoFrame.Visible = false
	infoBtn.Visible = not minimized

	Menu.Size = minimized 
		and UDim2.new(0,420,0,60) 
		or UDim2.new(0,420,0,260)
end)

-------------------------------------------------
-- CLOSE
-------------------------------------------------
closeBtn.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
