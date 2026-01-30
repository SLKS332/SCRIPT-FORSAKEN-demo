-- SLKS GAMING HUB | FULL FIX | NO RESET | ESP + TELEPORT SPEED

if getgenv().SLKS_LOADED then return end
getgenv().SLKS_LOADED = true

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

------------------------------------------------
-- GUI (COREGUI - KHÔNG MẤT KHI CHẾT)
------------------------------------------------
local Gui = Instance.new("ScreenGui")
Gui.Name = "SLKS_HUB"
Gui.ResetOnSpawn = false
Gui.Parent = CoreGui

------------------------------------------------
-- MAIN FRAME
------------------------------------------------
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,420,0,280)
Main.Position = UDim2.new(0.5,-210,0.5,-140)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local title = Instance.new("TextLabel", Main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "SLKS GAMING HUB | FULL"
title.TextColor3 = Color3.fromRGB(0,255,150)
title.Font = Enum.Font.Code
title.TextSize = 18
title.BackgroundTransparency = 1

------------------------------------------------
-- VARIABLES
------------------------------------------------
local tpSpeed = 3
local tpOn = false
local espOn = false
local connections = {}
local espCache = {}

------------------------------------------------
-- TELEPORT SPEED (ĐÚNG KIỂU BẠN MUỐN)
------------------------------------------------
RunService.RenderStepped:Connect(function()
	if not tpOn then return end
	local char = LP.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local dir = Vector3.zero
	if UIS:IsKeyDown(Enum.KeyCode.W) then dir += hrp.CFrame.LookVector end
	if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= hrp.CFrame.LookVector end
	if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= hrp.CFrame.RightVector end
	if UIS:IsKeyDown(Enum.KeyCode.D) then dir += hrp.CFrame.RightVector end

	if dir.Magnitude > 0 then
		hrp.CFrame = hrp.CFrame + dir.Unit * tpSpeed
	end
end)

------------------------------------------------
-- BUTTON: TELEPORT SPEED
------------------------------------------------
local tpBtn = Instance.new("TextButton", Main)
tpBtn.Position = UDim2.new(0,20,0,60)
tpBtn.Size = UDim2.new(0,180,0,35)
tpBtn.Text = "TELEPORT SPEED : OFF"
tpBtn.Font = Enum.Font.Code
tpBtn.TextSize = 14
tpBtn.BackgroundColor3 = Color3.fromRGB(60,30,30)
tpBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", tpBtn)

tpBtn.MouseButton1Click:Connect(function()
	tpOn = not tpOn
	tpBtn.Text = tpOn and "TELEPORT SPEED : ON" or "TELEPORT SPEED : OFF"
end)

------------------------------------------------
-- SPEED VALUE BUTTON (BẤM LÀ TĂNG)
------------------------------------------------
local speedBtn = Instance.new("TextButton", Main)
speedBtn.Position = UDim2.new(0,220,0,60)
speedBtn.Size = UDim2.new(0,160,0,35)
speedBtn.Text = "SPEED : 3"
speedBtn.Font = Enum.Font.Code
speedBtn.TextSize = 14
speedBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
speedBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	tpSpeed += 2
	if tpSpeed > 20 then tpSpeed = 3 end
	speedBtn.Text = "SPEED : "..tpSpeed
end)

------------------------------------------------
-- ESP FUNCTION
------------------------------------------------
local function clearESP()
	for _,v in pairs(espCache) do
		if v then v:Destroy() end
	end
	espCache = {}
end

local function createESP(char)
	if not char:FindFirstChild("HumanoidRootPart") then return end
	local hl = Instance.new("Highlight")
	hl.FillTransparency = 0.6
	hl.OutlineColor = Color3.fromRGB(255,0,0)
	hl.Parent = char
	table.insert(espCache, hl)
end

local function loadESP()
	clearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LP and plr.Character then
			createESP(plr.Character)
		end
	end
end

Players.PlayerAdded:Connect(loadESP)
Players.PlayerRemoving:Connect(loadESP)
LP.CharacterAdded:Connect(function()
	task.wait(1)
	if espOn then loadESP() end
end)

------------------------------------------------
-- ESP BUTTON
------------------------------------------------
local espBtn = Instance.new("TextButton", Main)
espBtn.Position = UDim2.new(0,20,0,110)
espBtn.Size = UDim2.new(0,180,0,35)
espBtn.Text = "ESP : OFF"
espBtn.Font = Enum.Font.Code
espBtn.TextSize = 14
espBtn.BackgroundColor3 = Color3.fromRGB(60,30,30)
espBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", espBtn)

espBtn.MouseButton1Click:Connect(function()
	espOn = not espOn
	espBtn.Text = espOn and "ESP : ON" or "ESP : OFF"
	if espOn then loadESP() else clearESP() end
end)

------------------------------------------------
-- INFO
------------------------------------------------
local info = Instance.new("TextLabel", Main)
info.Position = UDim2.new(0,20,0,170)
info.Size = UDim2.new(1,-40,0,90)
info.TextWrapped = true
info.Text = "✔ Hub KHÔNG MẤT khi chết / vào trận\n✔ Teleport Speed chuẩn\n✔ ESP tự load lại\nSLKS GAMING HUB"
info.Font = Enum.Font.Code
info.TextColor3 = Color3.fromRGB(200,200,200)
info.BackgroundTransparency = 1
