-- SLK HUB Loading Screen
-- Duration: ~6 seconds

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "SLK_Loading"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.6, 0.6)
frame.Position = UDim2.fromScale(0.2, 0.2)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255,0,0)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.15)
title.Position = UDim2.fromScale(0, 0.25)
title.Text = "SLK HUB"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1

local by = Instance.new("TextLabel", frame)
by.Size = UDim2.fromScale(1, 0.07)
by.Position = UDim2.fromScale(0, 0.4)
by.Text = "By SLK Gaming"
by.TextScaled = true
by.Font = Enum.Font.Gotham
by.TextColor3 = Color3.fromRGB(200,200,200)
by.BackgroundTransparency = 1

-- Loading text
local statusText = Instance.new("TextLabel", frame)
statusText.Size = UDim2.fromScale(1, 0.08)
statusText.Position = UDim2.fromScale(0, 0.6)
statusText.Text = "Welcome to script"
statusText.TextScaled = true
statusText.Font = Enum.Font.Code
statusText.TextColor3 = Color3.fromRGB(255,255,255)
statusText.BackgroundTransparency = 1

-- Percent
local percentText = Instance.new("TextLabel", frame)
percentText.Size = UDim2.fromScale(0.2, 0.08)
percentText.Position = UDim2.fromScale(0.75, 0.6)
percentText.Text = "0%"
percentText.TextScaled = true
percentText.Font = Enum.Font.Code
percentText.TextColor3 = Color3.fromRGB(255,255,255)
percentText.BackgroundTransparency = 1

-- Vertical loading bar
local barHolder = Instance.new("Frame", frame)
barHolder.Size = UDim2.fromScale(0.05, 0.5)
barHolder.Position = UDim2.fromScale(0.05, 0.3)
barHolder.BackgroundColor3 = Color3.fromRGB(255,0,0)

local barFill = Instance.new("Frame", barHolder)
barFill.Size = UDim2.fromScale(1, 0)
barFill.Position = UDim2.fromScale(0, 1)
barFill.AnchorPoint = Vector2.new(0,1)
barFill.BackgroundColor3 = Color3.fromRGB(0,170,255)

-- Binary text
local binary = Instance.new("TextLabel", frame)
binary.Size = UDim2.fromScale(1, 0.06)
binary.Position = UDim2.fromScale(0, 0.75)
binary.Text = "1010101010101010101010101"
binary.TextScaled = true
binary.Font = Enum.Font.Code
binary.TextColor3 = Color3.fromRGB(0,170,255)
binary.BackgroundTransparency = 1

-- Binary animation
task.spawn(function()
	while gui.Parent do
		binary.Position = UDim2.fromScale(-0.1, 0.75)
		TweenService:Create(binary, TweenInfo.new(4, Enum.EasingStyle.Linear), {
			Position = UDim2.fromScale(0.1, 0.75)
		}):Play()
		task.wait(4)
	end
end)

-- Loading logic
local messages = {
	"Welcome to script",
	"Script will done",
	"Script will ready",
	"Okay wait a script"
}

local totalTime = 6
for i = 1, 100 do
	barFill.Size = UDim2.fromScale(1, i/100)
	percentText.Text = i .. "%"

	if i == 25 then statusText.Text = messages[2] end
	if i == 50 then statusText.Text = messages[3] end
	if i == 75 then statusText.Text = messages[4] end

	task.wait(totalTime / 100)
end

statusText.Text = "Thanks for use script"

-- Hiệu ứng nhỏ dần + mờ dần
local tweenInfo = TweenInfo.new(
	1.2, -- thời gian (chậm, mượt)
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local fadeGoals = {
	BackgroundTransparency = 1
}

-- Fade toàn bộ UI
for _, v in ipairs(gui:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
	elseif v:IsA("Frame") then
		TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
	end
end

-- Thu nhỏ khung
TweenService:Create(frame, tweenInfo, {
	Size = UDim2.fromScale(0.4, 0.4),
	Position = UDim2.fromScale(0.3, 0.3)
}):Play()

task.wait(1.3)
gui:Destroy()
-- SLK HUB - FULL EMPTY MENU (MINIMIZE + CONFIRM CLOSE)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.75, 0.55)
main.Position = UDim2.fromScale(0.125, 0.22)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0.8 -- mờ ban đầu
main.BorderSizePixel = 0
main.Active = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255,80,80)
stroke.Thickness = 2

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.fromScale(1,0.12)
header.BackgroundTransparency = 1

local title = Instance.new("TextLabel", header)
title.Size = UDim2.fromScale(0.4,1)
title.Position = UDim2.fromScale(0.03,0)
title.Text = "SLK HUB\nBy SLK Gaming"
title.TextYAlignment = Enum.TextYAlignment.Center
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1

local version = Instance.new("TextLabel", header)
version.Size = UDim2.fromScale(0.15,0.6)
version.Position = UDim2.fromScale(0.425,0.2)
version.Text = "v1.1"
version.Font = Enum.Font.Gotham
version.TextScaled = true
version.TextColor3 = Color3.fromRGB(200,200,200)
version.BackgroundTransparency = 1

-- MINIMIZE BUTTON (-)
local minBtn = Instance.new("TextButton", header)
minBtn.Size = UDim2.fromScale(0.06,0.6)
minBtn.Position = UDim2.fromScale(0.85,0.2)
minBtn.Text = "–"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextScaled = true
minBtn.TextColor3 = Color3.fromRGB(255,255,255)
minBtn.BackgroundTransparency = 1

-- CLOSE BUTTON (X)
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.fromScale(0.06,0.6)
closeBtn.Position = UDim2.fromScale(0.92,0.2)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
closeBtn.BackgroundTransparency = 1

-- CONFIRM POPUP
local popup = Instance.new("Frame", gui)
popup.Size = UDim2.fromScale(0.4,0.25)
popup.Position = UDim2.fromScale(0.3,0.38)
popup.BackgroundColor3 = Color3.fromRGB(0,0,0)
popup.BackgroundTransparency = 0.2
popup.Visible = false
popup.BorderSizePixel = 0
Instance.new("UICorner", popup).CornerRadius = UDim.new(0,16)

local popText = Instance.new("TextLabel", popup)
popText.Size = UDim2.fromScale(1,0.4)
popText.Position = UDim2.fromScale(0,0.1)
popText.Text = "DO YOU WANT DELETE SCRIPT?"
popText.Font = Enum.Font.GothamBold
popText.TextScaled = true
popText.TextColor3 = Color3.fromRGB(255,255,255)
popText.BackgroundTransparency = 1

local yes = Instance.new("TextButton", popup)
yes.Size = UDim2.fromScale(0.35,0.25)
yes.Position = UDim2.fromScale(0.1,0.6)
yes.Text = "YES"
yes.Font = Enum.Font.GothamBold
yes.TextScaled = true
yes.TextColor3 = Color3.fromRGB(0,255,0)
yes.BackgroundTransparency = 1

local no = Instance.new("TextButton", popup)
no.Size = UDim2.fromScale(0.35,0.25)
no.Position = UDim2.fromScale(0.55,0.6)
no.Text = "NO"
no.Font = Enum.Font.GothamBold
no.TextScaled = true
no.TextColor3 = Color3.fromRGB(255,80,80)
no.BackgroundTransparency = 1

-- FADE IN MENU
TweenService:Create(main, TweenInfo.new(0.6), {
	BackgroundTransparency = 0.25
}):Play()

task.delay(0.6, function()
	main.Active = true
end)

-- DRAG MENU
local dragging, dragStart, startPos
header.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPos = main.Position
	end
end)
UIS.InputChanged:Connect(function(i)
	if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = i.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

-- MINIMIZE
minBtn.MouseButton1Click:Connect(function()
	TweenService:Create(main, TweenInfo.new(0.4), {
		Size = UDim2.fromScale(0.25,0.08),
		Position = UDim2.fromScale(0.375,0.05)
	}):Play()
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()
	popup.Visible = true
	main.Active = false
end)

no.MouseButton1Click:Connect(function()
	popup.Visible = false
	main.Active = true
end)

yes.MouseButton1Click:Connect(function()
	TweenService:Create(main, TweenInfo.new(0.5), {
		Size = UDim2.fromScale(0,0),
		BackgroundTransparency = 1
	}):Play()
	task.wait(0.6)
	gui:Destroy()
end)
