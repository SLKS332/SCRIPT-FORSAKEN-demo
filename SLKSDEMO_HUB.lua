-- SLKS GAMING HUB | FORSAKEN | FINAL FULL FIX
-- COPY → EXEC → KHÔNG MẤT HUB KHI CHẾT / VÀO TRẬN

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- chống exec trùng
if getgenv().SLKS_FINAL then return end
getgenv().SLKS_FINAL = true

-- lưu trạng thái
getgenv().SLKS_STATE = getgenv().SLKS_STATE or {
	speed = 16,
	speedOn = false
}

-------------------------------------------------
-- LOADING
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui", player.PlayerGui)
LoadingGui.ResetOnSpawn = false

local loadFrame = Instance.new("Frame", LoadingGui)
loadFrame.Size = UDim2.new(0,300,0,120)
loadFrame.Position = UDim2.new(0.5,-150,0.5,-60)
loadFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
loadFrame.BackgroundTransparency = 0.2
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,14)

local loadText = Instance.new("TextLabel", loadFrame)
loadText.Size = UDim2.new(1,0,1,0)
loadText.BackgroundTransparency = 1
loadText.Text = "SLKS GAMING HUB\nLoading..."
loadText.Font = Enum.Font.Code
loadText.TextSize = 18
loadText.TextColor3 = Color3.fromRGB(0,255,140)

task.wait(1.5)
LoadingGui:Destroy()

-------------------------------------------------
-- GUI
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.Name = "SLKS_HUB"
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,520,0,330)
Main.Position = UDim2.new(0.5,-260,0.5,-165)
Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main.BackgroundTransparency = 0.25
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

local stroke = Instance.new("UIStroke", Main)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local title = Instance.new("TextLabel", Main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "SLKS GAMING HUB | FORSAKEN"
title.Font = Enum.Font.Code
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(0,255,140)

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs = {}
local pages = {}

local function newTab(name,x)
	local b = Instance.new("TextButton", Main)
	b.Size = UDim2.new(0,150,0,32)
	b.Position = UDim2.new(0,x,0,50)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.fromRGB(0,255,140)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = newTab("MAIN",20)
tabs.Info = newTab("INFO",185)
tabs.Settings = newTab("SETTINGS",350)

local function newPage()
	local f = Instance.new("Frame", Main)
	f.Size = UDim2.new(1,-40,1,-110)
	f.Position = UDim2.new(0,20,0,90)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = newPage()
pages.Info = newPage()
pages.Settings = newPage()

local function switch(tab)
	for _,p in pairs(pages) do p.Visible = false end
	pages[tab].Visible = true
end
switch("Main")

tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)
tabs.Settings.MouseButton1Click:Connect(function() switch("Settings") end)

-------------------------------------------------
-- TELEPORT SPEED (CHUẨN)
-------------------------------------------------
local speedLabel = Instance.new("TextLabel", pages.Main)
speedLabel.Size = UDim2.new(1,0,0,30)
speedLabel.Text = "Speed: "..getgenv().SLKS_STATE.speed
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font = Enum.Font.Code

local toggle = Instance.new("TextButton", pages.Main)
toggle.Position = UDim2.new(0,0,0,40)
toggle.Size = UDim2.new(0,220,0,35)
toggle.Text = "Teleport Speed: OFF"
toggle.BackgroundColor3 = Color3.fromRGB(80,30,30)
toggle.Font = Enum.Font.Code
Instance.new("UICorner", toggle)

toggle.MouseButton1Click:Connect(function()
	getgenv().SLKS_STATE.speedOn = not getgenv().SLKS_STATE.speedOn
	toggle.Text = getgenv().SLKS_STATE.speedOn and "Teleport Speed: ON" or "Teleport Speed: OFF"
end)

-------------------------------------------------
-- SPEED CORE (KHÔNG AUTO ĐI)
-------------------------------------------------
local function apply(char)
	local hum = char:WaitForChild("Humanoid")
	RunService.RenderStepped:Connect(function()
		if getgenv().SLKS_STATE.speedOn and hum.MoveDirection.Magnitude > 0 then
			hum.WalkSpeed = getgenv().SLKS_STATE.speed
		else
			hum.WalkSpeed = 16
		end
	end)
end

if player.Character then apply(player.Character) end
player.CharacterAdded:Connect(function(c) task.wait(0.5) apply(c) end)

-------------------------------------------------
-- ESP (AUTO GẮN LẠI)
-------------------------------------------------
local function esp(m,c)
	if m:FindFirstChild("SLKS_ESP") then return end
	local h = Instance.new("Highlight", m)
	h.Name = "SLKS_ESP"
	h.FillColor = c
	h.OutlineColor = c
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

task.spawn(function()
	while task.wait(1) do
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				local n = v.Name:lower()
				if n:find("killer") then esp(v,Color3.fromRGB(255,0,0))
				elseif n:find("surviv") then esp(v,Color3.fromRGB(0,255,0))
				elseif n:find("gen") then esp(v,Color3.fromRGB(255,255,0))
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
info.BackgroundTransparency = 1
info.Font = Enum.Font.Code
info.TextColor3 = Color3.new(1,1,1)
info.Text = "SLKS GAMING HUB\nFINAL VERSION\n\n✔ Chết không mất hub\n✔ Vào trận không mất\n✔ ESP + Speed"

-------------------------------------------------
-- SETTINGS
-------------------------------------------------
local set = Instance.new("TextLabel", pages.Settings)
set.Size = UDim2.new(1,0,1,0)
set.BackgroundTransparency = 1
set.TextColor3 = Color3.new(1,1,1)
set.Font = Enum.Font.Code
set.Text = "Không cần chỉnh gì thêm.\nHub tự sống."
