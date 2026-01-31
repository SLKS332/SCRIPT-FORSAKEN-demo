--// SLK HUB | White Version v1.2
--// ESP Highlight + ESP Gen (Yellow)
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
Main.Size = UDim2.new(0,540,0,340)
Main.Position = UDim2.new(0.5,-270,0.5,-170)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,48)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.4
TopBar.BorderSizePixel = 0
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-140,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White Version v1.2"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(60,60,60)

-- Minimize
local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-74,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(230,230,230)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0,8)

-- Close
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-36,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(200,60,60)
Close.BackgroundColor3 = Color3.fromRGB(230,230,230)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0,8)

---------------- CONTENT -----------------
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,0,0,48)
Content.Size = UDim2.new(1,0,1,-48)
Content.BackgroundTransparency = 1

local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0,130,1,0)
TabBar.BackgroundTransparency = 1

local View = Instance.new("Frame", Content)
View.Position = UDim2.new(0,130,0,0)
View.Size = UDim2.new(1,-130,1,0)
View.BackgroundTransparency = 1

---------------- INFO --------------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(70,70,70)
Info.Text = "⚙ Script Status: Working ✅\n\nThank you for using SLK HUB"

---------------- ESP SYSTEM ----------------
local ESP_RED = false
local ESP_YELLOW = false
local ESP_LIST = {}

local function ClearESP()
	for _,h in pairs(ESP_LIST) do
		if h then h:Destroy() end
	end
	table.clear(ESP_LIST)
end

local function ApplyESP()
	ClearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			if ESP_RED then
				local h = Instance.new("Highlight")
				h.Adornee = plr.Character
				h.FillColor = Color3.fromRGB(255,70,70)
				h.OutlineColor = Color3.new(1,1,1)
				h.FillTransparency = 0.35
				h.DepthMode = AlwaysOnTop
				h.Parent = plr.Character
				table.insert(ESP_LIST,h)
			end
			if ESP_YELLOW then
				local g = Instance.new("Highlight")
				g.Adornee = plr.Character
				g.FillColor = Color3.fromRGB(255,220,70)
				g.OutlineColor = Color3.new(1,1,1)
				g.FillTransparency = 0.45
				g.DepthMode = AlwaysOnTop
				g.Parent = plr.Character
				table.insert(ESP_LIST,g)
			end
		end
	end
end

Players.PlayerAdded:Connect(function()
	task.wait(1)
	ApplyESP()
end)

---------------- INVISIBLE TAB ----------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,360,0,200)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

local function MakeToggle(text,y,colorOn,callback)
	local b = Instance.new("TextButton", ESP_Frame)
	b.Size = UDim2.new(0,300,0,36)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text.." : OFF"
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(160,160,160)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)

	local state = false
	b.MouseButton1Click:Connect(function()
		state = not state
		b.Text = text.." : "..(state and "ON" or "OFF")
		b.BackgroundColor3 = state and colorOn or Color3.fromRGB(160,160,160)
		callback(state)
	end)
end

MakeToggle("ESP Highlight",0,Color3.fromRGB(220,70,70),function(v)
	ESP_RED = v
	ApplyESP()
end)

MakeToggle("ESP Gen",46,Color3.fromRGB(230,200,60),function(v)
	ESP_YELLOW = v
	ApplyESP()
end)

local demo = Instance.new("TextLabel", ESP_Frame)
demo.Size = UDim2.new(1,0,0,60)
demo.Position = UDim2.new(0,0,0,100)
demo.BackgroundTransparency = 1
demo.TextWrapped = true
demo.TextYAlignment = Top
demo.Font = Enum.Font.Gotham
demo.TextSize = 13
demo.TextColor3 = Color3.fromRGB(80,80,80)
demo.Text =
"🇻🇳 Hiện tại hub chỉ để demo nên chưa có nhiều chức năng\n\n"..
"🇺🇸 This hub is for demo purposes, more features coming soon"

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
	Instance.new("UICorner", Tab).CornerRadius = UDim.new(0,8)

	Tab.MouseButton1Click:Connect(function()
		Info.Visible = name=="✅ INFO"
		ESP_Frame.Visible = name=="👁 INVISIBLE"
		if name~="✅ INFO" and name~="👁 INVISIBLE" then
			Info.Visible=true
			Info.Text = name.." đang phát triển 🚧"
		end
	end)
end

---------------- DRAG --------------------
local drag,ds,sp
TopBar.InputBegan:Connect(function(i)
	if i.UserInputType==MouseButton1 or i.UserInputType==Touch then
		drag=true ds=i.Position sp=Main.Position
	end
end)
UIS.InputChanged:Connect(function(i)
	if drag then
		local d=i.Position-ds
		Main.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
	end
end)
UIS.InputEnded:Connect(function() drag=false end)

---------------- MINIMIZE ----------------
local mini=false
Min.MouseButton1Click:Connect(function()
	mini=not mini
	Content.Visible=not mini
	Main.Size=mini and UDim2.new(0,540,0,48) or UDim2.new(0,540,0,340)
end)

---------------- CLOSE CONFIRM ----------------
Close.MouseButton1Click:Connect(function()
	local cf=Instance.new("TextLabel",gui)
	cf.Size=UDim2.new(0,260,0,120)
	cf.Position=UDim2.new(0.5,-130,0.5,-60)
	cf.BackgroundColor3=Color3.fromRGB(255,255,255)
	Instance.new("UICorner",cf).CornerRadius=UDim.new(0,12)
	cf.Text="Bạn có chắc muốn đóng SLK HUB?"
	cf.Font=Enum.Font.GothamBold
	cf.TextSize=14
	cf.TextWrapped=true
	cf.TextColor3=Color3.fromRGB(60,60,60)

	cf.InputBegan:Connect(function(i)
		if i.UserInputType==MouseButton1 then gui:Destroy() end
	end)
end)
