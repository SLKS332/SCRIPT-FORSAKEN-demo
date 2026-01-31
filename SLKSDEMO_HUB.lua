--// SLK HUB        VERSION v1
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- chống load lại
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local Main = Instance.new("Frame")
Main.Parent = gui
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5, -260, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = Color3.fromRGB(235,235,235)
TopBar.BackgroundTransparency = 0.05
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local fix = Instance.new("Frame")
fix.Parent = TopBar
fix.Size = UDim2.new(1,0,0.5,0)
fix.Position = UDim2.new(0,0,0.5,0)
fix.BackgroundColor3 = TopBar.BackgroundColor3
fix.BorderSizePixel = 0

-- Title
local Title1 = Instance.new("TextLabel")
Title1.Parent = TopBar
Title1.Size = UDim2.new(1, -220, 0.5, 0)
Title1.Position = UDim2.new(0, 16, 0, 2)
Title1.BackgroundTransparency = 1
Title1.Text = "SLK HUB"
Title1.Font = Enum.Font.GothamBold
Title1.TextSize = 15
Title1.TextColor3 = Color3.fromRGB(35,35,35)
Title1.TextXAlignment = Enum.TextXAlignment.Left

local Title2 = Instance.new("TextLabel")
Title2.Parent = TopBar
Title2.Size = UDim2.new(1, -220, 0.5, 0)
Title2.Position = UDim2.new(0, 16, 0.5, -2)
Title2.BackgroundTransparency = 1
Title2.Text = "By SLK GAMING"
Title2.Font = Enum.Font.Gotham
Title2.TextSize = 12
Title2.TextColor3 = Color3.fromRGB(80,80,80)
Title2.TextXAlignment = Enum.TextXAlignment.Left

-- Version label
local Version = Instance.new("TextLabel")
Version.Parent = TopBar
Version.Size = UDim2.new(0, 90, 0, 22)
Version.Position = UDim2.new(1, -180, 0.5, -11)
Version.BackgroundColor3 = Color3.fromRGB(230,230,230)
Version.BackgroundTransparency = 0.25
Version.BorderSizePixel = 0
Version.Text = "Version v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Version.TextColor3 = Color3.fromRGB(50,50,50)
Instance.new("UICorner", Version).CornerRadius = UDim.new(0,8)

-- Minimize
local Min = Instance.new("TextButton")
Min.Parent = TopBar
Min.Size = UDim2.new(0, 32, 0, 32)
Min.Position = UDim2.new(1, -74, 0.5, -16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Min.BorderSizePixel = 0
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton")
Close.Parent = TopBar
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -36, 0.5, -16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(120,40,40)
Close.BackgroundColor3 = Color3.fromRGB(245,245,245)
Close.BorderSizePixel = 0
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

-- Content
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0, 0, 0, 46)
Content.Size = UDim2.new(1, 0, 1, -46)
Content.BackgroundTransparency = 1

-- Drag
local dragging, dragStart, startPos = false

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Minimize logic
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

----------------------------------------------------------------
-- CONFIRM CLOSE POPUP
----------------------------------------------------------------
local Confirm = Instance.new("Frame")
Confirm.Parent = gui
Confirm.Size = UDim2.new(0, 300, 0, 140)
Confirm.Position = UDim2.new(0.5, -150, 0.5, -70)
Confirm.BackgroundColor3 = Color3.fromRGB(245,245,245)
Confirm.Visible = false
Confirm.BorderSizePixel = 0
Instance.new("UICorner", Confirm).CornerRadius = UDim.new(0,14)

local Msg = Instance.new("TextLabel")
Msg.Parent = Confirm
Msg.Size = UDim2.new(1, -20, 0, 50)
Msg.Position = UDim2.new(0, 10, 0, 10)
Msg.BackgroundTransparency = 1
Msg.Text = "Do you want to close this script?"
Msg.Font = Enum.Font.Gotham
Msg.TextSize = 14
Msg.TextColor3 = Color3.fromRGB(40,40,40)
Msg.TextWrapped = true

local Yes = Instance.new("TextButton")
Yes.Parent = Confirm
Yes.Size = UDim2.new(0, 100, 0, 32)
Yes.Position = UDim2.new(0.5, -110, 1, -50)
Yes.Text = "YES"
Yes.Font = Enum.Font.GothamBold
Yes.TextSize = 14
Yes.BackgroundColor3 = Color3.fromRGB(220,80,80)
Yes.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", Yes).CornerRadius = UDim.new(0,8)

local No = Instance.new("TextButton")
No.Parent = Confirm
No.Size = UDim2.new(0, 100, 0, 32)
No.Position = UDim2.new(0.5, 10, 1, -50)
No.Text = "NO"
No.Font = Enum.Font.GothamBold
No.TextSize = 14
No.BackgroundColor3 = Color3.fromRGB(200,200,200)
No.TextColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", No).CornerRadius = UDim.new(0,8)

Close.MouseButton1Click:Connect(function()
	Confirm.Visible = true
end)

Yes.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

No.MouseButton1Click:Connect(function()
	Confirm.Visible = false
end)
