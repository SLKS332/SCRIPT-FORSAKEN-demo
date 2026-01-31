--========================================
-- SLK GAMING HUB | MENU ONLY
-- By SLK GAMING
-- Version v1
--========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if getgenv().SLK_MENU then return end
getgenv().SLK_MENU = true

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player.PlayerGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 600, 0, 360)
Main.Position = UDim2.new(0.5, -300, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, -120, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "SLK GAMING HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- By
local By = Instance.new("TextLabel", Main)
By.Size = UDim2.new(0, 200, 0, 20)
By.Position = UDim2.new(0, 12, 0, 42)
By.BackgroundTransparency = 1
By.Text = "By SLK GAMING"
By.Font = Enum.Font.Gotham
By.TextSize = 12
By.TextXAlignment = Left
By.TextColor3 = Color3.fromRGB(180,180,180)

-- Version
local Version = Instance.new("TextLabel", Main)
Version.Size = UDim2.new(0, 110, 0, 26)
Version.Position = UDim2.new(1, -240, 0, 10)
Version.BackgroundColor3 = Color3.fromRGB(60, 200, 120)
Version.Text = "Version v1"
Version.Font = Enum.Font.GothamBold
Version.TextSize = 14
Version.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Version).CornerRadius = UDim.new(1,0)

-- Close button (X)
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -40, 0, 8)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.TextColor3 = Color3.new(1,1,1)
Close.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- Minimize button (-)
local Min = Instance.new("TextButton", Main)
Min.Size = UDim2.new(0, 30, 0, 30)
Min.Position = UDim2.new(1, -80, 0, 8)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 22
Min.TextColor3 = Color3.new(1,1,1)
Min.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

-- Sidebar
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 170, 1, -70)
Sidebar.Position = UDim2.new(0, 10, 0, 65)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,10)

local function FakeButton(text, y)
	local b = Instance.new("TextLabel", Sidebar)
	b.Size = UDim2.new(1, -20, 0, 36)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(35,35,35)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
end

FakeButton("Emotes", 10)
FakeButton("Other", 55)
FakeButton("Autofarm", 100)
FakeButton("Feedback", 145)
FakeButton("Hub Status", 190)
FakeButton("Another Script", 235)

-- Content
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -200, 1, -70)
Content.Position = UDim2.new(0, 190, 0, 65)
Content.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0,10)

local Text = Instance.new("TextLabel", Content)
Text.Size = UDim2.new(1,0,1,0)
Text.BackgroundTransparency = 1
Text.Text = "MENU ONLY\n(No functions yet)"
Text.Font = Enum.Font.GothamBold
Text.TextSize = 18
Text.TextColor3 = Color3.fromRGB(150,150,150)

-- Logic
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Sidebar.Visible = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0, 600, 0, 60) or UDim2.new(0, 600, 0, 360)
end)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	getgenv().SLK_MENU = false
end)
