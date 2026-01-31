--// SLK HUB        VERSION v1 (Demo)
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
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

--------------------------------------------------
-- TOP BAR
--------------------------------------------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = Color3.fromRGB(235,235,235)
TopBar.BorderSizePixel = 0
TopBar.Active = true
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

local Title2 = Instance.new("TextLabel", TopBar)
Title2.Size = UDim2.new(1, -220, 0.5, 0)
Title2.Position = UDim2.new(0, 16, 0.5, -2)
Title2.BackgroundTransparency = 1
Title2.Text = "By SLK GAMING"
Title2.Font = Enum.Font.Gotham
Title2.TextSize = 12
Title2.TextXAlignment = Enum.TextXAlignment.Left

-- Version (BLUE)
local Version = Instance.new("TextLabel", TopBar)
Version.Size = UDim2.new(0, 120, 0, 24)
Version.Position = UDim2.new(1, -210, 0.5, -12)
Version.BackgroundColor3 = Color3.fromRGB(80,160,255)
Version.TextColor3 = Color3.fromRGB(255,255,255)
Version.Text = "Version v1 (Demo)"
Version.Font = Enum.Font.GothamBold
Version.TextSize = 12
Instance.new("UICorner", Version).CornerRadius = UDim.new(0,10)

-- Minimize
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0, 32, 0, 32)
Min.Position = UDim2.new(1, -74, 0.5, -16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -36, 0.5, -16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(150,60,60)
Close.BackgroundColor3 = Color3.fromRGB(245,245,245)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- CONTENT
--------------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 0, 0, 46)
Content.Size = UDim2.new(1, 0, 1, -46)
Content.BackgroundTransparency = 1

--------------------------------------------------
-- TAB BAR
--------------------------------------------------
local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0, 120, 1, 0)
TabBar.BackgroundTransparency = 1

local View = Instance.new("Frame", Content)
View.Position = UDim2.new(0, 120, 0, 0)
View.Size = UDim2.new(1, -120, 1, 0)
View.BackgroundTransparency = 1

local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1, -20, 1, -20)
Info.Position = UDim2.new(0, 10, 0, 10)
Info.BackgroundTransparency = 1
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.TextWrapped = true
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(90,90,90)

-- INFO CONTENT
local function InfoContent()
	Info.Text = [[
Welcome to SLK HUB 👋

Status:
• Script Status: Working ✅
• Version: Demo / Alpha
• Last Update: 2026

YouTube:
SLK GAMING 📺

Thank you for using this script ❤️
]]
end
InfoContent()

--------------------------------------------------
-- TABS (ĐÃ THÊM TAB 5 + TAB 6)
--------------------------------------------------
local Tabs = {
	"✅ INFO",
	"Tab 2",
	"Tab 3",
	"Tab 4",
	"Tab 5",
	"Tab 6"
}

for i,name in ipairs(Tabs) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1, -10, 0, 40)
	Tab.Position = UDim2.new(0, 5, 0, (i-1)*45 + 10)
	Tab.Text = name
	Tab.Font = Enum.Font.GothamBold
	Tab.TextSize = 14
	Tab.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		if name == "✅ INFO" then
			InfoContent()
		else
			Info.Text = name .. " is under development 🚧"
		end
	end)
end

--------------------------------------------------
-- DRAG (PC + MOBILE)
--------------------------------------------------
local dragging, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
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

UIS.InputEnded:Connect(function()
	dragging = false
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
-- CLOSE
--------------------------------------------------
Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
