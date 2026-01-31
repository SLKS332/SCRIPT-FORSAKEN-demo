-- SLK HUB Loading (FULL FIX FINAL)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_LOADING"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.fromScale(0.6, 0.14) -- FIX: cao hơn, không bị to
main.Position = UDim2.fromScale(0.2, 0.43)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderSizePixel = 0

Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255,255,255)

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.fromScale(1,0.22)
title.Position = UDim2.fromScale(0,0.03)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,80,80)

-- BY
local by = Instance.new("TextLabel")
by.Parent = main
by.Size = UDim2.fromScale(1,0.14)
by.Position = UDim2.fromScale(0,0.24)
by.BackgroundTransparency = 1
by.Text = "By SLK GAMING"
by.Font = Enum.Font.Gotham
by.TextScaled = true
by.TextColor3 = Color3.fromRGB(180,180,180)

-- BAR BACKGROUND (RED)
local barBG = Instance.new("Frame")
barBG.Parent = main
barBG.Size = UDim2.fromScale(0.9,0.18)
barBG.Position = UDim2.fromScale(0.05,0.43)
barBG.BackgroundColor3 = Color3.fromRGB(255,0,0)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,10)

-- BAR (BLUE)
local bar = Instance.new("Frame")
bar.Parent = barBG
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(0,10)

-- PERCENT TEXT
local percent = Instance.new("TextLabel")
percent.Parent = main
percent.Size = UDim2.fromScale(1,0.18)
percent.Position = UDim2.fromScale(0,0.64)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.Code
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(255,255,255)

-- BINARY TEXT
local binary = Instance.new("TextLabel")
binary.Parent = main
binary.Size = UDim2.fromScale(0.9,0.14)
binary.Position = UDim2.fromScale(0.05,0.82)
binary.BackgroundTransparency = 1
binary.Text = "1000100111001"
binary.Font = Enum.Font.Code
binary.TextScaled = true
binary.TextColor3 = Color3.fromRGB(120,120,120)

-- BINARY MOVE (CHẠY LIÊN TỤC)
task.spawn(function()
	while binary.Parent do
		binary.Text = binary.Text:sub(2) .. binary.Text:sub(1,1)
		task.wait(0.12) -- chạy chậm đúng yêu cầu
	end
end)

-- LOADING (5–7s)
for i = 0,100 do
	bar.Size = UDim2.fromScale(i/100,1)
	percent.Text = i.."%"
	task.wait(0.055)
end

-- END EFFECT (THU NHỎ + MỜ + BIẾN MẤT)
TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
	Size = UDim2.fromScale(0.2,0.05),
	BackgroundTransparency = 1
}):Play()

for _,v in ipairs(main:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(0.6), {
			TextTransparency = 1
		}):Play()
	end
end

task.wait(0.7)
gui:Destroy()
