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
task.wait(1)
gui:Destroy()
