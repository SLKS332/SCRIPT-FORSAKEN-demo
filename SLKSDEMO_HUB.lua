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
-------------------------------------------------
-- SLKS DEMO MENU V0.1
-------------------------------------------------
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "SLKS_MENU"
MenuGui.IgnoreGuiInset = true
MenuGui.ResetOnSpawn = false
MenuGui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- MAIN MENU
-------------------------------------------------
local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.35
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,16)

local Stroke = Instance.new("UIStroke", Menu)
Stroke.Color = Color3.fromRGB(0,255,140)
Stroke.Thickness = 2

-------------------------------------------------
-- HEADER
-------------------------------------------------
local Header = Instance.new("Frame", Menu)
Header.Size = UDim2.new(1,0,0,40)
Header.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-100,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLKS GAMING"
Title.Font = Enum.Font.Code
Title.TextSize = 22
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(0,255,140)

-- MINIMIZE
local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size = UDim2.new(0,30,0,30)
MinBtn.Position = UDim2.new(1,-70,0.5,-15)
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.Code
MinBtn.TextSize = 22
MinBtn.BackgroundColor3 = Color3.fromRGB(255,200,80)
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1,0)

-- CLOSE
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0,30,0,30)
CloseBtn.Position = UDim2.new(1,-35,0.5,-15)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 18
CloseBtn.BackgroundColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- INFO TEXT
-------------------------------------------------
local Info = Instance.new("TextLabel", Menu)
Info.Size = UDim2.new(1,0,0,60)
Info.Position = UDim2.new(0,0,0.5,-30)
Info.BackgroundTransparency = 1
Info.Text = "BY SLKS GAMING\nVERSION DEMO V0.1"
Info.Font = Enum.Font.Code
Info.TextSize = 16
Info.TextColor3 = Color3.fromRGB(200,200,200)

-------------------------------------------------
-- FLOAT BUTTON (MINIMIZED)
-------------------------------------------------
local FloatBtn = Instance.new("TextButton", MenuGui)
FloatBtn.Size = UDim2.new(0,50,0,50)
FloatBtn.Position = UDim2.new(0,20,0.5,0)
FloatBtn.Visible = false
FloatBtn.Text = "SLKS"
FloatBtn.Font = Enum.Font.Code
FloatBtn.TextSize = 14
FloatBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
FloatBtn.BackgroundTransparency = 0.3
FloatBtn.Active = true
FloatBtn.Draggable = true
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1,0)

local FloatStroke = Instance.new("UIStroke", FloatBtn)
FloatStroke.Color = Color3.fromRGB(0,255,140)
FloatStroke.Thickness = 2

-------------------------------------------------
-- CONFIRM CLOSE
-------------------------------------------------
local Confirm = Instance.new("Frame", Menu)
Confirm.Size = UDim2.new(0,300,0,140)
Confirm.Position = UDim2.new(0.5,-150,0.5,-70)
Confirm.BackgroundColor3 = Color3.fromRGB(10,10,10)
Confirm.Visible = false
Instance.new("UICorner", Confirm).CornerRadius = UDim.new(0,12)

local ConfirmText = Instance.new("TextLabel", Confirm)
ConfirmText.Size = UDim2.new(1,0,0,60)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "Bạn chắc chắn muốn tắt script?"
ConfirmText.Font = Enum.Font.Code
ConfirmText.TextSize = 16
ConfirmText.TextWrapped = true
ConfirmText.TextColor3 = Color3.fromRGB(255,255,255)

local Yes = Instance.new("TextButton", Confirm)
Yes.Size = UDim2.new(0.4,0,0,35)
Yes.Position = UDim2.new(0.05,0,1,-45)
Yes.Text = "YES"
Yes.Font = Enum.Font.Code
Yes.BackgroundColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", Yes).CornerRadius = UDim.new(0,8)

local No = Instance.new("TextButton", Confirm)
No.Size = UDim2.new(0.4,0,0,35)
No.Position = UDim2.new(0.55,0,1,-45)
No.Text = "NO"
No.Font = Enum.Font.Code
No.BackgroundColor3 = Color3.fromRGB(80,180,120)
Instance.new("UICorner", No).CornerRadius = UDim.new(0,8)

-------------------------------------------------
-- BUTTON LOGIC
-------------------------------------------------
MinBtn.MouseButton1Click:Connect(function()
	Menu.Visible = false
	FloatBtn.Visible = true
end)

FloatBtn.MouseButton1Click:Connect(function()
	Menu.Visible = true
	FloatBtn.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
	Confirm.Visible = true
end)

No.MouseButton1Click:Connect(function()
	Confirm.Visible = false
end)

Yes.MouseButton1Click:Connect(function()
	MenuGui:Destroy()
end)
