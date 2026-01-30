-- SLKS GAMING HUB | CUTE PINK LOADING (BAR + PERCENT)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if getgenv().SLKS_PINK_LOADING then return end
getgenv().SLKS_PINK_LOADING = true

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_PINK_LOADING"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(255,190,215)

-- box
local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,400,0,230)
box.Position = UDim2.new(0.5,-200,0.5,-115)
box.BackgroundColor3 = Color3.fromRGB(255,225,235)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,22)

local stroke = Instance.new("UIStroke", box)
stroke.Color = Color3.fromRGB(255,120,170)
stroke.Thickness = 3

-- title
local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,45)
title.Position = UDim2.new(0,0,0,15)
title.BackgroundTransparency = 1
title.Text = "💗 SLKS GAMING HUB 💗"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,90,150)

-- subtitle
local sub = Instance.new("TextLabel", box)
sub.Size = UDim2.new(1,0,0,25)
sub.Position = UDim2.new(0,0,0,60)
sub.BackgroundTransparency = 1
sub.Text = "Cute Pink Edition ✨"
sub.Font = Enum.Font.Gotham
sub.TextSize = 15
sub.TextColor3 = Color3.fromRGB(255,130,180)

-- loading bar background
local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(0.85,0,0,18)
barBG.Position = UDim2.new(0.075,0,0,110)
barBG.BackgroundColor3 = Color3.fromRGB(255,200,220)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

-- loading bar fill
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,110,170)
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

-- percent text (RIÊNG, KHÔNG DÍNH BAR)
local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,30)
percent.Position = UDim2.new(0,0,0,145)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.GothamMedium
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(255,90,150)
percent.Text = "Loading... 0%"

-- fake loading
for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	percent.Text = "Loading... "..i.."%"
	task.wait(0.025)
end

-- done
gui:Destroy()
