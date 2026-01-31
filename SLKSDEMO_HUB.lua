--// SLK HUB        VERSION v1
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- chống load lại
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game.CoreGui

--------------------------------------------------
-- MAIN
--------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5, -260, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true
Main.ZIndex = 1
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

--------------------------------------------------
-- TOP BAR
--------------------------------------------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = Color3.fromRGB(235,235,235)
TopBar.BorderSizePixel = 0
TopBar.Active = true
TopBar.ZIndex = 2
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

-- Title
local Title1 = Instance.new("TextLabel", TopBar)
Title1.Size = UDim2.new(1, -220, 0.5, 0)
Title1.Position = UDim2.new(0, 16, 0, 2)
Title1.BackgroundTransparency = 1
Title1.Text = "SLK HUB"
Title1.Font = Enum.Font.GothamBold
Title1.TextSize = 15
Title1.TextXAlignment = Enum.TextXAlignment.Left
Title1.ZIndex = 3

local Title2 = Instance.new("TextLabel", TopBar)
Title2.Size = UDim2.new(1, -220, 0.5, 0)
Title2.Position = UDim2.new(0, 16, 0.5, -2)
Title2.BackgroundTransparency = 1
Title2.Text = "By SLK GAMING"
Title2.Font = Enum.Font.Gotham
Title2.TextSize = 12
Title2.TextXAlignment = Enum.TextXAlignment.Left
Title2.ZIndex = 3

-- Version
local Version = Instance.new("TextLabel", TopBar)
Version.Size = UDim2.new(0, 90, 0, 22)
Version.Position = UDim2.new(1, -180, 0.5, -11)
Version.BackgroundColor3 = Color3.fromRGB(230,230,230)
Version.BackgroundTransparency = 0.25
Version.Text = "Version v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Version.ZIndex = 3
Instance.new("UICorner", Version).CornerRadius = UDim.new(0,8)

-- Minimize
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0, 32, 0, 32)
Min.Position = UDim2.new(1, -74, 0.5, -16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Min.ZIndex = 3
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -36, 0.5, -16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(120,40,40)
Close.BackgroundColor3 = Color3.fromRGB(245,245,245)
Close.ZIndex = 3
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- CONTENT
--------------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 0, 0, 46)
Content.Size = UDim2.new(1, 0, 1, -46)
Content.BackgroundTransparency = 1
Content.ZIndex = 1

--------------------------------------------------
-- TAB
--------------------------------------------------
local TabNames = {"Tab 1","Tab 2","Tab 3","Tab 4"}

local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0, 120, 1, 0)
TabBar.BackgroundTransparency = 1

local View = Instance.new("Frame", Content)
View.Position = UDim2.new(0, 120, 0, 0)
View.Size = UDim2.new(1, -120, 1, 0)
View.BackgroundTransparency = 1

local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1, 0, 1, 0)
Info.BackgroundTransparency = 1
Info.Text = "This tab is under development"
Info.Font = Enum.Font.GothamBold
Info.TextSize = 18
Info.TextColor3 = Color3.fromRGB(120,120,120)

for i,name in ipairs(TabNames) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1, -10, 0, 40)
	Tab.Position = UDim2.new(0, 5, 0, (i-1)*45 + 10)
	Tab.Text = name
	Tab.Font = Enum.Font.Gotham
	Tab.TextSize = 14
	Tab.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Text = name.." is under development"
	end)
end

--------------------------------------------------
-- CONFIRM CLOSE (FIX ZINDEX)
--------------------------------------------------
local Confirm = Instance.new("Frame", gui)
Confirm.Size = UDim2.new(0, 300, 0, 140)
Confirm.Position = UDim2.new(0.5, -150, 0.5, -70)
Confirm.BackgroundColor3 = Color3.fromRGB(245,245,245)
Confirm.Visible = false
Confirm.ZIndex = 20
Instance.new("UICorner", Confirm).CornerRadius = UDim.new(0,14)

local Msg = Instance.new("TextLabel", Confirm)
Msg.Size = UDim2.new(1, -20, 0, 50)
Msg.Position = UDim2.new(0, 10, 0, 10)
Msg.BackgroundTransparency = 1
Msg.Text = "Do you want to close this script?"
Msg.Font = Enum.Font.Gotham
Msg.TextSize = 14
Msg.TextColor3 = Color3.fromRGB(40,40,40)
Msg.ZIndex = 21

local Yes = Instance.new("TextButton", Confirm)
Yes.Size = UDim2.new(0, 100, 0, 32)
Yes.Position = UDim2.new(0.5, -110, 1, -50)
Yes.Text = "YES"
Yes.Font = Enum.Font.GothamBold
Yes.TextColor3 = Color3.fromRGB(255,255,255)
Yes.BackgroundColor3 = Color3.fromRGB(220,80,80)
Yes.ZIndex = 21
Instance.new("UICorner", Yes).CornerRadius = UDim.new(0,8)

local No = Instance.new("TextButton", Confirm)
No.Size = UDim2.new(0, 100, 0, 32)
No.Position = UDim2.new(0.5, 10, 1, -50)
No.Text = "NO"
No.Font = Enum.Font.GothamBold
No.TextColor3 = Color3.fromRGB(40,40,40)
No.BackgroundColor3 = Color3.fromRGB(200,200,200)
No.ZIndex = 21
Instance.new("UICorner", No).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- DRAG (PC + MOBILE – CHUẨN)
--------------------------------------------------
local dragging, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
	if Confirm.Visible then return end
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
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

--------------------------------------------------
-- CLOSE EVENTS
--------------------------------------------------
Close.MouseButton1Click:Connect(function()
	Confirm.Visible = true
end)

Yes.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

No.MouseButton1Click:Connect(function()
	Confirm.Visible = false
end)
