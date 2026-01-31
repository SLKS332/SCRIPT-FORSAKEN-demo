--// SLK HUB - WHITE VERSION v1.2 (ESP FIXED)
--// By SLK GAMING

---------------- SERVICES ----------------
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-------------- ANTI DUPLICATE ------------
if game.CoreGui:FindFirstChild("SLK_HUB") then
	game.CoreGui.SLK_HUB:Destroy()
end

---------------- GUI ---------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false

---------------- MAIN --------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(240,240,240)
TopBar.BackgroundTransparency = 0.1
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-200,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White Version"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(60,60,60)

-- Minimize
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-74,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(220,220,220)
Min.TextColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-36,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(180,60,60)
Close.BackgroundColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

---------------- CONTENT -----------------
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

---------------- INFO --------------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(70,70,70)

local INFO_TEXT = [[WELCOME TO SLK HUB 🤍

SCRIPT STATUS: WORKING ✅
ESP STATUS: STABLE
VERSION: v1.2

Thank you for using SLK HUB
YouTube: SLK GAMING]]

Info.Text = INFO_TEXT

---------------- ESP SYSTEM ----------------
local ESP_ENABLED = false
local ESP_CACHE = {}

local function clearESP()
	for _,v in pairs(ESP_CACHE) do
		if v then v:Destroy() end
	end
	ESP_CACHE = {}
end

local function addESP(plr)
	if plr == LocalPlayer then return end

	local function onChar(char)
		local hum = char:WaitForChild("Humanoid",5)
		local root = char:WaitForChild("HumanoidRootPart",5)
		if not hum or not root then return end
		if hum.Health <= 0 then return end

		local box = Instance.new("Highlight")
		box.FillColor = Color3.new(1,1,1)
		box.OutlineColor = Color3.new(1,1,1)
		box.FillTransparency = 0.6
		box.OutlineTransparency = 0
		box.Adornee = char
		box.Parent = gui

		ESP_CACHE[plr] = box

		hum.Died:Connect(function()
			if ESP_CACHE[plr] then
				ESP_CACHE[plr]:Destroy()
				ESP_CACHE[plr] = nil
			end
		end)
	end

	if plr.Character then
		onChar(plr.Character)
	end
	plr.CharacterAdded:Connect(onChar)
end

local function enableESP()
	clearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		addESP(plr)
	end
end

Players.PlayerAdded:Connect(function(plr)
	if ESP_ENABLED then
		addESP(plr)
	end
end)

-- AUTO FIX RESPAWN / NEW MATCH
LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1.5)
	if ESP_ENABLED then
		clearESP()
		enableESP()
	end
end)

---------------- ESP UI ----------------
local EspButton = Instance.new("TextButton", View)
EspButton.Size = UDim2.new(0,200,0,40)
EspButton.Position = UDim2.new(0,20,0,20)
EspButton.Text = "ESP Highlight : OFF"
EspButton.Font = Enum.Font.GothamBold
EspButton.TextSize = 14
EspButton.BackgroundColor3 = Color3.fromRGB(180,180,180)
EspButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", EspButton).CornerRadius = UDim.new(0,10)

EspButton.MouseButton1Click:Connect(function()
	ESP_ENABLED = not ESP_ENABLED
	if ESP_ENABLED then
		EspButton.Text = "ESP Highlight : ON"
		EspButton.BackgroundColor3 = Color3.fromRGB(220,60,60)
		enableESP()
	else
		EspButton.Text = "ESP Highlight : OFF"
		EspButton.BackgroundColor3 = Color3.fromRGB(180,180,180)
		clearESP()
	end
end)

---------------- DRAG ----------------
local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

---------------- MINIMIZE ----------------
local minimized = false
Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

---------------- CLOSE CONFIRM ----------------
Close.MouseButton1Click:Connect(function()
	local cf = Instance.new("Frame", gui)
	cf.Size = UDim2.new(0,260,0,130)
	cf.Position = UDim2.new(0.5,-130,0.5,-65)
	cf.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", cf).CornerRadius = UDim.new(0,12)

	local txt = Instance.new("TextLabel", cf)
	txt.Size = UDim2.new(1,-20,0,50)
	txt.Position = UDim2.new(0,10,0,10)
	txt.BackgroundTransparency = 1
	txt.Text = "Bạn có muốn đóng SLK HUB không?"
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 14
	txt.TextWrapped = true
	txt.TextColor3 = Color3.fromRGB(60,60,60)

	local yes = Instance.new("TextButton", cf)
	yes.Size = UDim2.new(0.4,0,0,32)
	yes.Position = UDim2.new(0.05,0,1,-42)
	yes.Text = "Yes"
	yes.BackgroundColor3 = Color3.fromRGB(255,120,120)
	yes.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", yes).CornerRadius = UDim.new(0,8)

	local no = Instance.new("TextButton", cf)
	no.Size = UDim2.new(0.4,0,0,32)
	no.Position = UDim2.new(0.55,0,1,-42)
	no.Text = "No"
	no.BackgroundColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner", no).CornerRadius = UDim.new(0,8)

	yes.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
	no.MouseButton1Click:Connect(function()
		cf:Destroy()
	end)
end)
