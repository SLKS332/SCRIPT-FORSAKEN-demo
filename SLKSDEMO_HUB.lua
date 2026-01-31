--// SLK HUB - WHITE VERSION v1.2
--// By SLK GAMING

---------------- SERVICES ----------------
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
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
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR (TRANSPARENT) -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-200,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White Version v1.2"
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
Min.BackgroundColor3 = Color3.fromRGB(255,255,255)
Min.BackgroundTransparency = 0.25
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
Close.BackgroundColor3 = Color3.fromRGB(255,255,255)
Close.BackgroundTransparency = 0.25
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

Info.Text = [[⚙ SCRIPT STATUS

• Script Status: Working ✅
• Version: v1.2

🙏 Thank you for using SLK HUB
YouTube: SLK GAMING]]

---------------- ESP (HIGHLIGHT) ----------------
local ESP_ON = false
local ESP_LIST = {}

local function ClearESP()
	for _,v in pairs(ESP_LIST) do
		if v then v:Destroy() end
	end
	table.clear(ESP_LIST)
end

local function ApplyESP()
	ClearESP()
	if not ESP_ON then return end

	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local hum = plr.Character:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health > 0 then
				local hl = Instance.new("Highlight")
				hl.Adornee = plr.Character
				hl.FillColor = Color3.fromRGB(255,80,80)
				hl.OutlineColor = Color3.new(1,1,1)
				hl.FillTransparency = 0.35
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				hl.Parent = plr.Character
				table.insert(ESP_LIST, hl)
			end
		end
	end
end

RunService.Heartbeat:Connect(function()
	if ESP_ON then
		ApplyESP()
	end
end)

---------------- ESP UI ----------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,320,0,140)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

local ESP_Toggle = Instance.new("TextButton", ESP_Frame)
ESP_Toggle.Size = UDim2.new(0,240,0,36)
ESP_Toggle.Text = "ESP Highlight : OFF"
ESP_Toggle.Font = Enum.Font.GothamBold
ESP_Toggle.TextSize = 14
ESP_Toggle.TextColor3 = Color3.new(1,1,1)
ESP_Toggle.BackgroundColor3 = Color3.fromRGB(160,160,160)
Instance.new("UICorner", ESP_Toggle).CornerRadius = UDim.new(0,10)

ESP_Toggle.MouseButton1Click:Connect(function()
	ESP_ON = not ESP_ON
	if ESP_ON then
		ESP_Toggle.Text = "ESP Highlight : ON"
		ESP_Toggle.BackgroundColor3 = Color3.fromRGB(220,70,70)
		ApplyESP()
	else
		ESP_Toggle.Text = "ESP Highlight : OFF"
		ESP_Toggle.BackgroundColor3 = Color3.fromRGB(160,160,160)
		ClearESP()
	end
end)

local NoteVN = Instance.new("TextLabel", ESP_Frame)
NoteVN.Position = UDim2.new(0,0,0,50)
NoteVN.Size = UDim2.new(1,0,0,30)
NoteVN.BackgroundTransparency = 1
NoteVN.Text = "🇻🇳 Hiện tại hub chỉ để demo nên chưa có nhiều chức năng"
NoteVN.Font = Enum.Font.Gotham
NoteVN.TextSize = 13
NoteVN.TextColor3 = Color3.fromRGB(90,90,90)
NoteVN.TextWrapped = true

local NoteEN = Instance.new("TextLabel", ESP_Frame)
NoteEN.Position = UDim2.new(0,0,0,80)
NoteEN.Size = UDim2.new(1,0,0,30)
NoteEN.BackgroundTransparency = 1
NoteEN.Text = "🇺🇸 This hub is for demo purposes, more features coming soon"
NoteEN.Font = Enum.Font.Gotham
NoteEN.TextSize = 13
NoteEN.TextColor3 = Color3.fromRGB(90,90,90)
NoteEN.TextWrapped = true

---------------- TABS --------------------
local Tabs = {"✅ INFO","👁 INVISIBLE","Tab 3","Tab 4","Tab 5","Tab 6"}

for i,name in ipairs(Tabs) do
	local Tab = Instance.new("TextButton", TabBar)
	Tab.Size = UDim2.new(1,-10,0,40)
	Tab.Position = UDim2.new(0,5,0,(i-1)*45+10)
	Tab.Text = name
	Tab.Font = Enum.Font.GothamBold
	Tab.TextSize = 14
	Tab.TextColor3 = Color3.fromRGB(60,60,60)
	Tab.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Visible = name ~= "👁 INVISIBLE"
		ESP_Frame.Visible = name == "👁 INVISIBLE"
	end)
end

---------------- DRAG --------------------
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

	local t = Instance.new("TextLabel", cf)
	t.Size = UDim2.new(1,-20,0,50)
	t.Position = UDim2.new(0,10,0,10)
	t.BackgroundTransparency = 1
	t.Text = "Bạn có muốn đóng SLK HUB không?"
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14
	t.TextColor3 = Color3.fromRGB(60,60,60)

	local y = Instance.new("TextButton", cf)
	y.Size = UDim2.new(0.4,0,0,32)
	y.Position = UDim2.new(0.05,0,1,-42)
	y.Text = "Yes"
	y.BackgroundColor3 = Color3.fromRGB(255,100,100)
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
