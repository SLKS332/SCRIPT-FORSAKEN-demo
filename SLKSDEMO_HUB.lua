-- SLK GAMING HUB | BASE FIX | DELTA OK
-- MADE BY SLK GAMING

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- chống exec trùng
if getgenv().SLK_LOADED then return end
getgenv().SLK_LOADED = true

-------------------------------------------------
-- GUI GỐC
-------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- LOADING
-------------------------------------------------
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = UDim2.new(0,300,0,120)
loadFrame.Position = UDim2.new(0.5,-150,0.5,-60)
loadFrame.BackgroundColor3 = Color3.fromRGB(255,180,200)
loadFrame.BorderSizePixel = 0

local loadCorner = Instance.new("UICorner", loadFrame)
loadCorner.CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", loadFrame)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "🌸 SLK GAMING HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)

local percent = Instance.new("TextLabel", loadFrame)
percent.Size = UDim2.new(1,0,0,30)
percent.Position = UDim2.new(0,0,0.5,0)
percent.BackgroundTransparency = 1
percent.Text = "Loading... 0%"
percent.Font = Enum.Font.Gotham
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(255,255,255)

for i = 1,100 do
	percent.Text = "Loading... "..i.."%"
	task.wait(0.02)
end

loadFrame:Destroy()

-------------------------------------------------
-- MAIN MENU
-------------------------------------------------
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,450,0,300)
main.Position = UDim2.new(0.5,-225,0.5,-150)
main.BackgroundColor3 = Color3.fromRGB(255,200,220)
main.BorderSizePixel = 0

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0,18)

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundTransparency = 1
header.Text = "SLK GAMING HUB 🌸"
header.Font = Enum.Font.GothamBold
header.TextSize = 20
header.TextColor3 = Color3.fromRGB(255,255,255)

-------------------------------------------------
-- TAB BUTTONS
-------------------------------------------------
local tabs = {"Info","Farm","Player","Settings"}
local tabButtons = {}
local pages = {}

for i,name in ipairs(tabs) do
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0,100,0,30)
	btn.Position = UDim2.new(0,10 + (i-1)*110,0,50)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(255,150,180)
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.BorderSizePixel = 0

	local c = Instance.new("UICorner", btn)
	c.CornerRadius = UDim.new(0,12)

	tabButtons[name] = btn

	local page = Instance.new("Frame", main)
	page.Size = UDim2.new(1,-20,1,-100)
	page.Position = UDim2.new(0,10,0,90)
	page.BackgroundTransparency = 1
	page.Visible = false
	pages[name] = page
end

pages["Info"].Visible = true

for name,btn in pairs(tabButtons) do
	btn.MouseButton1Click:Connect(function()
		for _,p in pairs(pages) do p.Visible = false end
		pages[name].Visible = true
	end)
end

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local infoText = Instance.new("TextLabel", pages["Info"])
infoText.Size = UDim2.new(1,0,1,0)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.Text = "MADE BY SLK GAMING\n\n✔ Hub không mất khi chết\n✔ Hub không mất khi vào trận\n✔ Delta Executor Support"
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 16
infoText.TextColor3 = Color3.fromRGB(255,255,255)

-------------------------------------------------
-- FARM TAB (TEST)
-------------------------------------------------
local farmBtn = Instance.new("TextButton", pages["Farm"])
farmBtn.Size = UDim2.new(0,200,0,40)
farmBtn.Position = UDim2.new(0,20,0,20)
farmBtn.Text = "AUTO FIX GEN (TEST)"
farmBtn.Font = Enum.Font.GothamBold
farmBtn.TextSize = 14
farmBtn.BackgroundColor3 = Color3.fromRGB(255,120,160)
farmBtn.TextColor3 = Color3.fromRGB(255,255,255)
farmBtn.BorderSizePixel = 0
Instance.new("UICorner", farmBtn)

farmBtn.MouseButton1Click:Connect(function()
	farmBtn.Text = "AUTO FIX GEN: ON (TEST)"
end)

-------------------------------------------------
-- PLAYER TAB (TELEPORT SPEED)
-------------------------------------------------
getgenv().tpSpeed = false
getgenv().tpValue = 16

local tpBtn = Instance.new("TextButton", pages["Player"])
tpBtn.Size = UDim2.new(0,200,0,40)
tpBtn.Position = UDim2.new(0,20,0,20)
tpBtn.Text = "Teleport Speed: OFF"
tpBtn.Font = Enum.Font.GothamBold
tpBtn.TextSize = 14
tpBtn.BackgroundColor3 = Color3.fromRGB(255,120,160)
tpBtn.TextColor3 = Color3.fromRGB(255,255,255)
tpBtn.BorderSizePixel = 0
Instance.new("UICorner", tpBtn)

tpBtn.MouseButton1Click:Connect(function()
	getgenv().tpSpeed = not getgenv().tpSpeed
	tpBtn.Text = getgenv().tpSpeed and "Teleport Speed: ON" or "Teleport Speed: OFF"
end)

-------------------------------------------------
-- SETTINGS TAB
-------------------------------------------------
local setText = Instance.new("TextLabel", pages["Settings"])
setText.Size = UDim2.new(1,0,1,0)
setText.BackgroundTransparency = 1
setText.Text = "Settings đang phát triển 🌸"
setText.Font = Enum.Font.Gotham
setText.TextSize = 16
setText.TextColor3 = Color3.fromRGB(255,255,255)

print("✅ SLK GAMING HUB LOADED")
