-- SLKS GAMING HUB | FORSAKEN | FINAL FULL VERSION
-- COPY -> EXEC -> DONE

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- chống exec trùng
if getgenv().SLKS_FINAL then return end
getgenv().SLKS_FINAL = true

-- lưu trạng thái
getgenv().SLKS_STATE = getgenv().SLKS_STATE or {
	speedOn = false,
	speed = 16
}

-------------------------------------------------
-- LOADING
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui", player.PlayerGui)
LoadingGui.ResetOnSpawn = false

local bg = Instance.new("Frame", LoadingGui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(5,10,15)

local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,360,0,180)
box.Position = UDim2.new(0.5,-180,0.5,-90)
box.BackgroundColor3 = Color3.fromRGB(15,25,35)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,20)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING HUB"
title.Font = Enum.Font.Code
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(0,255,140)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,20)
percent.Position = UDim2.new(0,0,1,-40)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Code
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(0,255,140)

for i=1,100 do
	percent.Text = "Loading "..i.."%"
	task.wait(0.02)
end

LoadingGui:Destroy()

-------------------------------------------------
-- GUI
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.Name = "SLKS_HUB"
Gui.ResetOnSpawn = false

local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,460,0,320)
Menu.Position = UDim2.new(0.5,-230,0.5,-160)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.25
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

Instance.new("UIStroke", Menu).Color = Color3.fromRGB(0,255,140)

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,45)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING HUB | FORSAKEN"
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs = {}
local pages = {}

local function tabBtn(text,x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,130,0,30)
	b.Position = UDim2.new(0,x,0,55)
	b.Text = text
	b.Font = Enum.Font.Code
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.fromRGB(0,255,140)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = tabBtn("MAIN",15)
tabs.Info = tabBtn("INFO",155)
tabs.Set = tabBtn("SETTINGS",295)

local function page()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-30,1,-100)
	f.Position = UDim2.new(0,15,0,95)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = page()
pages.Info = page()
pages.Set = page()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end

switch("Main")
tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
tabs.Set.MouseButton1Click:Connect(function() switch("Set") end)

-------------------------------------------------
-- TELEPORT SPEED (CHUẨN)
-------------------------------------------------
local speedLabel = Instance.new("TextButton", pages.Main)
speedLabel.Size = UDim2.new(0,200,0,35)
speedLabel.Text = "Speed: "..getgenv().SLKS_STATE.speed
speedLabel.Font = Enum.Font.Code

speedLabel.MouseButton1Click:Connect(function()
	getgenv().SLKS_STATE.speed += 4
	if getgenv().SLKS_STATE.speed > 80 then
		getgenv().SLKS_STATE.speed = 16
	end
	speedLabel.Text = "Speed: "..getgenv().SLKS_STATE.speed
end)

local toggle = Instance.new("TextButton", pages.Main)
toggle.Position = UDim2.new(0,0,0,45)
toggle.Size = UDim2.new(0,200,0,35)
toggle.Text = getgenv().SLKS_STATE.speedOn and "Teleport Speed: ON" or "Teleport Speed: OFF"
toggle.Font = Enum.Font.Code

toggle.MouseButton1Click:Connect(function()
	getgenv().SLKS_STATE.speedOn = not getgenv().SLKS_STATE.speedOn
	toggle.Text = getgenv().SLKS_STATE.speedOn and "Teleport Speed: ON" or "Teleport Speed: OFF"
end)

-------------------------------------------------
-- SPEED CORE (GIỮ SAU KHI CHẾT)
-------------------------------------------------
local function hookChar(char)
	local hum = char:WaitForChild("Humanoid")
	RunService.RenderStepped:Connect(function()
		if getgenv().SLKS_STATE.speedOn and hum.MoveDirection.Magnitude > 0 then
			hum.WalkSpeed = getgenv().SLKS_STATE.speed
		else
			hum.WalkSpeed = 16
		end
	end)
end

if player.Character then hookChar(player.Character) end
player.CharacterAdded:Connect(hookChar)

-------------------------------------------------
-- ESP CORE (AUTO GẮN)
-------------------------------------------------
local function esp(model,color)
	if model:FindFirstChild("SLKS_ESP") then return end
	local h = Instance.new("Highlight")
	h.Name = "SLKS_ESP"
	h.FillColor = color
	h.OutlineColor = color
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = model
end

task.spawn(function()
	while true do
		task.wait(1)
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				local n = v.Name:lower()
				if n:find("killer") then
					esp(v,Color3.fromRGB(255,0,0))
				elseif n:find("surviv") then
					esp(v,Color3.fromRGB(0,255,0))
				elseif n:find("gen") then
					esp(v,Color3.fromRGB(255,255,0))
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
info.Text = "SLKS GAMING HUB\nFinal Version\n\nChết / Vào trận KHÔNG mất hub\nTeleport Speed + ESP"
info.Font = Enum.Font.Code
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1
