--// ============================================================
--// SLK HUB | White Version v1.3.1
--// Forsaken | ESP Player + ESP Generator + Player Speed
--// By SLK GAMING
--// ============================================================

---------------------------------------------------------------
-- SERVICES
---------------------------------------------------------------
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

---------------------------------------------------------------
-- ANTI DUPLICATE GUI
---------------------------------------------------------------
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

---------------------------------------------------------------
-- SCREEN GUI
---------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SLK_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

---------------------------------------------------------------
-- MAIN FRAME
---------------------------------------------------------------
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,18)
MainCorner.Parent = Main

---------------------------------------------------------------
-- TOP BAR
---------------------------------------------------------------
local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.45
TopBar.BorderSizePixel = 0
TopBar.Active = true

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0,18)
TopCorner.Parent = TopBar

---------------------------------------------------------------
-- TITLE
---------------------------------------------------------------
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(1,-140,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White Version v1.3.1"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(60,60,60)

---------------------------------------------------------------
-- BY SLK GAMING
---------------------------------------------------------------
local By = Instance.new("TextLabel")
By.Parent = TopBar
By.Size = UDim2.new(1,-140,1,0)
By.Position = UDim2.new(0,16,0,20)
By.BackgroundTransparency = 1
By.Text = "By SLK GAMING"
By.Font = Enum.Font.Gotham
By.TextSize = 11
By.TextXAlignment = Enum.TextXAlignment.Left
By.TextColor3 = Color3.fromRGB(120,120,120)

---------------------------------------------------------------
-- MINIMIZE BUTTON
---------------------------------------------------------------
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.Size = UDim2.new(0,32,0,32)
MinBtn.Position = UDim2.new(1,-74,0.5,-16)
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 18
MinBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
MinBtn.TextColor3 = Color3.fromRGB(60,60,60)

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0,8)
MinCorner.Parent = MinBtn

---------------------------------------------------------------
-- CLOSE BUTTON
---------------------------------------------------------------
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Size = UDim2.new(0,32,0,32)
CloseBtn.Position = UDim2.new(1,-36,0.5,-16)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
CloseBtn.TextColor3 = Color3.fromRGB(180,60,60)

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,8)
CloseCorner.Parent = CloseBtn

---------------------------------------------------------------
-- CONTENT
---------------------------------------------------------------
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,0,0,46)
Content.Size = UDim2.new(1,0,1,-46)
Content.BackgroundTransparency = 1

---------------------------------------------------------------
-- TAB BAR
---------------------------------------------------------------
local TabBar = Instance.new("Frame")
TabBar.Parent = Content
TabBar.Size = UDim2.new(0,120,1,0)
TabBar.BackgroundTransparency = 1

---------------------------------------------------------------
-- VIEW
---------------------------------------------------------------
local View = Instance.new("Frame")
View.Parent = Content
View.Position = UDim2.new(0,120,0,0)
View.Size = UDim2.new(1,-120,1,0)
View.BackgroundTransparency = 1

---------------------------------------------------------------
-- INFO TAB
---------------------------------------------------------------
local Info = Instance.new("TextLabel")
Info.Parent = View
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(70,70,70)

Info.Text = [[
WELCOME TO SLK HUB 🤍

Status: Working ✅
Version: v1.3.1

✔ Fixed Tabs
✔ Fixed Drag
✔ Fixed Close Confirm
✔ ESP Player / Generator OK
✔ Player Speed OK

Thank you for using SLK HUB
]]

---------------------------------------------------------------
-- INVISIBLE TAB
---------------------------------------------------------------
local InvisFrame = Instance.new("Frame")
InvisFrame.Parent = View
InvisFrame.Size = UDim2.new(1,0,1,0)
InvisFrame.BackgroundTransparency = 1
InvisFrame.Visible = false

local InvisText = Instance.new("TextLabel")
InvisText.Parent = InvisFrame
InvisText.Size = UDim2.new(1,-40,0,80)
InvisText.Position = UDim2.new(0,20,0,20)
InvisText.BackgroundTransparency = 1
InvisText.TextWrapped = true
InvisText.TextYAlignment = Enum.TextYAlignment.Top
InvisText.Font = Enum.Font.Gotham
InvisText.TextSize = 13
InvisText.TextColor3 = Color3.fromRGB(80,80,80)
InvisText.Text =
"🇻🇳 Hub chỉ demo nên chưa có nhiều chức năng\n"..
"🇺🇸 This hub is a demo, more features coming soon"

---------------------------------------------------------------
-- PLAYER TAB (SPEED)
---------------------------------------------------------------
local PlayerFrame = Instance.new("Frame")
PlayerFrame.Parent = View
PlayerFrame.Size = UDim2.new(1,0,1,0)
PlayerFrame.BackgroundTransparency = 1
PlayerFrame.Visible = false

local SpeedOn = false
local SpeedValue = 16

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Parent = PlayerFrame
SpeedBtn.Size = UDim2.new(0,240,0,38)
SpeedBtn.Position = UDim2.new(0,20,0,30)
SpeedBtn.Text = "SPEED : OFF"
SpeedBtn.Font = Enum.Font.GothamBold
SpeedBtn.TextSize = 14
SpeedBtn.TextColor3 = Color3.new(1,1,1)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0,10)
SpeedCorner.Parent = SpeedBtn

---------------------------------------------------------------
-- SPEED SLIDER
---------------------------------------------------------------
local Bar = Instance.new("Frame")
Bar.Parent = PlayerFrame
Bar.Size = UDim2.new(0,240,0,8)
Bar.Position = UDim2.new(0,20,0,85)
Bar.BackgroundColor3 = Color3.fromRGB(200,200,200)

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1,0)
BarCorner.Parent = Bar

local Fill = Instance.new("Frame")
Fill.Parent = Bar
Fill.Size = UDim2.new(0,0,1,0)
Fill.BackgroundColor3 = Color3.fromRGB(80,180,255)

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1,0)
FillCorner.Parent = Fill

local SpeedText = Instance.new("TextLabel")
SpeedText.Parent = PlayerFrame
SpeedText.Position = UDim2.new(0,20,0,100)
SpeedText.Size = UDim2.new(0,240,0,20)
SpeedText.BackgroundTransparency = 1
SpeedText.Font = Enum.Font.Gotham
SpeedText.TextSize = 13
SpeedText.TextColor3 = Color3.fromRGB(70,70,70)
SpeedText.Text = "Speed: 16"

SpeedBtn.MouseButton1Click:Connect(function()
	SpeedOn = not SpeedOn
	if SpeedOn then
		SpeedBtn.Text = "SPEED : ON"
		SpeedBtn.BackgroundColor3 = Color3.fromRGB(80,180,255)
	else
		SpeedBtn.Text = "SPEED : OFF"
		SpeedBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end
end)

---------------------------------------------------------------
-- SLIDER LOGIC
---------------------------------------------------------------
local dragging = false

Bar.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1
	or i.UserInputType == Enum.UserInputType.Touch then
		dragging = true
	end
end)

UserInputService.InputEnded:Connect(function()
	dragging = false
end)

UserInputService.InputChanged:Connect(function(i)
	if dragging then
		local x = math.clamp((i.Position.X - Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)
		Fill.Size = UDim2.new(x,0,1,0)
		SpeedValue = math.floor(x*100)
		SpeedText.Text = "Speed: "..SpeedValue
	end
end)

RunService.RenderStepped:Connect(function()
	if SpeedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
	end
end)

---------------------------------------------------------------
-- TABS
---------------------------------------------------------------
local Tabs = {"INFO","INVISIBLE","👤 PLAYER","TAB 4","TAB 5","TAB 6"}

for i,name in ipairs(Tabs) do
	local btn = Instance.new("TextButton")
	btn.Parent = TabBar
	btn.Size = UDim2.new(1,-10,0,40)
	btn.Position = UDim2.new(0,5,0,(i-1)*45+10)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(235,235,235)
	btn.TextColor3 = Color3.fromRGB(60,60,60)

	Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

	btn.MouseButton1Click:Connect(function()
		Info.Visible = false
		InvisFrame.Visible = false
		PlayerFrame.Visible = false

		if name == "INFO" then
			Info.Visible = true
		elseif name == "INVISIBLE" then
			InvisFrame.Visible = true
		elseif name == "👤 PLAYER" then
			PlayerFrame.Visible = true
		else
			Info.Visible = true
			Info.Text = name.." đang phát triển 🚧"
		end
	end)
end

---------------------------------------------------------------
-- DRAG WINDOW
---------------------------------------------------------------
local draggingWindow = false
local dragStart, startPos

TopBar.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1
	or i.UserInputType == Enum.UserInputType.Touch then
		draggingWindow = true
		dragStart = i.Position
		startPos = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(i)
	if draggingWindow then
		local delta = i.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function()
	draggingWindow = false
end)

---------------------------------------------------------------
-- MINIMIZE
---------------------------------------------------------------
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

---------------------------------------------------------------
-- CLOSE CONFIRM
---------------------------------------------------------------
CloseBtn.MouseButton1Click:Connect(function()
	local cf = Instance.new("Frame",ScreenGui)
	cf.Size = UDim2.new(0,260,0,130)
	cf.Position = UDim2.new(0.5,-130,0.5,-65)
	cf.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner",cf).CornerRadius = UDim.new(0,12)

	local t = Instance.new("TextLabel",cf)
	t.Size = UDim2.new(1,-20,0,50)
	t.Position = UDim2.new(0,10,0,10)
	t.BackgroundTransparency = 1
	t.Text = "Bạn có muốn đóng SLK HUB không?"
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14
	t.TextWrapped = true

	local y = Instance.new("TextButton",cf)
	y.Size = UDim2.new(0.4,0,0,32)
	y.Position = UDim2.new(0.05,0,1,-42)
	y.Text = "Yes"
	y.BackgroundColor3 = Color3.fromRGB(255,120,120)
	y.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner",y)

	local n = Instance.new("TextButton",cf)
	n.Size = UDim2.new(0.4,0,0,32)
	n.Position = UDim2.new(0.55,0,1,-42)
	n.Text = "No"
	n.BackgroundColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner",n)

	y.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
	n.MouseButton1Click:Connect(function() cf:Destroy() end)
end)

--// ================= END SLK HUB v1.3.1 ======================
