--====================================
-- SLK GAMING HUB | MENU V1
-- Red + Transparent | Frame Only
--====================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

pcall(function()
    player.PlayerGui:FindFirstChild("SLK_V1"):Destroy()
end)

local Gui = Instance.new("ScreenGui")
Gui.Name = "SLK_V1"
Gui.ResetOnSpawn = false
Gui.Parent = player.PlayerGui

-- MAIN FRAME
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,520,0,300)
Main.Position = UDim2.new(0.5,-260,0.5,-150)
Main.BackgroundColor3 = Color3.fromRGB(150, 30, 30) -- đỏ
Main.BackgroundTransparency = 0.25 -- trong suốt
Main.Active = true
Main.Draggable = true
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,10)

-- TOP BAR
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,40)
Top.BackgroundColor3 = Color3.fromRGB(120, 20, 20)
Top.BackgroundTransparency = 0.15
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,10)

-- TITLE
local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-180,1,0)
Title.Position = UDim2.new(0,12,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK GAMING HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(255,230,230)

-- VERSION (CỤC ĐỎ NHẠT)
local Version = Instance.new("TextLabel", Top)
Version.Size = UDim2.new(0,100,0,24)
Version.Position = UDim2.new(1,-240,0.5,-12)
Version.BackgroundColor3 = Color3.fromRGB(255, 90, 90)
Version.BackgroundTransparency = 0.1
Version.Text = "Version v1"
Version.Font = Enum.Font.GothamBold
Version.TextSize = 13
Version.TextColor3 = Color3.fromRGB(40,0,0)
Instance.new("UICorner", Version).CornerRadius = UDim.new(1,0)

-- MINIMIZE (-)
local Min = Instance.new("TextButton", Top)
Min.Size = UDim2.new(0,30,0,24)
Min.Position = UDim2.new(1,-80,0.5,-12)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(200,60,60)
Min.BackgroundTransparency = 0.2
Min.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Min)

-- CLOSE (X)
local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0,30,0,24)
Close.Position = UDim2.new(1,-40,0.5,-12)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.BackgroundColor3 = Color3.fromRGB(180,40,40)
Close.BackgroundTransparency = 0.1
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Close)

-- CONTENT (TRỐNG)
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,10,0,50)
Content.Size = UDim2.new(1,-20,1,-60)
Content.BackgroundColor3 = Color3.fromRGB(120,30,30)
Content.BackgroundTransparency = 0.35
Content.BorderSizePixel = 0
Instance.new("UICorner", Content).CornerRadius = UDim.new(0,8)

local Text = Instance.new("TextLabel", Content)
Text.Size = UDim2.new(1,0,1,0)
Text.BackgroundTransparency = 1
Text.Text = "MENU V1\nKHUNG ONLY\nMÀU ĐỎ TRONG SUỐT"
Text.Font = Enum.Font.Gotham
Text.TextSize = 15
Text.TextColor3 = Color3.fromRGB(255,220,220)

-- LOGIC
local minimized = false
Min.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    Main.Size = minimized and UDim2.new(0,520,0,40) or UDim2.new(0,520,0,300)
end)

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

print("SLK GAMING HUB | RED TRANSPARENT MENU LOADED")
