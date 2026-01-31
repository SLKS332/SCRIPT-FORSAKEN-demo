--// SLK HUB        VERSION v1 (DEMO)
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- chống load lại
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

--------------------------------------------------
-- GUI
--------------------------------------------------
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
Main.BackgroundTransparency = 0.1
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

local Version = Instance.new("TextLabel", TopBar)
Version.Size = UDim2.new(0, 90, 0, 22)
Version.Position = UDim2.new(1, -180, 0.5, -11)
Version.BackgroundColor3 = Color3.fromRGB(220,220,220)
Version.BackgroundTransparency = 0.3
Version.Text = "DEMO v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Instance.new("UICorner", Version).CornerRadius = UDim.new(0,8)

local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0, 32, 0, 32)
Min.Position = UDim2.new(1, -74, 0.5, -16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -36, 0.5, -16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(120,40,40)
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
-- TAB SYSTEM
--------------------------------------------------
local Tabs = {
	{Title = "INFO", Icon = "ℹ️"},
	{Title = "TAB 2", Icon = "⚙️"},
	{Title = "TAB 3", Icon = "🧪"},
	{Title = "TAB 4", Icon = "🔒"},
}

local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0, 130, 1, 0)
TabBar.BackgroundTransparency = 1

local View = Instance.new("Frame", Content)
View.Position = UDim2.new(0, 130, 0, 0)
View.Size = UDim2.new(1, -130, 1, 0)
View.BackgroundTransparency = 1

--------------------------------------------------
-- INFO CONTENT
--------------------------------------------------
local InfoText = Instance.new("TextLabel", View)
InfoText.Size = UDim2.new(1, -20, 1, -20)
InfoText.Position = UDim2.new(0, 10, 0, 10)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 14
InfoText.TextColor3 = Color3.fromRGB(60,60,60)

local function showInfo()
	InfoText.Text =
[[👋 Welcome to SLK HUB!

📌 Script Status:
• Version: DEMO v1
• State: Alpha / Demo
• Update: Manual

📺 YouTube:
SLK GAMING

⚠️ Note:
This hub is still under development.
More features will be added soon.

❤️ Thank you for using my script!
]]
end

showInfo()

--------------------------------------------------
-- CREATE TABS
--------------------------------------------------
for i,tab in ipairs(Tabs) do
	local Btn = Instance.new("TextButton", TabBar)
	Btn.Size = UDim2.new(1, -10, 0, 42)
	Btn.Position = UDim2.new(0, 5, 0, (i-1)*48 + 10)
	Btn.Text = tab.Icon.."  "..tab.Title
	Btn.Font = Enum.Font.Gotham
	Btn.TextSize = 14
	Btn.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)

	Btn.MouseButton1Click:Connect(function()
		if tab.Title == "INFO" then
			showInfo()
		else
			InfoText.Text = tab.Title.." is under development 🚧"
		end
	end)
end

--------------------------------------------------
-- DRAG
--------------------------------------------------
local dragging, dragStart, startPos

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
-- CLOSE
--------------------------------------------------
Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
