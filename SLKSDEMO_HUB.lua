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

-- fix bo góc dưới topbar
local fix = Instance.new("Frame")
fix.Parent = TopBar
fix.Size = UDim2.new(1,0,0.5,0)
fix.Position = UDim2.new(0,0,0.5,0)
fix.BackgroundColor3 = TopBar.BackgroundColor3
fix.BorderSizePixel = 0

-- Title line 1
local Title1 = Instance.new("TextLabel")
Title1.Parent = TopBar
Title1.Size = UDim2.new(1, -160, 0.5, 0)
Title1.Position = UDim2.new(0, 16, 0, 2)
Title1.BackgroundTransparency = 1
Title1.Text = "SLK HUB        VERSION v1"
Title1.Font = Enum.Font.GothamBold
Title1.TextSize = 15
Title1.TextColor3 = Color3.fromRGB(35,35,35)
Title1.TextXAlignment = Enum.TextXAlignment.Left

-- Title line 2
local Title2 = Instance.new("TextLabel")
Title2.Parent = TopBar
Title2.Size = UDim2.new(1, -160, 0.5, 0)
Title2.Position = UDim2.new(0, 16, 0.5, -2)
Title2.BackgroundTransparency = 1
Title2.Text = "By SLK GAMING"
Title2.Font = Enum.Font.Gotham
Title2.TextSize = 12
Title2.TextColor3 = Color3.fromRGB(80,80,80)
Title2.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize button
local Min = Instance.new("TextButton")
Min.Parent = TopBar
Min.Size = UDim2.new(0, 32, 0, 32)
Min.Position = UDim2.new(1, -74, 0.5, -16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.TextColor3 = Color3.fromRGB(40,40,40)
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Min.BorderSizePixel = 0
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close button
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

-- Content (trống)
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0, 0, 0, 46)
Content.Size = UDim2.new(1, 0, 1, -46)
Content.BackgroundTransparency = 1

-- Drag system (FIX CHUẨN)
local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
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
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- Minimize logic
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46)
		or UDim2.new(0,520,0,320)
end)

-- Close
Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
