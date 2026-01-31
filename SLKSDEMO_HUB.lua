--// SLK HUB - VERSION v1 (Transparent + ESP + Minimize)
--// By SLK GAMING

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- ANTI DUPLICATE
--------------------------------------------------
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

--------------------------------------------------
-- GUI
--------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false

--------------------------------------------------
-- MAIN
--------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
Main.BackgroundTransparency = 0.35
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

--------------------------------------------------
-- TOP BAR
--------------------------------------------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
TopBar.BackgroundTransparency = 0.15
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-140,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | v1 Demo"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextColor3 = Color3.new(1,1,1)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-80,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.TextColor3 = Color3.new(1,1,1)
Min.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close Button
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-42,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(255,120,120)
Close.BackgroundColor3 = Color3.fromRGB(60,60,60)
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
-- INFO TAB
--------------------------------------------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.new(1,1,1)
Info.Text = [[Welcome to SLK HUB 👋

• Menu trong suốt
• ESP Highlight Player
• Chỉ chơi vui, không phá game

YouTube: SLK GAMING]]

--------------------------------------------------
-- ESP SYSTEM
--------------------------------------------------
local ESP_ON = false
local ESP_DISTANCE = 10000
local ESPs = {}

local function clearESP()
	for _,v in pairs(ESPs) do
		v:Destroy()
	end
	table.clear(ESPs)
end

local function createESP(plr)
	if plr == LocalPlayer then return end
	if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
	if not LocalPlayer.Character then return end

	local dist = (LocalPlayer.Character.HumanoidRootPart.Position -
		plr.Character.HumanoidRootPart.Position).Magnitude
	if dist > ESP_DISTANCE then return end

	local hl = Instance.new("Highlight")
	hl.Adornee = plr.Character
	hl.FillColor = Color3.fromRGB(80,160,255)
	hl.FillTransparency = 0.4
	hl.OutlineColor = Color3.new(1,1,1)
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Parent = plr.Character

	ESPs[plr] = hl
end

local function refreshESP()
	clearESP()
	if not ESP_ON then return end
	for _,plr in pairs(Players:GetPlayers()) do
		createESP(plr)
	end
end

--------------------------------------------------
-- ESP UI
--------------------------------------------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,320,0,150)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

-- Toggle
local ToggleBg = Instance.new("Frame", ESP_Frame)
ToggleBg.Size = UDim2.new(0,260,0,26)
ToggleBg.BackgroundColor3 = Color3.fromRGB(200,200,200)
Instance.new("UICorner", ToggleBg).CornerRadius = UDim.new(0,20)

local ToggleFill = Instance.new("Frame", ToggleBg)
ToggleFill.Size = UDim2.new(0.5,0,1,0)
ToggleFill.BackgroundColor3 = Color3.fromRGB(80,160,255)
Instance.new("UICorner", ToggleFill).CornerRadius = UDim.new(0,20)

ToggleBg.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		ESP_ON = not ESP_ON
		ToggleFill.Size = ESP_ON and UDim2.new(1,0,1,0) or UDim2.new(0.5,0,1,0)
		refreshESP()
	end
end)

--------------------------------------------------
-- TABS
--------------------------------------------------
local Tabs = {"INFO","ESP"}

for i,name in ipairs(Tabs) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1,-10,0,40)
	Tab.Position = UDim2.new(0,5,0,(i-1)*45+10)
	Tab.Text = name
	Tab.Font = Enum.Font.GothamBold
	Tab.TextSize = 14
	Tab.TextColor3 = Color3.new(1,1,1)
	Tab.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Visible = name=="INFO"
		ESP_Frame.Visible = name=="ESP"
	end)
end

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
	Main.Visible = false
end)
