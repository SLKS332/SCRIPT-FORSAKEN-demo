--// SLK HUB LOADING + MENU (FULL FIXED STABLE)
--// FIX: exec, drag mobile, minimize, close confirm, player teleport speed
--// DO NOT CUT / DO NOT RENAME CORE

------------------------------------------------
-- SERVICES
------------------------------------------------
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

------------------------------------------------
-- LOADING GUI
------------------------------------------------
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "SLK_LOADING"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = player.PlayerGui

local lFrame = Instance.new("Frame", loadingGui)
lFrame.Size = UDim2.fromScale(0.6,0.6)
lFrame.Position = UDim2.fromScale(0.2,0.2)
lFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
lFrame.BorderSizePixel = 2
lFrame.BorderColor3 = Color3.fromRGB(0,170,255)

local lTitle = Instance.new("TextLabel", lFrame)
lTitle.Size = UDim2.fromScale(1,0.2)
lTitle.Position = UDim2.fromScale(0,0.3)
lTitle.Text = "SLK HUB"
lTitle.Font = Enum.Font.GothamBold
lTitle.TextScaled = true
lTitle.TextColor3 = Color3.fromRGB(255,255,255)
lTitle.BackgroundTransparency = 1

local lPercent = Instance.new("TextLabel", lFrame)
lPercent.Size = UDim2.fromScale(1,0.1)
lPercent.Position = UDim2.fromScale(0,0.55)
lPercent.Text = "0%"
lPercent.Font = Enum.Font.Code
lPercent.TextScaled = true
lPercent.TextColor3 = Color3.fromRGB(0,170,255)
lPercent.BackgroundTransparency = 1

for i = 1,100 do
	lPercent.Text = i.."%"
	task.wait(0.04)
end

TweenService:Create(lFrame,TweenInfo.new(0.8),{
	Size = UDim2.fromScale(0.3,0.3),
	Position = UDim2.fromScale(0.35,0.35),
	BackgroundTransparency = 1
}):Play()

task.wait(0.9)
loadingGui:Destroy()

------------------------------------------------
-- MAIN GUI
------------------------------------------------
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "SLK_HUB_MENU"
mainGui.ResetOnSpawn = false
mainGui.Parent = player.PlayerGui

local main = Instance.new("Frame", mainGui)
main.Size = UDim2.fromScale(0.6,0.55)
main.Position = UDim2.fromScale(0.2,0.22)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0.35
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

------------------------------------------------
-- TOP BAR
------------------------------------------------
local top = Instance.new("Frame", main)
top.Size = UDim2.fromScale(1,0.16)
top.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.fromScale(0.4,1)
title.Position = UDim2.fromScale(0.03,0)
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

local min = Instance.new("TextButton", top)
min.Size = UDim2.fromScale(0.06,0.6)
min.Position = UDim2.fromScale(0.86,0.2)
min.Text = "-"
min.Font = Enum.Font.GothamBold
min.TextScaled = true
min.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", min)

local close = Instance.new("TextButton", top)
close.Size = UDim2.fromScale(0.06,0.6)
close.Position = UDim2.fromScale(0.93,0.2)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(180,50,50)
Instance.new("UICorner", close)

------------------------------------------------
-- DRAG (PC + MOBILE FIX)
------------------------------------------------
local dragging = false
local dragStart, startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and
	(input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
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

------------------------------------------------
-- CONTENT + TABS
------------------------------------------------
local tabList = Instance.new("Frame", main)
tabList.Position = UDim2.fromScale(0.02,0.26)
tabList.Size = UDim2.fromScale(0.25,0.7)
tabList.BackgroundTransparency = 1
Instance.new("UIListLayout", tabList).Padding = UDim.new(0,8)

local content = Instance.new("Frame", main)
content.Position = UDim2.fromScale(0.29,0.26)
content.Size = UDim2.fromScale(0.69,0.7)
content.BackgroundTransparency = 1

local tabs = {}

local function showTab(name)
	for _,v in pairs(tabs) do v.Visible = false end
	tabs[name].Visible = true
end

------------------------------------------------
-- INFO TAB
------------------------------------------------
local infoBtn = Instance.new("TextButton", tabList)
infoBtn.Size = UDim2.fromScale(1,0.12)
infoBtn.Text = "ℹ INFORMATION"
infoBtn.Font = Enum.Font.GothamBold
infoBtn.TextScaled = true
infoBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", infoBtn)

local info = Instance.new("TextLabel", content)
info.Size = UDim2.fromScale(1,1)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.TextYAlignment = Top
info.TextScaled = false
info.TextSize = 20
info.TextColor3 = Color3.fromRGB(0,170,255)
info.Text = "SLK HUB\n\n• Stable\n• Fixed\n• Player Teleport Speed Ready"
tabs["info"] = info

------------------------------------------------
-- PLAYER TAB + TELEPORT SPEED
------------------------------------------------
local playerBtn = Instance.new("TextButton", tabList)
playerBtn.Size = UDim2.fromScale(1,0.12)
playerBtn.Text = "👤 PLAYER"
playerBtn.Font = Enum.Font.GothamBold
playerBtn.TextScaled = true
playerBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", playerBtn)

local playerTab = Instance.new("Frame", content)
playerTab.Size = UDim2.fromScale(1,1)
playerTab.BackgroundTransparency = 1
playerTab.Visible = false
tabs["player"] = playerTab

local tpEnabled = false
local tpSpeed = 5

local tpBtn = Instance.new("TextButton", playerTab)
tpBtn.Size = UDim2.fromScale(0.6,0.1)
tpBtn.Position = UDim2.fromScale(0.05,0.1)
tpBtn.Text = "⚡ Teleport Speed : OFF"
tpBtn.Font = Enum.Font.GothamBold
tpBtn.TextSize = 18
tpBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
tpBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", tpBtn)

tpBtn.MouseButton1Click:Connect(function()
	tpEnabled = not tpEnabled
	if tpEnabled then
		tpBtn.Text = "⚡ Teleport Speed : ON"
		tpBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
	else
		tpBtn.Text = "⚡ Teleport Speed : OFF"
		tpBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
	end
end)

RunService.RenderStepped:Connect(function()
	if not tpEnabled then return end
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if hum and root and hum.MoveDirection.Magnitude > 0 then
		root.CFrame += hum.MoveDirection * (tpSpeed/15)
	end
end)

------------------------------------------------
-- TAB EVENTS
------------------------------------------------
infoBtn.MouseButton1Click:Connect(function() showTab("info") end)
playerBtn.MouseButton1Click:Connect(function() showTab("player") end)
showTab("info")

------------------------------------------------
-- MINIMIZE
------------------------------------------------
local mini = Instance.new("TextButton", mainGui)
mini.Size = UDim2.fromScale(0.18,0.06)
mini.Position = UDim2.fromScale(0.41,0.02)
mini.Text = "SLK HUB"
mini.Visible = false
mini.BackgroundColor3 = Color3.fromRGB(0,0,0)
mini.BackgroundTransparency = 0.3
Instance.new("UICorner", mini)

min.MouseButton1Click:Connect(function()
	main.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	main.Visible = true
	mini.Visible = false
end)

------------------------------------------------
-- CLOSE CONFIRM + COUNTDOWN
------------------------------------------------
close.MouseButton1Click:Connect(function()
	local ask = Instance.new("Frame", mainGui)
	ask.Size = UDim2.fromScale(0.4,0.25)
	ask.Position = UDim2.fromScale(0.3,0.38)
	ask.BackgroundColor3 = Color3.fromRGB(0,0,0)
	ask.BackgroundTransparency = 0.2
	Instance.new("UICorner", ask)

	local txt = Instance.new("TextLabel", ask)
	txt.Size = UDim2.fromScale(1,0.6)
	txt.BackgroundTransparency = 1
	txt.TextScaled = true
	txt.TextColor3 = Color3.new(1,1,1)

	for i = 5,0,-1 do
		txt.Text = "Closing in "..i.."s"
		task.wait(1)
	end
	mainGui:Destroy()
end)
