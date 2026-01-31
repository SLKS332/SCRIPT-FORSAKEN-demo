-- SLK HUB Loading Screen
-- By SLK Gaming

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_LOADING"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.5, 0.25)
main.Position = UDim2.fromScale(0.25, 0.38)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BackgroundTransparency = 0
main.AnchorPoint = Vector2.new(0,0)
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

-- Viền
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.fromScale(1,0.25)
title.Position = UDim2.fromScale(0,0.05)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.TextColor3 = Color3.fromRGB(255,70,70)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- By text
local by = Instance.new("TextLabel", main)
by.Size = UDim2.fromScale(1,0.15)
by.Position = UDim2.fromScale(0,0.3)
by.BackgroundTransparency = 1
by.Text = "By SLK Gaming"
by.TextColor3 = Color3.fromRGB(200,200,200)
by.TextScaled = true
by.Font = Enum.Font.Gotham

-- Loading bar background
local barBG = Instance.new("Frame", main)
barBG.Size = UDim2.fromScale(0.85,0.12)
barBG.Position = UDim2.fromScale(0.075,0.55)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,10)

-- Loading bar
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner", bar).CornerRadius = UDim.new(0,10)

-- Percent text
local percent = Instance.new("TextLabel", main)
percent.Size = UDim2.fromScale(1,0.15)
percent.Position = UDim2.fromScale(0,0.7)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.TextScaled = true
percent.Font = Enum.Font.GothamBold

-- Binary text
local bin = Instance.new("TextLabel", main)
bin.Size = UDim2.fromScale(1,0.1)
bin.Position = UDim2.fromScale(0,0.85)
bin.BackgroundTransparency = 1
bin.Text = "101010101010101010"
bin.TextColor3 = Color3.fromRGB(120,120,120)
bin.TextScaled = true
bin.Font = Enum.Font.Code

-- Loading logic
for i = 1,100 do
	bar:TweenSize(
		UDim2.fromScale(i/100,1),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.03,
		true
	)
	percent.Text = i .. "%"
	task.wait(0.03)
end

-- Finish animation (thu nhỏ + mờ dần)
task.wait(0.4)

TweenService:Create(main, TweenInfo.new(0.6), {
	Size = UDim2.fromScale(0.2,0.1),
	BackgroundTransparency = 1
}):Play()

for _,v in pairs(main:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
	end
	if v:IsA("Frame") then
		TweenService:Create(v, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
	end
end

task.wait(0.7)
gui:Destroy()
