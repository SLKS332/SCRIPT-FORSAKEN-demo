-- SLK GAMING HUB | FORSAKEN | FULL BUILD

if getgenv().SLK_LOADED then return end
getgenv().SLK_LOADED = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ================= STATE =================
getgenv().STATE = {
	AutoFix = false,
	FixDelay = 3,
	SpeedOn = false,
	Speed = 16,
	ESPPlayer = false
}

-- ================= GUI =================
local Gui = Instance.new("ScreenGui")
Gui.Name = "SLK_HUB"
Gui.ResetOnSpawn = false
Gui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,520,0,360)
Main.Position = UDim2.new(0.5,-260,0.5,-180)
Main.BackgroundColor3 = Color3.fromRGB(255,180,200)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- Header
local Header = Instance.new("TextLabel", Main)
Header.Size = UDim2.new(1,0,0,40)
Header.Text = "SLK GAMING HUB | FORSAKEN"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 16
Header.TextColor3 = Color3.new(1,1,1)
Header.BackgroundTransparency = 1

-- Buttons
local function topBtn(text,x)
	local b = Instance.new("TextButton", Main)
	b.Size = UDim2.new(0,30,0,30)
	b.Position = UDim2.new(1,x,0,5)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(255,120,150)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	return b
end

local Min = topBtn("-", -70)
local Close = topBtn("X", -35)

-- ================= TABS =================
local Tabs = {}
local Pages = {}

local function makeTab(name,x)
	local b = Instance.new("TextButton", Main)
	b.Size = UDim2.new(0,120,0,30)
	b.Position = UDim2.new(0,x,0,50)
	b.Text = name
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.BackgroundColor3 = Color3.fromRGB(255,140,170)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	return b
end

Tabs.Info = makeTab("INFO",20)
Tabs.Farm = makeTab("FARM",150)
Tabs.Player = makeTab("PLAYER",280)
Tabs.Settings = makeTab("SETTINGS",410)

local function makePage()
	local f = Instance.new("Frame", Main)
	f.Size = UDim2.new(1,-40,1,-100)
	f.Position = UDim2.new(0,20,0,90)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

Pages.Info = makePage()
Pages.Farm = makePage()
Pages.Player = makePage()
Pages.Settings = makePage()

local function switch(tab)
	for _,p in pairs(Pages) do p.Visible = false end
	Pages[tab].Visible = true
end

switch("Info")
Tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
Tabs.Farm.MouseButton1Click:Connect(function() switch("Farm") end)
Tabs.Player.MouseButton1Click:Connect(function() switch("Player") end)
Tabs.Settings.MouseButton1Click:Connect(function() switch("Settings") end)

-- ================= INFO =================
local info = Instance.new("TextLabel", Pages.Info)
info.Size = UDim2.new(1,0,1,0)
info.TextWrapped = true
info.Text = "SLK GAMING HUB\nForsaken Test Build\nUI + Core Stable"
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1

-- ================= FARM =================
local fixBtn = Instance.new("TextButton", Pages.Farm)
fixBtn.Size = UDim2.new(0,300,0,40)
fixBtn.Position = UDim2.new(0,0,0,0)
fixBtn.Text = "AUTO FIX GEN : OFF"
fixBtn.BackgroundColor3 = Color3.fromRGB(255,120,150)
fixBtn.TextColor3 = Color3.new(1,1,1)
fixBtn.Font = Enum.Font.GothamBold
fixBtn.TextSize = 14
Instance.new("UICorner", fixBtn)

fixBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.AutoFix = not getgenv().STATE.AutoFix
	fixBtn.Text = getgenv().STATE.AutoFix and "AUTO FIX GEN : ON" or "AUTO FIX GEN : OFF"
end)

local delayLabel = Instance.new("TextLabel", Pages.Farm)
delayLabel.Position = UDim2.new(0,0,0,50)
delayLabel.Size = UDim2.new(1,0,0,30)
delayLabel.Text = "Delay: 3s"
delayLabel.BackgroundTransparency = 1
delayLabel.TextColor3 = Color3.new(1,1,1)

local delaySlider = Instance.new("TextButton", Pages.Farm)
delaySlider.Position = UDim2.new(0,0,0,80)
delaySlider.Size = UDim2.new(1,0,0,20)
delaySlider.Text = "KÉO ĐỂ CHỈNH DELAY"
delaySlider.BackgroundColor3 = Color3.fromRGB(255,140,170)

delaySlider.MouseButton1Down:Connect(function()
	local move
	move = RunService.RenderStepped:Connect(function()
		local x = math.clamp((UIS:GetMouseLocation().X - delaySlider.AbsolutePosition.X)/delaySlider.AbsoluteSize.X,0,1)
		getgenv().STATE.FixDelay = math.floor(x*10)
		delayLabel.Text = "Delay: "..getgenv().STATE.FixDelay.."s"
	end)
	UIS.InputEnded:Wait()
	move:Disconnect()
end)

-- ================= PLAYER =================
local speedBtn = Instance.new("TextButton", Pages.Player)
speedBtn.Size = UDim2.new(0,300,0,40)
speedBtn.Text = "TELEPORT SPEED : OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(255,120,150)
speedBtn.TextColor3 = Color3.new(1,1,1)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 14
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.SpeedOn = not getgenv().STATE.SpeedOn
	speedBtn.Text = getgenv().STATE.SpeedOn and "TELEPORT SPEED : ON" or "TELEPORT SPEED : OFF"
end)

local speedLabel = Instance.new("TextLabel", Pages.Player)
speedLabel.Position = UDim2.new(0,0,0,50)
speedLabel.Size = UDim2.new(1,0,0,30)
speedLabel.Text = "Speed: 16"
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)

local speedSlider = Instance.new("TextButton", Pages.Player)
speedSlider.Position = UDim2.new(0,0,0,80)
speedSlider.Size = UDim2.new(1,0,0,20)
speedSlider.Text = "KÉO ĐỂ CHỈNH SPEED"
speedSlider.BackgroundColor3 = Color3.fromRGB(255,140,170)

speedSlider.MouseButton1Down:Connect(function()
	local move
	move = RunService.RenderStepped:Connect(function()
		local x = math.clamp((UIS:GetMouseLocation().X - speedSlider.AbsolutePosition.X)/speedSlider.AbsoluteSize.X,0,1)
		getgenv().STATE.Speed = math.floor(x*50)
		speedLabel.Text = "Speed: "..getgenv().STATE.Speed
	end)
	UIS.InputEnded:Wait()
	move:Disconnect()
end)

-- ESP PLAYER
local espBtn = Instance.new("TextButton", Pages.Player)
espBtn.Position = UDim2.new(0,0,0,120)
espBtn.Size = UDim2.new(0,300,0,40)
espBtn.Text = "ESP PLAYER : OFF"
espBtn.BackgroundColor3 = Color3.fromRGB(255,120,150)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.Font = Enum.Font.GothamBold
espBtn.TextSize = 14
Instance.new("UICorner", espBtn)

espBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.ESPPlayer = not getgenv().STATE.ESPPlayer
	espBtn.Text = getgenv().STATE.ESPPlayer and "ESP PLAYER : ON" or "ESP PLAYER : OFF"
end)

-- ESP LOOP
task.spawn(function()
	while task.wait(1) do
		if getgenv().STATE.ESPPlayer then
			for _,plr in pairs(Players:GetPlayers()) do
				if plr ~= player and plr.Character then
					if not plr.Character:FindFirstChild("SLK_ESP") then
						local h = Instance.new("Highlight")
						h.Name = "SLK_ESP"
						h.FillColor = Color3.fromRGB(0,255,0)
						h.OutlineColor = Color3.fromRGB(0,255,0)
						h.Parent = plr.Character
					end
				end
			end
		end
	end
end)

-- SPEED APPLY
RunService.RenderStepped:Connect(function()
	if getgenv().STATE.SpeedOn then
		local char = player.Character
		if char and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
			char.Humanoid.WalkSpeed = getgenv().STATE.Speed
		end
	end
end)
