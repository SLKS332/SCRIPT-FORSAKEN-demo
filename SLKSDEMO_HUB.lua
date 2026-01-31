--==================================================
-- SLK HUB LOADING SCREEN
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

----------------------------------------------------
-- LOADING UI
----------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_Loading"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.6, 0.6)
frame.Position = UDim2.fromScale(0.2, 0.2)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255,0,0)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.15)
title.Position = UDim2.fromScale(0, 0.25)
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local by = Instance.new("TextLabel", frame)
by.Size = UDim2.fromScale(1, 0.07)
by.Position = UDim2.fromScale(0, 0.4)
by.Text = "By SLK Gaming"
by.Font = Enum.Font.Gotham
by.TextScaled = true
by.TextColor3 = Color3.fromRGB(200,200,200)
by.BackgroundTransparency = 1

local statusText = Instance.new("TextLabel", frame)
statusText.Size = UDim2.fromScale(1, 0.08)
statusText.Position = UDim2.fromScale(0, 0.6)
statusText.Text = "Welcome to script"
statusText.Font = Enum.Font.Code
statusText.TextScaled = true
statusText.TextColor3 = Color3.new(1,1,1)
statusText.BackgroundTransparency = 1

local percentText = Instance.new("TextLabel", frame)
percentText.Size = UDim2.fromScale(0.2, 0.08)
percentText.Position = UDim2.fromScale(0.75, 0.6)
percentText.Text = "0%"
percentText.Font = Enum.Font.Code
percentText.TextScaled = true
percentText.TextColor3 = Color3.new(1,1,1)
percentText.BackgroundTransparency = 1

local barHolder = Instance.new("Frame", frame)
barHolder.Size = UDim2.fromScale(0.05, 0.5)
barHolder.Position = UDim2.fromScale(0.05, 0.3)
barHolder.BackgroundColor3 = Color3.fromRGB(255,0,0)

local barFill = Instance.new("Frame", barHolder)
barFill.Size = UDim2.fromScale(1, 0)
barFill.Position = UDim2.fromScale(0, 1)
barFill.AnchorPoint = Vector2.new(0,1)
barFill.BackgroundColor3 = Color3.fromRGB(0,170,255)

local binary = Instance.new("TextLabel", frame)
binary.Size = UDim2.fromScale(1, 0.06)
binary.Position = UDim2.fromScale(0, 0.75)
binary.Text = "1010101010101010101010101"
binary.Font = Enum.Font.Code
binary.TextScaled = true
binary.TextColor3 = Color3.fromRGB(0,170,255)
binary.BackgroundTransparency = 1

task.spawn(function()
	while gui.Parent do
		binary.Position = UDim2.fromScale(-0.1, 0.75)
		TweenService:Create(binary, TweenInfo.new(4, Enum.EasingStyle.Linear), {
			Position = UDim2.fromScale(0.1, 0.75)
		}):Play()
		task.wait(4)
	end
end)

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
	task.wait(totalTime/100)
end

statusText.Text = "Thanks for use script"

-- fade + thu nhỏ
local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
for _,v in ipairs(gui:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
	elseif v:IsA("Frame") then
		TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
	end
end

TweenService:Create(frame, tweenInfo, {
	Size = UDim2.fromScale(0.4,0.4),
	Position = UDim2.fromScale(0.3,0.3)
}):Play()

task.wait(1.3)
gui:Destroy()

----------------------------------------------------
-- SLK HUB MENU (SAU LOADING)
----------------------------------------------------

local menuGui = Instance.new("ScreenGui", player.PlayerGui)
menuGui.Name = "SLK_HUB"
menuGui.ResetOnSpawn = false

local main = Instance.new("Frame", menuGui)
main.Size = UDim2.fromScale(0.6,0.55)
main.Position = UDim2.fromScale(0.2,0.22)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local top = Instance.new("Frame", main)
top.Size = UDim2.fromScale(1,0.16)
top.BackgroundColor3 = Color3.fromRGB(20,20,20)
top.BackgroundTransparency = 0.25
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

local title2 = Instance.new("TextLabel", top)
title2.Position = UDim2.fromScale(0.02,0)
title2.Size = UDim2.fromScale(0.25,1)
title2.Text = "SLK HUB"
title2.Font = Enum.Font.GothamBold
title2.TextScaled = true
title2.TextColor3 = Color3.new(1,1,1)
title2.BackgroundTransparency = 1
title2.TextXAlignment = Enum.TextXAlignment.Left

local verBox = Instance.new("Frame", top)
verBox.Position = UDim2.fromScale(0.28,0.3)
verBox.Size = UDim2.fromScale(0.2,0.45)
verBox.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner", verBox).CornerRadius = UDim.new(1,0)

local verText = Instance.new("TextLabel", verBox)
verText.Size = UDim2.fromScale(1,1)
verText.Text = "VERSION v1"
verText.Font = Enum.Font.GothamBold
verText.TextScaled = true
verText.TextColor3 = Color3.new(1,1,1)
verText.BackgroundTransparency = 1

local by2 = Instance.new("TextLabel", main)
by2.Position = UDim2.fromScale(0.02,0.17)
by2.Size = UDim2.fromScale(0.4,0.06)
by2.Text = "BY slk gaming"
by2.Font = Enum.Font.Gotham
by2.TextScaled = true
by2.TextColor3 = Color3.fromRGB(180,180,180)
by2.BackgroundTransparency = 1
by2.TextXAlignment = Enum.TextXAlignment.Left

-- fade in menu
TweenService:Create(main, TweenInfo.new(0.8), {
	BackgroundTransparency = 0.35
}):Play()
