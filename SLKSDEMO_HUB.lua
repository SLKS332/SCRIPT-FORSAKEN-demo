--// SLK HUB - WHITE VERSION v1.3 (FULL FIX)
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
Main.BackgroundTransparency = 0.12
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.45 -- TRONG SUỐT
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-120,1,0)
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

---------------- INFO TAB ----------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Enum.TextYAlignment.Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(70,70,70)

Info.Text = [[
WELCOME TO SLK HUB 🤍

✔ ESP PLAYER
✔ ESP GENERATOR
✔ DRAG FIXED
✔ NO TAB LOST

YouTube: SLK GAMING
]]

---------------- ESP PLAYER ----------------
local ESP_PLAYER = false
local PlayerESP = {}

local function ClearPlayerESP()
	for _,v in pairs(PlayerESP) do
		if v then v:Destroy() end
	end
	PlayerESP = {}
end

local function ApplyPlayerESP()
	ClearPlayerESP()
	if not ESP_PLAYER then return end

	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local hum = plr.Character:FindFirstChild("Humanoid")
			if hum and hum.Health > 0 then
				local hl = Instance.new("Highlight")
				hl.Adornee = plr.Character
				hl.FillColor = Color3.fromRGB(255,255,255)
				hl.FillTransparency = 0.6
				hl.OutlineColor = Color3.new(1,1,1)
				hl.Parent = gui
				PlayerESP[plr] = hl
			end
		end
	end
end

---------------- ESP GEN ----------------
local ESP_GEN = false
local GenESP = {}

local function ClearGenESP()
	for _,v in pairs(GenESP) do
		if v then v:Destroy() end
	end
	GenESP = {}
end

local function ApplyGenESP()
	ClearGenESP()
	if not ESP_GEN then return end

	for _,obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("Model") and
		   (obj.Name:lower():find("gen") or obj.Name:lower():find("generator")) then
			local hl = Instance.new("Highlight")
			hl.Adornee = obj
			hl.FillColor = Color3.fromRGB(255,220,0) -- VÀNG
			hl.FillTransparency = 0.4
			hl.OutlineColor = Color3.fromRGB(255,200,0)
			hl.Parent = gui
			table.insert(GenESP, hl)
		end
	end
end

---------------- INVISIBLE TAB ----------------
local InvisibleFrame = Instance.new("Frame", View)
InvisibleFrame.Size = UDim2.new(1,0,1,0)
InvisibleFrame.BackgroundTransparency = 1
InvisibleFrame.Visible = false

local function MakeToggle(text,y,color,onClick)
	local b = Instance.new("TextButton", InvisibleFrame)
	b.Size = UDim2.new(0,240,0,36)
	b.Position = UDim2.new(0,20,0,y)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = color
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
	b.MouseButton1Click:Connect(onClick)
	return b
end

local PlayerBtn = MakeToggle("ESP PLAYER : OFF",20,Color3.fromRGB(160,160,160),function()
	ESP_PLAYER = not ESP_PLAYER
	PlayerBtn.Text = ESP_PLAYER and "ESP PLAYER : ON" or "ESP PLAYER : OFF"
	PlayerBtn.BackgroundColor3 = ESP_PLAYER and Color3.fromRGB(220,70,70) or Color3.fromRGB(160,160,160)
	ApplyPlayerESP()
end)

local GenBtn = MakeToggle("ESP GEN : OFF",70,Color3.fromRGB(160,160,160),function()
	ESP_GEN = not ESP_GEN
	GenBtn.Text = ESP_GEN and "ESP GEN : ON" or "ESP GEN : OFF"
	GenBtn.BackgroundColor3 = ESP_GEN and Color3.fromRGB(255,200,0) or Color3.fromRGB(160,160,160)
	ApplyGenESP()
end)

local note = Instance.new("TextLabel", InvisibleFrame)
note.Size = UDim2.new(1,-40,0,60)
note.Position = UDim2.new(0,20,0,120)
note.BackgroundTransparency = 1
note.TextWrapped = true
note.Text = "⚠ Hiện hub chỉ bản demo\n🇻🇳 Tính năng còn ít\n🇺🇸 Features are limited"
note.Font = Enum.Font.Gotham
note.TextSize = 13
note.TextColor3 = Color3.fromRGB(90,90,90)

---------------- TABS ----------------
local function CreateTab(name,y,callback)
	local t = Instance.new("TextButton", TabBar)
	t.Size = UDim2.new(1,-10,0,40)
	t.Position = UDim2.new(0,5,0,y)
	t.Text = name
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14
	t.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", t).CornerRadius = UDim.new(0,8)
	t.MouseButton1Click:Connect(callback)
end

CreateTab("✅ INFO",10,function()
	Info.Visible = true
	InvisibleFrame.Visible = false
end)

CreateTab("👁 INVISIBLE",55,function()
	Info.Visible = false
	InvisibleFrame.Visible = true
end)

---------------- DRAG FIX ----------------
local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging then
		local d = i.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

---------------- MINIMIZE ----------------
local mini = false
Min.MouseButton1Click:Connect(function()
	mini = not mini
	Content.Visible = not mini
	Main.Size = mini and UDim2.new(0,520,0,46) or UDim2.new(0,520,0,320)
end)

---------------- CLOSE CONFIRM ----------------
Close.MouseButton1Click:Connect(function()
	if gui:FindFirstChild("CONFIRM") then return end
	local cf = Instance.new("Frame", gui)
	cf.Name = "CONFIRM"
	cf.Size = UDim2.new(0,260,0,120)
	cf.Position = UDim2.new(0.5,-130,0.5,-60)
	cf.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", cf).CornerRadius = UDim.new(0,12)

	local t = Instance.new("TextLabel", cf)
	t.Size = UDim2.new(1,-20,0,50)
	t.Position = UDim2.new(0,10,0,10)
	t.BackgroundTransparency = 1
	t.Text = "Bạn có muốn đóng SLK HUB không?"
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14

	local y = Instance.new("TextButton", cf)
	y.Size = UDim2.new(0.4,0,0,30)
	y.Position = UDim2.new(0.05,0,1,-40)
	y.Text = "Yes"
	y.BackgroundColor3 = Color3.fromRGB(255,120,120)
	Instance.new("UICorner", y)

	local n = Instance.new("TextButton", cf)
	n.Size = UDim2.new(0.4,0,0,30)
	n.Position = UDim2.new(0.55,0,1,-40)
	n.Text = "No"
	n.BackgroundColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner", n)

	y.MouseButton1Click:Connect(function() gui:Destroy() end)
	n.MouseButton1Click:Connect(function() cf:Destroy() end)
end)
