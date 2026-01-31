--// SLK HUB - WHITE VERSION v1 (INVISIBLE ESP FIXED + TAB SAFE)
--// By SLK GAMING

---------------- SERVICES ----------------
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
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

local INFO_TEXT = [[⚙ SCRIPT STATUS

• Script Status: Working ✅
• ESP Status: Stable
• Version: v1 FIXED

🙏 Thank you for using SLK HUB
YouTube: SLK GAMING]]

Info.Text = INFO_TEXT

---------------- ESP SYSTEM (FIXED) ----------------
local ESP_ON = false
local ESP_CACHE = {}

local function removeESP(plr)
	if ESP_CACHE[plr] then
		ESP_CACHE[plr]:Destroy()
		ESP_CACHE[plr] = nil
	end
end

local function createESP(plr, char)
	if not ESP_ON then return end
	if plr == LocalPlayer then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return end

	removeESP(plr)

	local hl = Instance.new("Highlight")
	hl.Adornee = char
	hl.FillColor = Color3.new(1,1,1)
	hl.OutlineColor = Color3.new(1,1,1)
	hl.FillTransparency = 0.6
	hl.OutlineTransparency = 0
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Parent = char

	ESP_CACHE[plr] = hl

	hum.Died:Connect(function()
		removeESP(plr)
	end)
end

local function refreshESP()
	for _,plr in ipairs(Players:GetPlayers()) do
		if plr.Character then
			createESP(plr, plr.Character)
		end
	end
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		task.wait(0.3)
		createESP(plr, char)
	end)
end)

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	if ESP_ON then
		refreshESP()
	end
end)

---------------- ESP UI ----------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,260,0,80)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

local ESP_Toggle = Instance.new("TextButton", ESP_Frame)
ESP_Toggle.Size = UDim2.new(0,200,0,36)
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
		refreshESP()
	else
		ESP_Toggle.Text = "ESP Highlight : OFF"
		ESP_Toggle.BackgroundColor3 = Color3.fromRGB(160,160,160)
		for plr,_ in pairs(ESP_CACHE) do
			removeESP(plr)
		end
	end
end)

---------------- TABS --------------------
local Tabs = {
	"✅ INFO",
	"👁 INVISIBLE",
	"Tab 3",
	"Tab 4",
	"Tab 5",
	"Tab 6"
}

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
		Info.Visible = false
		ESP_Frame.Visible = false

		if name == "✅ INFO" then
			Info.Visible = true
			Info.Text = INFO_TEXT
		elseif name == "👁 INVISIBLE" then
			ESP_Frame.Visible = true
		else
			Info.Visible = true
			Info.Text = name .. " đang phát triển 🚧"
		end
	end)
end

---------------- DRAG --------------------
local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
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
	gui:Destroy()
end)
