-- SLK HUB UI | Version v1
-- By SLK GAMING

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SLK_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5, -260, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

-- Bo góc
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 16)
Corner.Parent = Main

-- Thanh trên
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
TopBar.BackgroundTransparency = 0.05
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent = TopBar

-- Fix góc dưới thanh trên
local Fix = Instance.new("Frame")
Fix.Size = UDim2.new(1, 0, 0, 16)
Fix.Position = UDim2.new(0, 0, 1, -16)
Fix.BackgroundColor3 = TopBar.BackgroundColor3
Fix.BackgroundTransparency = TopBar.BackgroundTransparency
Fix.BorderSizePixel = 0
Fix.Parent = TopBar

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -140, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SLK Hub  |  By SLK GAMING"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(40, 40, 40)
Title.Parent = TopBar

-- Version
local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 90, 0, 24)
Version.Position = UDim2.new(1, -230, 0.5, -12)
Version.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
Version.BackgroundTransparency = 0
Version.Text = "Version v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Version.TextColor3 = Color3.fromRGB(30, 30, 30)
Version.Parent = TopBar

local VCorner = Instance.new("UICorner")
VCorner.CornerRadius = UDim.new(0, 10)
VCorner.Parent = Version

-- Nút thu nhỏ (-)
local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0, 32, 0, 24)
Min.Position = UDim2.new(1, -70, 0.5, -12)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.TextColor3 = Color3.fromRGB(50, 50, 50)
Min.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
Min.Parent = TopBar

local MinC = Instance.new("UICorner")
MinC.CornerRadius = UDim.new(0, 8)
MinC.Parent = Min

-- Nút tắt (X)
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 32, 0, 24)
Close.Position = UDim2.new(1, -35, 0.5, -12)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
Close.Parent = TopBar

local CloseC = Instance.new("UICorner")
CloseC.CornerRadius = UDim.new(0, 8)
CloseC.Parent = Close

-- Chức năng nút
local minimized = false

Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		Main.Size = UDim2.new(0, 520, 0, 40)
	else
		Main.Size = UDim2.new(0, 520, 0, 320)
	end
end)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
