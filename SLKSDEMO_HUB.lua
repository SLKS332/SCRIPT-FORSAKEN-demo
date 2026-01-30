-- SLKS GAMING | DEMO HUB V0.1
-- Loading + Menu (Mobile Safe)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-------------------------------------------------
-- LOADING GUI
-------------------------------------------------
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(5,10,15)

local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,360,0,180)
box.Position = UDim2.new(0.5,-180,0.5,-90)
box.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local binary = Instance.new("TextLabel", box)
binary.Size = UDim2.new(1,-20,0,60)
binary.Position = UDim2.new(0,10,0,50)
binary.BackgroundTransparency = 1
binary.TextWrapped = true
binary.Font = Enum.Font.Code
binary.TextSize = 14
binary.TextColor3 = Color3.fromRGB(0,200,120)

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(1,-40,0,16)
barBG.Position = UDim2.new(0,20,1,-40)
barBG.BackgroundColor3 = Color3.fromRGB(30,50,60)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-65)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)
percent.Text = "Loading 0%"

task.spawn(function()
	while gui.Parent do
		local s = ""
		for i=1,math.random(40,70) do
			s ..= math.random(0,1)
		end
		binary.Text = s
		task.wait(0.15)
	end
end)

for i=1,100 do
	percent.Text = "Loading "..i.."%"
	TweenService:Create(bar,TweenInfo.new(0.03),{
		Size = UDim2.new(i/100,0,1,0)
	}):Play()
	task.wait(0.03)
end

task.wait(0.5)
gui:Destroy()

-------------------------------------------------
-- MENU GUI
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui", player.PlayerGui)
MenuGui.ResetOnSpawn = false

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.35
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,60)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING\nBY SLKS GAMING\nVERSION DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

-- Minimize
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,10)
minBtn.Text = "-"
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 22
minBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
minBtn.TextColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", minBtn)

-- Close
local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,10)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(60,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", closeBtn)

-- Minimize logic
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _,v in ipairs(Menu:GetChildren()) do
		if v ~= header and v ~= minBtn and v ~= closeBtn and v:IsA("GuiObject") then
			v.Visible = not minimized
		end
	end
	Menu.Size = minimized and UDim2.new(0,420,0,60) or UDim2.new(0,420,0,260)
end)

-- Close confirm
closeBtn.MouseButton1Click:Connect(function()
	local confirm = Instance.new("Frame", MenuGui)
	confirm.Size = UDim2.new(0,300,0,150)
	confirm.Position = UDim2.new(0.5,-150,0.5,-75)
	confirm.BackgroundColor3 = Color3.fromRGB(0,0,0)
	confirm.BackgroundTransparency = 0.2
	Instance.new("UICorner", confirm)

	local txt = Instance.new("TextLabel", confirm)
	txt.Size = UDim2.new(1,0,0,60)
	txt.BackgroundTransparency = 1
	txt.Text = "Bạn chắc chắn muốn tắt script?"
	txt.TextColor3 = Color3.fromRGB(255,255,255)
	txt.Font = Enum.Font.Code
	txt.TextSize = 16

	local yes = Instance.new("TextButton", confirm)
	yes.Size = UDim2.new(0.4,0,0,40)
	yes.Position = UDim2.new(0.05,0,1,-50)
	yes.Text = "Có"
	yes.BackgroundColor3 = Color3.fromRGB(60,120,60)

	local no = Instance.new("TextButton", confirm)
	no.Size = UDim2.new(0.4,0,0,40)
	no.Position = UDim2.new(0.55,0,1,-50)
	no.Text = "Không"
	no.BackgroundColor3 = Color3.fromRGB(120,60,60)

	yes.MouseButton1Click:Connect(function()
		MenuGui:Destroy()
	end)
	no.MouseButton1Click:Connect(function()
		confirm:Destroy()
	end)
end)
