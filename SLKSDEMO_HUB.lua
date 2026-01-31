--// SLK HUB - WHITE VERSION v1 (FULL FIX)
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
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.6 -- trong suốt
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
Info.Text = [[WELCOME TO SLK HUB 🤍

Status: Working ✅
Version: v1

YouTube: SLK GAMING]]

---------------- ESP SYSTEM ----------------
local ESP_PLAYER_ON = false
local ESP_GEN_ON = false
local ESP_CACHE = {}

local function clearESP()
	for _,v in pairs(ESP_CACHE) do
		if v then v:Destroy() end
	end
	table.clear(ESP_CACHE)
end

local function addESP(plr, color)
	if plr == LocalPlayer then return end
	if not plr.Character then return end

	local hl = Instance.new("Highlight")
	hl.Adornee = plr.Character
	hl.FillColor = color
	hl.OutlineColor = Color3.new(1,1,1)
	hl.FillTransparency = 0.4
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Parent = gui

	table.insert(ESP_CACHE, hl)
end

local function refreshESP()
	clearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if ESP_PLAYER_ON then
			addESP(plr, Color3.fromRGB(255,80,80)) -- đỏ
		elseif ESP_GEN_ON then
			addESP(plr, Color3.fromRGB(255,220,80)) -- vàng
		end
	end
end

Players.PlayerAdded:Connect(function()
	task.wait(1)
	refreshESP()
end)

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	refreshESP()
end)

---------------- INVISIBLE TAB ----------------
local InvisFrame = Instance.new("Frame", View)
InvisFrame.Size = UDim2.new(1,0,1,0)
InvisFrame.BackgroundTransparency = 1
InvisFrame.Visible = false

local Note = Instance.new("TextLabel", InvisFrame)
Note.Size = UDim2.new(1,-40,0,60)
Note.Position = UDim2.new(0,20,0,10)
Note.BackgroundTransparency = 1
Note.TextWrapped = true
Note.TextYAlignment = Enum.TextYAlignment.Top
Note.Font = Enum.Font.Gotham
Note.TextSize = 13
Note.TextColor3 = Color3.fromRGB(80,80,80)
Note.Text = [[🇻🇳 Hiện hub chỉ để demo nên chưa có nhiều chức năng
🇺🇸 This hub is only a demo so features are limited]]

-- ESP PLAYER
local EspPlayerBtn = Instance.new("TextButton", InvisFrame)
EspPlayerBtn.Size = UDim2.new(0,220,0,38)
EspPlayerBtn.Position = UDim2.new(0,20,0,90)
EspPlayerBtn.Text = "ESP PLAYER : OFF"
EspPlayerBtn.Font = Enum.Font.GothamBold
EspPlayerBtn.TextSize = 14
EspPlayerBtn.TextColor3 = Color3.new(1,1,1)
EspPlayerBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
Instance.new("UICorner", EspPlayerBtn).CornerRadius = UDim.new(0,10)

EspPlayerBtn.MouseButton1Click:Connect(function()
	ESP_PLAYER_ON = not ESP_PLAYER_ON
	ESP_GEN_ON = false
	if ESP_PLAYER_ON then
		EspPlayerBtn.Text = "ESP PLAYER : ON"
		EspPlayerBtn.BackgroundColor3 = Color3.fromRGB(220,60,60)
	else
		EspPlayerBtn.Text = "ESP PLAYER : OFF"
		EspPlayerBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
	end
	refreshESP()
end)

-- ESP GEN
local EspGenBtn = Instance.new("TextButton", InvisFrame)
EspGenBtn.Size = UDim2.new(0,220,0,38)
EspGenBtn.Position = UDim2.new(0,20,0,140)
EspGenBtn.Text = "ESP GEN : OFF"
EspGenBtn.Font = Enum.Font.GothamBold
EspGenBtn.TextSize = 14
EspGenBtn.TextColor3 = Color3.new(1,1,1)
EspGenBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
Instance.new("UICorner", EspGenBtn).CornerRadius = UDim.new(0,10)

EspGenBtn.MouseButton1Click:Connect(function()
	ESP_GEN_ON = not ESP_GEN_ON
	ESP_PLAYER_ON = false
	if ESP_GEN_ON then
		EspGenBtn.Text = "ESP GEN : ON"
		EspGenBtn.BackgroundColor3 = Color3.fromRGB(230,200,60)
	else
		EspGenBtn.Text = "ESP GEN : OFF"
		EspGenBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
	end
	refreshESP()
end)

---------------- TABS ----------------
local Tabs = {"INFO","INVISIBLE","TAB 3","TAB 4","TAB 5","TAB 6"}

for i,name in ipairs(Tabs) do
	local btn = Instance.new("TextButton", TabBar)
	btn.Size = UDim2.new(1,-10,0,40)
	btn.Position = UDim2.new(0,5,0,(i-1)*45+10)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(235,235,235)
	btn.TextColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

	btn.MouseButton1Click:Connect(function()
		Info.Visible = false
		InvisFrame.Visible = false

		if name == "INFO" then
			Info.Visible = true
		elseif name == "INVISIBLE" then
			InvisFrame.Visible = true
		else
			Info.Visible = true
			Info.Text = name .. " đang phát triển 🚧"
		end
	end)
end

---------------- DRAG ----------------
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
UIS.InputEnded:Connect(function() dragging = false end)

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
	cf.Size = UDim2.new(0,260,0,130)
	cf.Position = UDim2.new(0.5,-130,0.5,-65)
	cf.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", cf).CornerRadius = UDim.new(0,12)

	local t = Instance.new("TextLabel", cf)
	t.Size = UDim2.new(1,-20,0,50)
	t.Position = UDim2.new(0,10,0,10)
	t.BackgroundTransparency = 1
	t.Text = "Bạn có muốn đóng SLK HUB không?"
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14
	t.TextWrapped = true
	t.TextColor3 = Color3.fromRGB(60,60,60)

	local y = Instance.new("TextButton", cf)
	y.Size = UDim2.new(0.4,0,0,32)
	y.Position = UDim2.new(0.05,0,1,-42)
	y.Text = "Yes"
	y.BackgroundColor3 = Color3.fromRGB(255,120,120)
	y.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", y).CornerRadius = UDim.new(0,8)

	local n = Instance.new("TextButton", cf)
	n.Size = UDim2.new(0.4,0,0,32)
	n.Position = UDim2.new(0.55,0,1,-42)
	n.Text = "No"
	n.BackgroundColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner", n).CornerRadius = UDim.new(0,8)

	y.MouseButton1Click:Connect(function() gui:Destroy() end)
	n.MouseButton1Click:Connect(function() cf:Destroy() end)
end)
