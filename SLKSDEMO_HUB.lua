-- SLKS GAMING HUB | FORSAKEN FIX
-- Alive after death / teleport

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- chống load trùng
if getgenv().SLKS_HUB then return end
getgenv().SLKS_HUB = true

-------------------------------------------------
-- GUI
-------------------------------------------------
local Gui = Instance.new("ScreenGui")
Gui.Name = "SLKS_HUB"
Gui.ResetOnSpawn = false
Gui.Parent = player.PlayerGui

local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,450,0,300)
Menu.Position = UDim2.new(0.5,-225,0.5,-150)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.25
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,45)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING HUB | FORSAKEN"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

-- buttons
local function topBtn(txt,x,color)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,30,0,30)
	b.Position = UDim2.new(1,x,0,8)
	b.Text = txt
	b.Font = Enum.Font.Code
	b.TextSize = 18
	b.BackgroundColor3 = color
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	return b
end

local minBtn = topBtn("-", -70, Color3.fromRGB(40,40,40))
local closeBtn = topBtn("X", -35, Color3.fromRGB(80,30,30))

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs = {}
local pages = {}

local function makeTab(name,x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,120,0,30)
	b.Position = UDim2.new(0,x,0,55)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(0,255,140)
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = makeTab("MAIN",15)
tabs.Info = makeTab("INFO",145)

local function makePage()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-30,1,-100)
	f.Position = UDim2.new(0,15,0,95)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = makePage()
pages.Info = makePage()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end

switch("Main")
tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)

-------------------------------------------------
-- TELEPORT SPEED (CHUẨN: CHỈ NHANH KHI BẠN ĐI)
-------------------------------------------------
local speed = 16
local speedOn = false

local speedLabel = Instance.new("TextLabel", pages.Main)
speedLabel.Size = UDim2.new(1,0,0,30)
speedLabel.Text = "Teleport Speed: 16"
speedLabel.Font = Enum.Font.Code
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.BackgroundTransparency = 1

local slider = Instance.new("TextButton", pages.Main)
slider.Position = UDim2.new(0,0,0,35)
slider.Size = UDim2.new(1,0,0,20)
slider.Text = "KÉO ĐỂ CHỈNH TỐC ĐỘ"
slider.Font = Enum.Font.Code
slider.BackgroundColor3 = Color3.fromRGB(35,35,35)

slider.MouseButton1Down:Connect(function()
	local move
	move = RunService.RenderStepped:Connect(function()
		local x = math.clamp(
			(game:GetService("UserInputService"):GetMouseLocation().X - slider.AbsolutePosition.X)
			/ slider.AbsoluteSize.X, 0, 1)
		speed = math.floor(1 + x*50)
		speedLabel.Text = "Teleport Speed: "..speed
	end)
	game:GetService("UserInputService").InputEnded:Wait()
	move:Disconnect()
end)

local toggle = Instance.new("TextButton", pages.Main)
toggle.Position = UDim2.new(0,0,0,65)
toggle.Size = UDim2.new(0,150,0,30)
toggle.Text = "SPEED : OFF"
toggle.BackgroundColor3 = Color3.fromRGB(80,30,30)

toggle.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	toggle.Text = speedOn and "SPEED : ON" or "SPEED : OFF"
end)

RunService.RenderStepped:Connect(function()
	if speedOn then
		local char = player.Character
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid.WalkSpeed = speed
		end
	end
end)

-------------------------------------------------
-- ESP (KILLER + SURVIVAL + GEN)
-------------------------------------------------
local function addESP(model,color)
	if model:FindFirstChild("SLKS_ESP") then return end
	local h = Instance.new("Highlight")
	h.Name = "SLKS_ESP"
	h.FillColor = color
	h.OutlineColor = color
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = model
end

task.spawn(function()
	while task.wait(1) do
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				if v.Name:lower():find("killer") then
					addESP(v, Color3.fromRGB(255,0,0))
				elseif v.Name:lower():find("surviv") then
					addESP(v, Color3.fromRGB(0,255,0))
				elseif v.Name:lower():find("generator") then
					addESP(v, Color3.fromRGB(255,255,0))
				end
			end
		end
	end
end)

-------------------------------------------------
-- INFO
-------------------------------------------------
local info = Instance.new("TextLabel", pages.Info)
info.Size = UDim2.new(1,0,1,0)
info.TextWrapped = true
info.Text = "SLKS GAMING HUB\nForsaken Fix Version\n\nTeleport Speed + ESP\nAlive after death"
info.Font = Enum.Font.Code
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1

-------------------------------------------------
-- MIN / CLOSE
-------------------------------------------------
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _,v in pairs(Menu:GetChildren()) do
		if v:IsA("GuiObject") and v ~= header and v ~= minBtn and v ~= closeBtn then
			v.Visible = not minimized
		end
	end
	Menu.Size = minimized and UDim2.new(0,450,0,45) or UDim2.new(0,450,0,300)
end)

closeBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
	getgenv().SLKS_HUB = false
end)
