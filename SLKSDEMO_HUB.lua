--=====================================
-- SLK GAMING HUB - UI FRAME ONLY
-- NO TAB | NO FUNCTION
--=====================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if getgenv().SLK_UI then return end
getgenv().SLK_UI = true

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 620, 0, 380)
main.Position = UDim2.new(0.5, -310, 0.5, -190)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,40)
top.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,12)

-- TITLE
local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "SLK GAMING HUB | FORSAKEN"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextXAlignment = Left

-- CLOSE BUTTON
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0.5,-15)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255,80,80)
close.BackgroundColor3 = Color3.fromRGB(50,50,50)
Instance.new("UICorner", close)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
	getgenv().SLK_UI = false
end)

-- LEFT MENU
local left = Instance.new("Frame", main)
left.Position = UDim2.new(0,0,0,40)
left.Size = UDim2.new(0,170,1,-40)
left.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- MENU LIST
local list = Instance.new("UIListLayout", left)
list.Padding = UDim.new(0,6)

local function MenuButton(text)
	local b = Instance.new("TextButton", left)
	b.Size = UDim2.new(1,-10,0,40)
	b.Position = UDim2.new(0,5,0,0)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(220,220,220)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	Instance.new("UICorner", b)
	return b
end

MenuButton("Autofarm")
MenuButton("Player")
MenuButton("Visual")
MenuButton("Settings")
MenuButton("Status")
MenuButton("Other")

-- RIGHT CONTENT (TRỐNG)
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,170,0,40)
content.Size = UDim2.new(1,-170,1,-40)
content.BackgroundColor3 = Color3.fromRGB(20,20,20)

local text = Instance.new("TextLabel", content)
text.Size = UDim2.new(1,0,1,0)
text.BackgroundTransparency = 1
text.Text = "CONTENT AREA\n(Chưa gắn chức năng)"
text.Font = Enum.Font.Gotham
text.TextSize = 14
text.TextColor3 = Color3.fromRGB(150,150,150)

print("SLK HUB UI LOADED")
