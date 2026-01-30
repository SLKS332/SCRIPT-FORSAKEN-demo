--==================================================
-- SLK GAMING HUB | FORSAKEN | FULL VERSION
-- Farm / Player / Settings
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer

if getgenv().SLK_HUB then return end
getgenv().SLK_HUB = true

--================ STATE =================
getgenv().STATE = {
	autoFix = false,
	fixDelay = 1,

	speedOn = false,
	speed = 16,

	espPlayer = false,
	espGen = false,

	showChat = false
}

--================ GUI =================
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,480,0,360)
Main.Position = UDim2.new(0.5,-240,0.5,-180)
Main.BackgroundColor3 = Color3.fromRGB(255,190,210)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local title = Instance.new("TextLabel", Main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SLK GAMING HUB | FORSAKEN"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,80,130)

--================ TAB BUTTONS =================
local function makeTabBtn(text,x)
	local b = Instance.new("TextButton", Main)
	b.Size = UDim2.new(0,140,0,30)
	b.Position = UDim2.new(0,x,0,45)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(255,120,160)
	Instance.new("UICorner", b)
	return b
end

local farmBtn = makeTabBtn("FARM",10)
local playerBtn = makeTabBtn("PLAYER",170)
local settingsBtn = makeTabBtn("SETTINGS",330)

--================ TABS =================
local function makeTab()
	local f = Instance.new("Frame", Main)
	f.Position = UDim2.new(0,10,0,85)
	f.Size = UDim2.new(1,-20,1,-95)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

local FarmTab = makeTab()
local PlayerTab = makeTab()
local SettingsTab = makeTab()
FarmTab.Visible = true

local function switch(tab)
	FarmTab.Visible = false
	PlayerTab.Visible = false
	SettingsTab.Visible = false
	tab.Visible = true
end

farmBtn.MouseButton1Click:Connect(function() switch(FarmTab) end)
playerBtn.MouseButton1Click:Connect(function() switch(PlayerTab) end)
settingsBtn.MouseButton1Click:Connect(function() switch(SettingsTab) end)

--==================================================
-- FARM TAB : AUTO FIX GEN
--==================================================
local fixBtn = Instance.new("TextButton", FarmTab)
fixBtn.Size = UDim2.new(0,320,0,40)
fixBtn.Text = "AUTO FIX GEN : OFF"
fixBtn.Font = Enum.Font.GothamBold
fixBtn.TextColor3 = Color3.new(1,1,1)
fixBtn.BackgroundColor3 = Color3.fromRGB(255,120,160)
Instance.new("UICorner", fixBtn)

fixBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.autoFix = not getgenv().STATE.autoFix
	fixBtn.Text = getgenv().STATE.autoFix and "AUTO FIX GEN : ON" or "AUTO FIX GEN : OFF"
end)

local delayLabel = Instance.new("TextLabel", FarmTab)
delayLabel.Position = UDim2.new(0,0,0,50)
delayLabel.Size = UDim2.new(0,320,0,25)
delayLabel.BackgroundTransparency = 1
delayLabel.Text = "Delay : 1"
delayLabel.Font = Enum.Font.GothamBold
delayLabel.TextColor3 = Color3.new(1,1,1)

local bar = Instance.new("Frame", FarmTab)
bar.Position = UDim2.new(0,0,0,80)
bar.Size = UDim2.new(0,320,0,8)
bar.BackgroundColor3 = Color3.fromRGB(255,160,190)
Instance.new("UICorner", bar)

local knob = Instance.new("Frame", bar)
knob.Size = UDim2.new(0,14,0,14)
knob.Position = UDim2.new(0.1,-7,0.5,-7)
knob.BackgroundColor3 = Color3.fromRGB(255,80,130)
Instance.new("UICorner", knob)

local dragging = false
knob.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
end)
knob.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

UIS.InputChanged:Connect(function(i)
	if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
		local x = math.clamp((i.Position.X - bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
		getgenv().STATE.fixDelay = math.floor(x*10)
		knob.Position = UDim2.new(x,-7,0.5,-7)
		delayLabel.Text = "Delay : "..getgenv().STATE.fixDelay
	end
end)

local function getNearestGen()
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local closest, dist = nil, math.huge

	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and (v.Name:lower():find("gen") or v.Name:lower():find("generator")) then
			local p = v:FindFirstChildWhichIsA("BasePart")
			if p then
				local d = (hrp.Position - p.Position).Magnitude
				if d < dist then
					dist = d
					closest = p
				end
			end
		end
	end
	return closest
end

task.spawn(function()
	while task.wait(0.2) do
		if getgenv().STATE.autoFix then
			local gen = getNearestGen()
			local char = player.Character
			if gen and char and char:FindFirstChild("HumanoidRootPart") then
				char.HumanoidRootPart.CFrame = gen.CFrame * CFrame.new(0,0,-2)
				task.wait(getgenv().STATE.fixDelay)
				VIM:SendKeyEvent(true,"E",false,game)
				task.wait(0.2)
				VIM:SendKeyEvent(false,"E",false,game)
			end
		end
	end
end)

--==================================================
-- PLAYER TAB : TELEPORT SPEED + ESP
--==================================================
local speedBtn = Instance.new("TextButton", PlayerTab)
speedBtn.Size = UDim2.new(0,320,0,40)
speedBtn.Text = "TELEPORT SPEED : OFF"
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextColor3 = Color3.new(1,1,1)
speedBtn.BackgroundColor3 = Color3.fromRGB(140,180,255)
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.speedOn = not getgenv().STATE.speedOn
	speedBtn.Text = getgenv().STATE.speedOn and "TELEPORT SPEED : ON" or "TELEPORT SPEED : OFF"
end)

RunService.RenderStepped:Connect(function()
	if getgenv().STATE.speedOn then
		local char = player.Character
		local hum = char and char:FindFirstChild("Humanoid")
		if hum and hum.MoveDirection.Magnitude > 0 then
			hum.WalkSpeed = getgenv().STATE.speed
		end
	end
end)

-- ESP CORE
local function addESP(model,color,name)
	if model:FindFirstChild(name) then return end
	local h = Instance.new("Highlight")
	h.Name = name
	h.FillColor = color
	h.OutlineColor = color
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = model
end

task.spawn(function()
	while task.wait(1) do
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				local n = v.Name:lower()
				if getgenv().STATE.espPlayer and n:find("surviv") then
					addESP(v,Color3.fromRGB(0,255,0),"SLK_PLAYER_ESP")
				end
				if getgenv().STATE.espGen and (n:find("gen") or n:find("generator")) then
					addESP(v,Color3.fromRGB(255,255,0),"SLK_GEN_ESP")
				end
			end
		end
	end
end)

--==================================================
-- SETTINGS TAB : SHOW CHAT
--==================================================
local chatBtn = Instance.new("TextButton", SettingsTab)
chatBtn.Size = UDim2.new(0,320,0,40)
chatBtn.Text = "SHOW CHAT IN MATCH : OFF"
chatBtn.Font = Enum.Font.GothamBold
chatBtn.TextColor3 = Color3.new(1,1,1)
chatBtn.BackgroundColor3 = Color3.fromRGB(180,120,255)
Instance.new("UICorner", chatBtn)

local function forceChat(state)
	pcall(function()
		TextChatService.ChatVersion = Enum.ChatVersion.TextChatService
		local chatGui = player.PlayerGui:FindFirstChild("Chat")
		if chatGui then chatGui.Enabled = state end
	end)
end

chatBtn.MouseButton1Click:Connect(function()
	getgenv().STATE.showChat = not getgenv().STATE.showChat
	forceChat(getgenv().STATE.showChat)
	chatBtn.Text = getgenv().STATE.showChat and
		"SHOW CHAT IN MATCH : ON" or "SHOW CHAT IN MATCH : OFF"
end)

print("SLK GAMING HUB FULL LOADED")
