-- SLKS GAMING | LOADING DEMO (HACKER STYLE)
-- Mobile Safe | Forsaken

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-------------------------------------------------
-- GUI
-------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_LOADING"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- BACKGROUND
-------------------------------------------------
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(5,10,15)

-------------------------------------------------
-- MAIN BOX
-------------------------------------------------
local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,360,0,180)
box.Position = UDim2.new(0.5,-180,0.5,-90)
box.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

-------------------------------------------------
-- TITLE
-------------------------------------------------
local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

-------------------------------------------------
-- BINARY DECOR (010101)
-------------------------------------------------
local binary = Instance.new("TextLabel", box)
binary.Size = UDim2.new(1,-20,0,60)
binary.Position = UDim2.new(0,10,0,50)
binary.BackgroundTransparency = 1
binary.TextWrapped = true
binary.TextYAlignment = Enum.TextYAlignment.Top
binary.Font = Enum.Font.Code
binary.TextSize = 14
binary.TextColor3 = Color3.fromRGB(0,200,120)

-------------------------------------------------
-- LOADING BAR BG
-------------------------------------------------
local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(1,-40,0,16)
barBG.Position = UDim2.new(0,20,1,-40)
barBG.BackgroundColor3 = Color3.fromRGB(30,50,60)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- PERCENT TEXT
-------------------------------------------------
local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-65)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)
percent.Text = "Loading 0%"

-------------------------------------------------
-- BINARY LOOP
-------------------------------------------------
task.spawn(function()
	while gui.Parent do
		local str = ""
		for i = 1, math.random(40,70) do
			str ..= tostring(math.random(0,1))
		end
		binary.Text = str
		task.wait(0.15)
	end
end)

-------------------------------------------------
-- LOADING PROCESS
-------------------------------------------------
for i = 1,100 do
	percent.Text = "Loading "..i.."%"
	TweenService:Create(
		bar,
		TweenInfo.new(0.03, Enum.EasingStyle.Linear),
		{Size = UDim2.new(i/100,0,1,0)}
	):Play()
	task.wait(0.03)
end

-------------------------------------------------
-- FADE OUT
-------------------------------------------------
task.wait(0.3)
TweenService:Create(bg, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
TweenService:Create(box, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()

for _,v in ipairs(box:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
	end
end

task.wait(1)
gui:Destroy()
