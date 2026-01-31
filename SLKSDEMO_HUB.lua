-- SLK HUB LOADING FULL FIX
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_LOADING"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.6,0.35)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
main.BackgroundTransparency = 0

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,18)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.fromScale(1,0.22)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

-- BY TEXT
local by = Instance.new("TextLabel", main)
by.Position = UDim2.fromScale(0,0.22)
by.Size = UDim2.fromScale(1,0.1)
by.BackgroundTransparency = 1
by.Text = "By SLK GAMING"
by.TextColor3 = Color3.fromRGB(180,180,180)
by.Font = Enum.Font.Gotham
by.TextScaled = true

-- STATUS
local status = Instance.new("TextLabel", main)
status.Position = UDim2.fromScale(0,0.32)
status.Size = UDim2.fromScale(1,0.12)
status.BackgroundTransparency = 1
status.Text = "Welcome to script"
status.TextColor3 = Color3.fromRGB(255,255,255)
status.Font = Enum.Font.Gotham
status.TextScaled = true

-- LOAD BAR OUTLINE
local outline = Instance.new("Frame", main)
outline.Position = UDim2.fromScale(0.1,0.5)
outline.Size = UDim2.fromScale(0.8,0.1)
outline.BackgroundColor3 = Color3.fromRGB(255,0,0)
outline.BorderSizePixel = 0

local oc = Instance.new("UICorner", outline)
oc.CornerRadius = UDim.new(0,8)

-- LOAD BAR
local bar = Instance.new("Frame", outline)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
bar.BorderSizePixel = 0

local bc = Instance.new("UICorner", bar)
bc.CornerRadius = UDim.new(0,8)

-- PERCENT
local percent = Instance.new("TextLabel", main)
percent.Position = UDim2.fromScale(0,0.62)
percent.Size = UDim2.fromScale(1,0.1)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.Font = Enum.Font.Code
percent.TextScaled = true

-- BINARY
local binary = Instance.new("TextLabel", main)
binary.Position = UDim2.fromScale(0.1,0.75)
binary.Size = UDim2.fromScale(0.8,0.1)
binary.BackgroundTransparency = 1
binary.Text = "10101010101010101010"
binary.TextColor3 = Color3.fromRGB(120,120,120)
binary.Font = Enum.Font.Code
binary.TextScaled = true

-- BINARY MOVE
task.spawn(function()
	while binary.Parent do
		binary.Text = binary.Text:sub(2)..binary.Text:sub(1,1)
		task.wait(0.15)
	end
end)

-- STATUS LIST
local texts = {
	"Welcome to script",
	"Script will done",
	"Script will ready",
	"Okay wait a script"
}

-- LOADING
for i = 0,100 do
	bar.Size = UDim2.fromScale(i/100,1)
	percent.Text = i.."%"
	status.Text = texts[(i%#texts)+1]
	task.wait(0.06) -- ~6s
end

-- FADE + SHRINK
TweenService:Create(main, TweenInfo.new(0.5), {
	Size = UDim2.fromScale(0.45,0.25),
	BackgroundTransparency = 1
}):Play()

for _,v in ipairs(main:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
	end
end

task.wait(0.6)
gui:Destroy()
