-- SLK GAMING | FORSAKEN HUB (PINK CUTE)
-- Loading + Menu + FARM Auto Fix Gen + Auto Move
-- Hub không mất khi chết / vào trận

-- ===== RESET DUPLICATE =====
if getgenv().SLK_HUB_LOADED then return end
getgenv().SLK_HUB_LOADED = true

-- ===== SERVICES =====
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ===== STATE (LƯU TRẠNG THÁI) =====
getgenv().SLK_STATE = getgenv().SLK_STATE or {
	autoFixGen = false,
	autoMoveGen = false,
	fixDelay = 0
}

-- ===== GUI ROOT =====
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_GAMING_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- 🔄 LOADING
--------------------------------------------------
local loading = Instance.new("Frame", gui)
loading.Size = UDim2.new(0,300,0,120)
loading.Position = UDim2.new(0.5,-150,0.5,-60)
loading.BackgroundColor3 = Color3.fromRGB(255,182,193)
Instance.new("UICorner", loading).CornerRadius = UDim.new(0,20)

local loadText = Instance.new("TextLabel", loading)
loadText.Size = UDim2.new(1,0,1,0)
loadText.BackgroundTransparency = 1
loadText.Font = Enum.Font.Code
loadText.TextSize = 18
loadText.TextColor3 = Color3.new(1,1,1)
loadText.Text = "SLK GAMING HUB\nLoading 0%"

for i=1,100 do
	loadText.Text = "SLK GAMING HUB\nLoading "..i.."%"
	task.wait(0.015)
end
loading:Destroy()

--------------------------------------------------
-- 🌸 MENU
--------------------------------------------------
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0,500,0,330)
menu.Position = UDim2.new(0.5,-250,0.5,-165)
menu.BackgroundColor3 = Color3.fromRGB(255,182,193)
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,22)

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SLK GAMING HUB | FORSAKEN"
title.Font = Enum.Font.Code
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)

-- Close
local close = Instance.new("TextButton", menu)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-40,0,5)
close.Text = "X"
close.Font = Enum.Font.Code
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(255,105,180)
Instance.new("UICorner", close)
close.MouseButton1Click:Connect(function()
	menu:Destroy()
	getgenv().SLK_HUB_LOADED = false
end)

--------------------------------------------------
-- 📑 TABS
--------------------------------------------------
local tabs = {}
local pages = {}

local function newTab(name, x)
	local b = Instance.new("TextButton", menu)
	b.Size = UDim2.new(0,100,0,30)
	b.Position = UDim2.new(0,x,0,45)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(255,105,180)
	Instance.new("UICorner", b)
	return b
end

tabs.Info = newTab("INFO", 20)
tabs.Farm = newTab("FARM", 140)
tabs.Player = newTab("PLAYER", 260)
tabs.Settings = newTab("SETTINGS", 380)

local function newPage()
	local f = Instance.new("Frame", menu)
	f.Size = UDim2.new(1,-40,1,-90)
	f.Position = UDim2.new(0,20,0,80)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Info = newPage()
pages.Farm = newPage()
pages.Player = newPage()
pages.Settings = newPage()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end
switch("Farm")

tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
tabs.Farm.MouseButton1Click:Connect(function() switch("Farm") end)
tabs.Player.MouseButton1Click:Connect(function() switch("Player") end)
tabs.Settings.MouseButton1Click:Connect(function() switch("Settings") end)

--------------------------------------------------
-- 🌾 FARM TAB (AUTO FIX GEN + AUTO MOVE)
--------------------------------------------------
local farm = pages.Farm

local delayLabel = Instance.new("TextLabel", farm)
delayLabel.Size = UDim2.new(1,0,0,25)
delayLabel.Text = "Fix Delay: 0s"
delayLabel.BackgroundTransparency = 1
delayLabel.Font = Enum.Font.Code
delayLabel.TextColor3 = Color3.new(1,1,1)

local slider = Instance.new("TextButton", farm)
slider.Position = UDim2.new(0,0,0,30)
slider.Size = UDim2.new(1,0,0,20)
slider.Text = "KÉO ĐỂ CHỈNH DELAY (0-10s)"
slider.BackgroundColor3 = Color3.fromRGB(255,105,180)

slider.MouseButton1Down:Connect(function()
	local conn
	conn = RunService.RenderStepped:Connect(function()
		local x = math.clamp((UIS:GetMouseLocation().X - slider.AbsolutePosition.X)/slider.AbsoluteSize.X,0,1)
		local v = math.floor(x*10)
		getgenv().SLK_STATE.fixDelay = v
		delayLabel.Text = "Fix Delay: "..v.."s"
	end)
	UIS.InputEnded:Wait()
	conn:Disconnect()
end)

local fixBtn = Instance.new("TextButton", farm)
fixBtn.Position = UDim2.new(0,0,0,60)
fixBtn.Size = UDim2.new(0,220,0,30)
fixBtn.Text = "AUTO FIX GEN : OFF"
fixBtn.BackgroundColor3 = Color3.fromRGB(255,105,180)
Instance.new("UICorner", fixBtn)

fixBtn.MouseButton1Click:Connect(function()
	local st = getgenv().SLK_STATE
	st.autoFixGen = not st.autoFixGen
	fixBtn.Text = st.autoFixGen and "AUTO FIX GEN : ON" or "AUTO FIX GEN : OFF"
end)

local moveBtn = Instance.new("TextButton", farm)
moveBtn.Position = UDim2.new(0,0,0,100)
moveBtn.Size = UDim2.new(0,220,0,30)
moveBtn.Text = "AUTO MOVE TO GEN : OFF"
moveBtn.BackgroundColor3 = Color3.fromRGB(255,105,180)
Instance.new("UICorner", moveBtn)

moveBtn.MouseButton1Click:Connect(function()
	local st = getgenv().SLK_STATE
	st.autoMoveGen = not st.autoMoveGen
	moveBtn.Text = st.autoMoveGen and "AUTO MOVE TO GEN : ON" or "AUTO MOVE TO GEN : OFF"
end)

--------------------------------------------------
-- ⚙️ AUTO MOVE CORE
--------------------------------------------------
local function getNearestGen()
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local near, dist = nil, math.huge
	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v.Name:lower():find("gen") and v.PrimaryPart then
			local d = (hrp.Position - v.PrimaryPart.Position).Magnitude
			if d < dist then
				dist = d
				near = v
			end
		end
	end
	return near
end

task.spawn(function()
	while task.wait(1) do
		local st = getgenv().SLK_STATE
		if st.autoFixGen and st.autoMoveGen then
			local gen = getNearestGen()
			local char = player.Character
			if gen and char and char:FindFirstChild("HumanoidRootPart") then
				local hrp = char.HumanoidRootPart
				TweenService:Create(
					hrp,
					TweenInfo.new(2),
					{CFrame = gen.PrimaryPart.CFrame * CFrame.new(0,0,-3)}
				):Play()
			end
		end
	end
end)
