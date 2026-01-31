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
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

---------------- MAIN --------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.35
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-200,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White"
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
Min.BackgroundColor3 = Color3.fromRGB(230,230,230)
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
Close.BackgroundColor3 = Color3.fromRGB(230,230,230)
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
Info.Text = "WELCOME TO SLK HUB 🤍"

---------------- ESP PLAYER ----------------
local ESP_Player_ON = false
local ESP_Player_List = {}

local function ClearPlayerESP()
	for _,v in pairs(ESP_Player_List) do
		if v then v:Destroy() end
	end
	table.clear(ESP_Player_List)
end

local function ApplyPlayerESP()
	ClearPlayerESP()
	if not ESP_Player_ON then return end

	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local hl = Instance.new("Highlight")
			hl.Adornee = plr.Character
			hl.FillColor = Color3.fromRGB(255,70,70)
			hl.OutlineColor = Color3.new(1,1,1)
			hl.FillTransparency = 0.35
			hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			hl.Parent = gui
			table.insert(ESP_Player_List, hl)
		end
	end
end

---------------- ESP GEN ----------------
local ESP_GEN_ON = false
local ESP_GEN_List = {}

local function ClearGenESP()
	for _,v in pairs(ESP_GEN_List) do
		if v then v:Destroy() end
	end
	table.clear(ESP_GEN_List)
end

local function ApplyGenESP()
	ClearGenESP()
	if not ESP_GEN_ON then return end

	for _,obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("Model") or obj:IsA("Part") then
			if string.find(string.lower(obj.Name), "generator") then
				local h = Instance.new("Highlight")
				h.Adornee = obj
				h.FillColor = Color3.fromRGB(255, 220, 80)
				h.OutlineColor = Color3.new(1,1,1)
				h.FillTransparency = 0.3
				h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				h.Parent = gui
				table.insert(ESP_GEN_List, h)
			end
		end
	end
end

---------------- INVISIBLE TAB UI ----------------
local INV_Frame = Instance.new("Frame", View)
INV_Frame.Size = UDim2.new(1,0,1,0)
INV_Frame.BackgroundTransparency = 1
INV_Frame.Visible = false

local PlayerESPBtn = Instance.new("TextButton", INV_Frame)
PlayerESPBtn.Size = UDim2.new(0,220,0,38)
PlayerESPBtn.Position = UDim2.new(0,20,0,20)
PlayerESPBtn.Text = "ESP PLAYER : OFF"
PlayerESPBtn.Font = Enum.Font.GothamBold
PlayerESPBtn.TextSize = 14
PlayerESPBtn.TextColor3 = Color3.new(1,1,1)
PlayerESPBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
Instance.new("UICorner", PlayerESPBtn).CornerRadius = UDim.new(0,10)

PlayerESPBtn.MouseButton1Click:Connect(function()
	ESP_Player_ON = not ESP_Player_ON
	if ESP_Player_ON then
		PlayerESPBtn.Text = "ESP PLAYER : ON"
		PlayerESPBtn.BackgroundColor3 = Color3.fromRGB(220,70,70)
		ApplyPlayerESP()
	else
		PlayerESPBtn.Text = "ESP PLAYER : OFF"
		PlayerESPBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
		ClearPlayerESP()
	end
end)

local GenESPBtn = Instance.new("TextButton", INV_Frame)
GenESPBtn.Size = UDim2.new(0,220,0,38)
GenESPBtn.Position = UDim2.new(0,20,0,70)
GenESPBtn.Text = "ESP GEN : OFF"
GenESPBtn.Font = Enum.Font.GothamBold
GenESPBtn.TextSize = 14
GenESPBtn.TextColor3 = Color3.new(1,1,1)
GenESPBtn.BackgroundColor3 = Color3.fromRGB(170,170,170)
Instance.new("UICorner", GenESPBtn).CornerRadius = UDim.new(0,10)

GenESPBtn.MouseButton1Click:Connect(function()
	ESP_GEN_ON = not ESP_GEN_ON
	if ESP_GEN_ON then
		GenESPBtn.Text = "ESP GEN : ON"
		GenESPBtn.BackgroundColor3 = Color3.fromRGB(255,200,70)
		ApplyGenESP()
	else
		GenESPBtn.Text = "ESP GEN : OFF"
		GenESPBtn.BackgroundColor3 = Color3.fromRGB(170,170,170)
		ClearGenESP()
	end
end)

local Note = Instance.new("TextLabel", INV_Frame)
Note.Size = UDim2.new(1,-40,0,80)
Note.Position = UDim2.new(0,20,0,130)
Note.BackgroundTransparency = 1
Note.TextWrapped = true
Note.TextYAlignment = Top
Note.Font = Enum.Font.Gotham
Note.TextSize = 13
Note.TextColor3 = Color3.fromRGB(80,80,80)
Note.Text =
"🇻🇳 Tab này hiện chỉ để demo nên chưa có nhiều chức năng\n\n🇬🇧 This tab is demo only, more features will be added later"

---------------- TABS --------------------
local Tabs = {"✅ INFO","👁 INVISIBLE","Tab 3","Tab 4","Tab 5","Tab 6"}

for i,name in ipairs(Tabs) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1,-10,0,40)
	Tab.Position = UDim2.new(0,5,0,(i-1)*45+10)
	Tab.Text = name
	Tab.Font = Enum.Font.GothamBold
	Tab.TextSize = 14
	Tab.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Tab.TextColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Visible = (name == "✅ INFO")
		INV_Frame.Visible = (name == "👁 INVISIBLE")
		if name ~= "✅ INFO" and name ~= "👁 INVISIBLE" then
			Info.Visible = true
			Info.Text = name.." đang phát triển 🚧"
		end
	end)
end

---------------- DRAG (SAFE) ----------------
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
	t.TextColor3 = Color3.fromRGB(60,60,60)

	local y = Instance.new("TextButton", cf)
	y.Size = UDim2.new(0.4,0,0,30)
	y.Position = UDim2.new(0.05,0,1,-40)
	y.Text = "Yes"
	y.BackgroundColor3 = Color3.fromRGB(255,120,120)
	y.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", y).CornerRadius = UDim.new(0,8)

	local n = Instance.new("TextButton", cf)
	n.Size = UDim2.new(0.4,0,0,30)
	n.Position = UDim2.new(0.55,0,1,-40)
	n.Text = "No"
	n.BackgroundColor3 = Color3.fromRGB(220,220,220)
	Instance.new("UICorner", n).CornerRadius = UDim.new(0,8)

	y.MouseButton1Click:Connect(function() gui:Destroy() end)
	n.MouseButton1Click:Connect(function() cf:Destroy() end)
end)
