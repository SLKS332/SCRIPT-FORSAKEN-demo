-- SLK GAMING HUB | FULL BASE TEST

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

if getgenv().SLK_HUB then return end
getgenv().SLK_HUB = true

--------------------------------------------------
-- STATE
--------------------------------------------------
getgenv().SLK_STATE = {
	speedOn = false,
	speedValue = 16,
	espPlayer = false,
	autoFixGen = false,
	fixDelay = 0
}

--------------------------------------------------
-- GUI ROOT
--------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_GAMING_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- LOADING
--------------------------------------------------
local load = Instance.new("TextLabel", gui)
load.Size = UDim2.new(0,300,0,120)
load.Position = UDim2.new(0.5,-150,0.5,-60)
load.BackgroundColor3 = Color3.fromRGB(255,170,200)
load.TextColor3 = Color3.new(1,1,1)
load.Font = Enum.Font.Code
load.TextSize = 18
load.Text = "SLK GAMING HUB\nLoading 0%"
Instance.new("UICorner", load)

for i=0,100,10 do
	load.Text = "SLK GAMING HUB\nLoading "..i.."%"
	task.wait(0.08)
end
load:Destroy()

--------------------------------------------------
-- MENU
--------------------------------------------------
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0,460,0,320)
menu.Position = UDim2.new(0.5,-230,0.5,-160)
menu.BackgroundColor3 = Color3.fromRGB(255,150,190)
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SLK GAMING HUB 💗"
title.Font = Enum.Font.Code
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

--------------------------------------------------
-- TABS
--------------------------------------------------
local tabs = {}
local pages = {}

local function makeTab(name,x)
	local b = Instance.new("TextButton", menu)
	b.Size = UDim2.new(0,120,0,30)
	b.Position = UDim2.new(0,x,0,45)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(255,110,160)
	Instance.new("UICorner", b)
	return b
end

tabs.Player = makeTab("PLAYER",20)
tabs.Farm = makeTab("FARM",160)

local function makePage()
	local f = Instance.new("Frame", menu)
	f.Size = UDim2.new(1,-20,1,-90)
	f.Position = UDim2.new(0,10,0,80)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Player = makePage()
pages.Farm = makePage()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end

switch("Player")
tabs.Player.MouseButton1Click:Connect(function() switch("Player") end)
tabs.Farm.MouseButton1Click:Connect(function() switch("Farm") end)

--------------------------------------------------
-- PLAYER TAB
--------------------------------------------------
local p = pages.Player

local spLabel = Instance.new("TextLabel", p)
spLabel.Size = UDim2.new(1,0,0,25)
spLabel.BackgroundTransparency = 1
spLabel.Text = "Teleport Speed: 16"
spLabel.Font = Enum.Font.Code
spLabel.TextColor3 = Color3.new(1,1,1)

local spSlider = Instance.new("TextButton", p)
spSlider.Position = UDim2.new(0,0,0,30)
spSlider.Size = UDim2.new(1,0,0,20)
spSlider.Text = "SPEED 0 - 50"
spSlider.BackgroundColor3 = Color3.fromRGB(255,120,160)
Instance.new("UICorner", spSlider)

spSlider.MouseButton1Down:Connect(function()
	local c
	c = RunService.RenderStepped:Connect(function()
		local x = math.clamp((UIS:GetMouseLocation().X - spSlider.AbsolutePosition.X) / spSlider.AbsoluteSize.X,0,1)
		local v = math.floor(x*50)
		getgenv().SLK_STATE.speedValue = v
		spLabel.Text = "Teleport Speed: "..v
	end)
	UIS.InputEnded:Wait()
	c:Disconnect()
end)

local spBtn = Instance.new("TextButton", p)
spBtn.Position = UDim2.new(0,0,0,60)
spBtn.Size = UDim2.new(0,220,0,30)
spBtn.Text = "TELEPORT SPEED : OFF"
spBtn.BackgroundColor3 = Color3.fromRGB(255,90,130)
Instance.new("UICorner", spBtn)

spBtn.MouseButton1Click:Connect(function()
	local st = getgenv().SLK_STATE
	st.speedOn = not st.speedOn
	spBtn.Text = st.speedOn and "TELEPORT SPEED : ON" or "TELEPORT SPEED : OFF"
end)

local espBtn = Instance.new("TextButton", p)
espBtn.Position = UDim2.new(0,0,0,100)
espBtn.Size = UDim2.new(0,220,0,30)
espBtn.Text = "ESP PLAYER : OFF"
espBtn.BackgroundColor3 = Color3.fromRGB(120,255,120)
Instance.new("UICorner", espBtn)

espBtn.MouseButton1Click:Connect(function()
	local st = getgenv().SLK_STATE
	st.espPlayer = not st.espPlayer
	espBtn.Text = st.espPlayer and "ESP PLAYER : ON" or "ESP PLAYER : OFF"
end)

--------------------------------------------------
-- FARM TAB
--------------------------------------------------
local f = pages.Farm

local dLabel = Instance.new("TextLabel", f)
dLabel.Size = UDim2.new(1,0,0,25)
dLabel.BackgroundTransparency = 1
dLabel.Text = "Delay: 0"
dLabel.Font = Enum.Font.Code
dLabel.TextColor3 = Color3.new(1,1,1)

local dSlider = Instance.new("TextButton", f)
dSlider.Position = UDim2.new(0,0,0,30)
dSlider.Size = UDim2.new(1,0,0,20)
dSlider.Text = "DELAY 0 - 10"
dSlider.BackgroundColor3 = Color3.fromRGB(255,120,160)
Instance.new("UICorner", dSlider)

dSlider.MouseButton1Down:Connect(function()
	local c
	c = RunService.RenderStepped:Connect(function()
		local x = math.clamp((UIS:GetMouseLocation().X - dSlider.AbsolutePosition.X) / dSlider.AbsoluteSize.X,0,1)
		local v = math.floor(x*10)
		getgenv().SLK_STATE.fixDelay = v
		dLabel.Text = "Delay: "..v
	end)
	UIS.InputEnded:Wait()
	c:Disconnect()
end)

local fixBtn = Instance.new("TextButton", f)
fixBtn.Position = UDim2.new(0,0,0,60)
fixBtn.Size = UDim2.new(0,220,0,30)
fixBtn.Text = "AUTO FIX GEN : OFF"
fixBtn.BackgroundColor3 = Color3.fromRGB(255,90,130)
Instance.new("UICorner", fixBtn)

fixBtn.MouseButton1Click:Connect(function()
	local st = getgenv().SLK_STATE
	st.autoFixGen = not st.autoFixGen
	fixBtn.Text = st.autoFixGen and "AUTO FIX GEN : ON" or "AUTO FIX GEN : OFF"
end)

--------------------------------------------------
-- CORE SPEED
--------------------------------------------------
RunService.RenderStepped:Connect(function()
	local st = getgenv().SLK_STATE
	if not st.speedOn then return end
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	if hum.MoveDirection.Magnitude > 0 then
		hum.WalkSpeed = st.speedValue
	else
		hum.WalkSpeed = 16
	end
end)

--------------------------------------------------
-- CORE ESP PLAYER
--------------------------------------------------
task.spawn(function()
	while task.wait(1) do
		for _,plr in ipairs(Players:GetPlayers()) do
			if plr ~= player and plr.Character and plr.Character:FindFirstChild("Humanoid") then
				local char = plr.Character
				local esp = char:FindFirstChild("SLK_ESP")
				if getgenv().SLK_STATE.espPlayer then
					if not esp then
						local h = Instance.new("Highlight")
						h.Name = "SLK_ESP"
						h.FillColor = Color3.fromRGB(0,255,0)
						h.OutlineColor = Color3.fromRGB(0,255,0)
						h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						h.Parent = char
					end
				else
					if esp then esp:Destroy() end
				end
			end
		end
	end
end)

--------------------------------------------------
-- CORE AUTO FIX GEN (PROMPT)
--------------------------------------------------
task.spawn(function()
	while task.wait(0.2) do
		if not getgenv().SLK_STATE.autoFixGen then continue end
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("ProximityPrompt") and v.ActionText and v.ActionText:lower():find("repair") then
				task.wait(getgenv().SLK_STATE.fixDelay)
				pcall(function()
					fireproximityprompt(v)
				end)
			end
		end
	end
end)
