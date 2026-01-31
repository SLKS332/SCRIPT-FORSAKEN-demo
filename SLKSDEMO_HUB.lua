--// SLK HUB        VERSION v1
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- Anti duplicate
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
Main.BackgroundTransparency = 0.18
Main.BorderSizePixel = 0
Main.Active = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = Color3.fromRGB(245,245,245)
TopBar.BackgroundTransparency = 0.1
TopBar.BorderSizePixel = 0
TopBar.Active = true

Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,16)

-- Fix bo góc dưới TopBar
local Fix = Instance.new("Frame")
Fix.Parent = TopBar
Fix.Size = UDim2.new(1,0,0.5,0)
Fix.Position = UDim2.new(0,0,0.5,0)
Fix.BackgroundColor3 = TopBar.BackgroundColor3
Fix.BackgroundTransparency = TopBar.BackgroundTransparency
Fix.BorderSizePixel = 0

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Position = UDim2.new(0,16,0,6)
Title.Size = UDim2.new(1,-200,0,18)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextColor3 = Color3.fromRGB(35,35,35)
Title.TextXAlignment = Left

-- By text
local By = Instance.new("TextLabel")
By.Parent = TopBar
By.Position = UDim2.new(0,16,0,24)
By.Size = UDim2.new(1,-200,0,16)
By.BackgroundTransparency = 1
By.Text = "By SLK GAMING"
By.Font = Enum.Font.Gotham
By.TextSize = 12
By.TextColor3 = Color3.fromRGB(90,90,90)
By.TextXAlignment = Left

-- Version label (đÃ FIX)
local Version = Instance.new("TextLabel")
Version.Parent = TopBar
Version.Position = UDim2.new(1,-170,0.5,-12)
Version.Size = UDim2.new(0,90,0,24)
Version.BackgroundColor3 = Color3.fromRGB(230,230,230)
Version.BackgroundTransparency = 0.2
Version.Text = "Version v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Version.TextColor3 = Color3.fromRGB(50,50,50)
Version.BorderSizePixel = 0
Instance.new("UICorner", Version).CornerRadius = UDim.new(0,8)

-- Minimize button
local Min = Instance.new("TextButton")
Min.Parent = TopBar
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-70,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.TextColor3 = Color3.fromRGB(40,40,40)
Min.BackgroundColor3 = Color3.fromRGB(240,240,240)
Min.BorderSizePixel = 0
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close button
local Close = Instance.new("TextButton")
Close.Parent = TopBar
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-34,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(140,40,40)
Close.BackgroundColor3 = Color3.fromRGB(240,240,240)
Close.BorderSizePixel = 0
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

-- Content
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,0,0,46)
Content.Size = UDim2.new(1,0,1,-46)
Content.BackgroundTransparency = 1

-- Drag system (chuẩn – không lỗi)
local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
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

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- Minimize (thu nhỏ vẫn kéo được)
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
