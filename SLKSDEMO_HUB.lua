-- SLK HUB Loading (FINAL FIX)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_LOADING"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.75,0.16)
main.Position = UDim2.fromScale(0.125,0.42)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255,255,255)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.fromScale(1,0.25)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,80,80)

-- BY
local by = Instance.new("TextLabel", main)
by.Position = UDim2.fromScale(0,0.23)
by.Size = UDim2.fromScale(1,0.15)
by.BackgroundTransparency = 1
by.Text = "By SLK GAMING"
by.Font = Enum.Font.Gotham
by.TextScaled = true
by.TextColor3 = Color3.fromRGB(180,180,180)

-- BAR BG
local barBG = Instance.new("Frame", main)
barBG.Position = UDim2.fromScale(0.05,0.55)
barBG.Size = UDim2.fromScale(0.9,0.18)
barBG.BackgroundColor3 = Color3.fromRGB(255,0,0)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,10)

-- BAR
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(0,10)

-- PERCENT
local percent = Instance.new("TextLabel", main)
percent.Position = UDim2.fromScale(0,0.78)
percent.Size = UDim2.fromScale(1,0.18)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.Code
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(255,255,255)

-- BINARY TEXT (1000100111001)
local binary = Instance.new("TextLabel", main)
binary.Position = UDim2.fromScale(0.05,0.95)
binary.Size = UDim2.fromScale(0.9,0.15)
binary.BackgroundTransparency = 1
binary.Text = "1000100111001"
binary.Font = Enum.Font.Code
binary.TextScaled = true
binary.TextColor3 = Color3.fromRGB(120,120,120)

-- 🔁 BINARY MOVE LOOP (FIX QUAN TRỌNG)
task.spawn(function()
	while binary.Parent do
		binary.Text = binary.Text:sub(2) .. binary.Text:sub(1,1)
		task.wait(0.12) -- chạy chậm, đúng yêu cầu
	end
end)

-- LOADING
for i = 0,100 do
	bar.Size = UDim2.fromScale(i/100,1)
	percent.Text = i.."%"
	task.wait(0.05)
end

-- END EFFECT
TweenService:Create(main, TweenInfo.new(0.6), {
	Size = UDim2.fromScale(0.2,0.05),
	BackgroundTransparency = 1
}):Play()

for _,v in ipairs(main:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
	end
end

task.wait(0.7)
gui:Destroy()
