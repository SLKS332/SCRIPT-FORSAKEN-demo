--// SLK HUB - VERSION v1 (Demo)
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Anti duplicate
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

--------------------------------------------------
-- GUI
--------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

--------------------------------------------------
-- MAIN
--------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

--------------------------------------------------
-- TOP BAR
--------------------------------------------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(235,235,235)
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-220,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | v1 Demo"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-74,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(245,245,245)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-36,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(150,60,60)
Close.BackgroundColor3 = Color3.fromRGB(245,245,245)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- CONTENT
--------------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,0,0,46)
Content.Size = UDim2.new(1,0,1,-46)
Content.BackgroundTransparency = 1

local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0,120,1,0)
TabBar.BackgroundTransparency = 1

local View = Instance.new("Frame", Content)
View.Position = UDim2.new(0,120,0,0)
View.Size = UDim2.new(1,-120,1,0)
View.BackgroundTransparency = 1

--------------------------------------------------
-- INFO
--------------------------------------------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.Text = [[Welcome to SLK HUB 👋

Status:
• Script: Working ✅
• Version: Demo / Alpha
• Update: 2026

YouTube:
SLK GAMING 📺
]]

--------------------------------------------------
-- ESP
--------------------------------------------------
local ESP_ON = false
local ESPs = {}

local function clearESP()
	for _,v in pairs(ESPs) do
		v:Destroy()
	end
	table.clear(ESPs)
end

local function refreshESP()
	clearESP()
	if not ESP_ON then return end
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local hl = Instance.new("Highlight")
			hl.Adornee = plr.Character
			hl.FillColor = Color3.fromRGB(80,160,255)
			hl.FillTransparency = 0.4
			hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			hl.Parent = plr.Character
			ESPs[plr] = hl
		end
	end
end

local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,300,0,100)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.Visible = false
ESP_Frame.BackgroundTransparency = 1

local ESP_Toggle = Instance.new("TextButton", ESP_Frame)
ESP_Toggle.Size = UDim2.new(0,260,0,32)
ESP_Toggle.Text = "ESP : OFF"
ESP_Toggle.Font = Enum.Font.GothamBold
ESP_Toggle.TextSize = 14
ESP_Toggle.BackgroundColor3 = Color3.fromRGB(200,200,200)
Instance.new("UICorner", ESP_Toggle).CornerRadius = UDim.new(0,20)

ESP_Toggle.MouseButton1Click:Connect(function()
	ESP_ON = not ESP_ON
	ESP_Toggle.Text = ESP_ON and "ESP : ON" or "ESP : OFF"
	ESP_Toggle.BackgroundColor3 = ESP_ON and Color3.fromRGB(80,160,255) or Color3.fromRGB(200,200,200)
	refreshESP()
end)

--------------------------------------------------
-- TABS
--------------------------------------------------
local Tabs = {"INFO","ESP","Tab 3","Tab 4","Tab 5","Tab 6"}

for i,name in ipairs(Tabs) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1,-10,0,40)
	Tab.Position = UDim2.new(0,5,0,(i-1)*45+10)
	Tab.Text = name
	Tab.Font = Enum.Font.GothamBold
	Tab.TextSize = 14
	Tab.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Visible = name=="INFO"
		ESP_Frame.Visible = name=="ESP"
	end)
end

--------------------------------------------------
-- DRAG (PC + MOBILE)
--------------------------------------------------
local dragging, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

--------------------------------------------------
-- CLOSE CONFIRM
--------------------------------------------------
Close.MouseButton1Click:Connect(function()
	if gui:FindFirstChild("CONFIRM") then return end

	local cf = Instance.new("Frame", gui)
	cf.Name = "CONFIRM"
	cf.Size = UDim2.new(0,260,0,130)
	cf.Position = UDim2.new(0.5,-130,0.5,-65)
	cf.BackgroundColor3 = Color3.fromRGB(255,255,255)
	cf.ZIndex = 10
	Instance.new("UICorner", cf).CornerRadius = UDim.new(0,12)

	local txt = Instance.new("TextLabel", cf)
	txt.Size = UDim2.new(1,-20,0,50)
	txt.Position = UDim2.new(0,10,0,10)
	txt.BackgroundTransparency = 1
	txt.Text = "Do you want to close SLK HUB?"
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 14

	local yes = Instance.new("TextButton", cf)
	yes.Size = UDim2.new(0.4,0,0,32)
	yes.Position = UDim2.new(0.05,0,1,-42)
	yes.Text = "Yes"
	yes.BackgroundColor3 = Color3.fromRGB(255,120,120)
	yes.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", yes).CornerRadius = UDim.new(0,8)

	local no = Instance.new("TextButton", cf)
	no.Size = UDim2.new(0.4,0,0,32)
	no.Position = UDim2.new(0.55,0,1,-42)
	no.Text = "No"
	no.BackgroundColor3 = Color3.fromRGB(200,200,200)
	Instance.new("UICorner", no).CornerRadius = UDim.new(0,8)

	yes.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
	no.MouseButton1Click:Connect(function()
		cf:Destroy()
	end)
end)
