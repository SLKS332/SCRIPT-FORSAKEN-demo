--// SLK HUB - VERSION v1 (Demo)
--// By SLK GAMING

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- anti duplicate
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
Title.Size = UDim2.new(1,-200,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB  |  v1 Demo"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Left

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

	local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
	if dist > ESP_DISTANCE then return end

	local hl = Instance.new("Highlight")
	hl.Adornee = plr.Character
	hl.FillColor = Color3.fromRGB(80,160,255)
	hl.OutlineColor = Color3.new(1,1,1)
	hl.FillTransparency = 0.4
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

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(1)
		if ESP_ON then
			refreshESP()
		end
	end)
end)

--------------------------------------------------
-- INFO
--------------------------------------------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.Text = "Welcome to SLK HUB 👋\n\nTab ESP có thanh ON/OFF và chỉnh khoảng cách."

--------------------------------------------------
-- ESP UI
--------------------------------------------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,320,0,150)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

-- Toggle Bar
local ToggleBg = Instance.new("Frame", ESP_Frame)
ToggleBg.Size = UDim2.new(0,260,0,26)
ToggleBg.Position = UDim2.new(0,0,0,0)
ToggleBg.BackgroundColor3 = Color3.fromRGB(200,200,200)
Instance.new("UICorner", ToggleBg).CornerRadius = UDim.new(0,20)

local ToggleFill = Instance.new("Frame", ToggleBg)
ToggleFill.Size = UDim2.new(0.5,0,1,0) -- OFF = half
ToggleFill.BackgroundColor3 = Color3.fromRGB(80,160,255)
Instance.new("UICorner", ToggleFill).CornerRadius = UDim.new(0,20)

ToggleBg.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		ESP_ON = not ESP_ON
		ToggleFill.Size = ESP_ON and UDim2.new(1,0,1,0) or UDim2.new(0.5,0,1,0)
		refreshESP()
	end
end)

-- Distance Slider
local SliderBg = Instance.new("Frame", ESP_Frame)
SliderBg.Size = UDim2.new(0,260,0,20)
SliderBg.Position = UDim2.new(0,0,0,50)
SliderBg.BackgroundColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(0,10)

local SliderFill = Instance.new("Frame", SliderBg)
SliderFill.Size = UDim2.new(0.2,0,1,0)
SliderFill.BackgroundColor3 = Color3.fromRGB(80,160,255)
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(0,10)

local DistanceText = Instance.new("TextLabel", ESP_Frame)
DistanceText.Size = UDim2.new(0,260,0,20)
DistanceText.Position = UDim2.new(0,0,0,80)
DistanceText.BackgroundTransparency = 1
DistanceText.Text = "ESP Distance : 10000"
DistanceText.Font = Enum.Font.GothamBold
DistanceText.TextSize = 13

SliderBg.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local move
		move = UIS.InputChanged:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseMovement then
				local percent = math.clamp(
					(i.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X,
					0,1
				)
				SliderFill.Size = UDim2.new(percent,0,1,0)
				ESP_DISTANCE = math.floor(percent * 100000)
				DistanceText.Text = "ESP Distance : "..ESP_DISTANCE
				refreshESP()
			end
		end)
		UIS.InputEnded:Wait()
		move:Disconnect()
	end
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
