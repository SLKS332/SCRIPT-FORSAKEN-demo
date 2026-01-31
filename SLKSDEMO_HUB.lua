-- SLK GAMING HUB - MENU KHUNG ONLY (v1)

-- XÓA GUI CŨ NẾU CÓ
pcall(function()
    game.CoreGui:FindFirstChild("SLK_GAMING_GUI"):Destroy()
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_GAMING_GUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0, 520, 0, 300)
main.Position = UDim2.new(0.5, -260, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
main.BackgroundTransparency = 0.35
main.BorderSizePixel = 0

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Top bar
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 40)
top.BackgroundColor3 = Color3.fromRGB(140, 0, 0)
top.BackgroundTransparency = 0.2
top.BorderSizePixel = 0

local topCorner = Instance.new("UICorner", top)
topCorner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, -120, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "SLK GAMING HUB"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1
title.TextXAlignment = Left

-- Version badge
local version = Instance.new("TextLabel", top)
version.Size = UDim2.new(0, 90, 0, 26)
version.Position = UDim2.new(1, -210, 0.5, -13)
version.Text = "Version v1"
version.Font = Enum.Font.GothamBold
version.TextSize = 14
version.TextColor3 = Color3.fromRGB(255,255,255)
version.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
version.BorderSizePixel = 0

local vCorner = Instance.new("UICorner", version)
vCorner.CornerRadius = UDim.new(0, 8)

-- Minimize button
local min = Instance.new("TextButton", top)
min.Size = UDim2.new(0, 32, 0, 26)
min.Position = UDim2.new(1, -75, 0.5, -13)
min.Text = "-"
min.Font = Enum.Font.GothamBold
min.TextSize = 20
min.TextColor3 = Color3.fromRGB(255,255,255)
min.BackgroundColor3 = Color3.fromRGB(90,90,90)
min.BorderSizePixel = 0

local minCorner = Instance.new("UICorner", min)
minCorner.CornerRadius = UDim.new(0, 6)

-- Close button
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0, 32, 0, 26)
close.Position = UDim2.new(1, -38, 0.5, -13)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255,255,255)
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0, 6)

-- BODY (trống)
local body = Instance.new("Frame", main)
body.Position = UDim2.new(0, 0, 0, 40)
body.Size = UDim2.new(1, 0, 1, -40)
body.BackgroundTransparency = 1

-- CHỨC NĂNG NÚT
local minimized = false

min.MouseButton1Click:Connect(function()
    minimized = not minimized
    body.Visible = not minimized
    main.Size = minimized and UDim2.new(0, 520, 0, 40) or UDim2.new(0, 520, 0, 300)
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
