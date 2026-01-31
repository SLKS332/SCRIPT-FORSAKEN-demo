--// SLK HUB | White Version v1.2 FINAL
--// Forsaken ESP FIX
--// By SLK GAMING

---------------- SERVICES ----------------
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-------------- ANTI DUPLICATE ------------
pcall(function()
	if game.CoreGui:FindFirstChild("SLK_HUB") then
		game.CoreGui.SLK_HUB:Destroy()
	end
end)

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
TopBar.BackgroundTransparency = 0.4
TopBar.Active = true
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB | White v1.2"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(60,60,60)

local Min = Instance.new("TextButton", TopBar)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-74,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.BackgroundColor3 = Color3.fromRGB(230,230,230)
Instance.new("UICorner", Min)

local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-36,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(200,60,60)
Close.BackgroundColor3 = Color3.fromRGB(230,230,230)
Instance.new("UICorner", Close)

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

---------------- INFO ----------------
local Info = Instance.new("TextLabel", View)
Info.Size = UDim2.new(1,-20,1,-20)
Info.Position = UDim2.new(0,10,0,10)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextYAlignment = Top
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(70,70,70)

local function SetInfo(text)
	Info.Text = text
end

SetInfo("Welcome to SLK HUB\n\nStatus: Working\nVersion: v1.2")

---------------- ESP ----------------
local ESP_PLAYER, ESP_GEN = false, false
local ESP_LIST = {}

local function ClearESP()
	for _,v in pairs(ESP_LIST) do
		if v then v:Destroy() end
	end
	table.clear(ESP_LIST)
end

local function PlayerESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local h = Instance.new("Highlight")
			h.Adornee = plr.Character
			h.FillColor = Color3.fromRGB(255,70,70)
			h.OutlineColor = Color3.new(1,1,1)
			h.FillTransparency = 0.35
			h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			h.Parent = Camera
			table.insert(ESP_LIST,h)
		end
	end
end

local function GenESP()
	for _,m in pairs(workspace:GetDescendants()) do
		if m:IsA("Model") and m.Name:lower():find("gen") then
			local h = Instance.new("Highlight")
			h.Adornee = m
			h.FillColor = Color3.fromRGB(255,220,70)
			h.FillTransparency = 0.45
			h.OutlineColor = Color3.new(1,1,1)
			h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			h.Parent = Camera
			table.insert(ESP_LIST,h)
		end
	end
end

local function UpdateESP()
	ClearESP()
	if ESP_PLAYER then PlayerESP() end
	if ESP_GEN then GenESP() end
end

---------------- INVISIBLE TAB ----------------
local ESP_Frame = Instance.new("Frame", View)
ESP_Frame.Size = UDim2.new(0,360,0,200)
ESP_Frame.Position = UDim2.new(0,20,0,20)
ESP_Frame.BackgroundTransparency = 1
ESP_Frame.Visible = false

local function Toggle(text,y,color,callback)
	local b = Instance.new("TextButton", ESP_Frame)
	b.Size = UDim2.new(0,300,0,36)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text.." : OFF"
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(160,160,160)
	Instance.new("UICorner", b)

	local on=false
	b.MouseButton1Click:Connect(function()
		on=not on
		b.Text=text.." : "..(on and "ON" or "OFF")
		b.BackgroundColor3=on and color or Color3.fromRGB(160,160,160)
		callback(on)
		UpdateESP()
	end)
end

Toggle("ESP Player",0,Color3.fromRGB(220,70,70),function(v) ESP_PLAYER=v end)
Toggle("ESP Generator",46,Color3.fromRGB(230,200,60),function(v) ESP_GEN=v end)

---------------- TABS ----------------
local tabs={"✅ INFO","👁 INVISIBLE","Tab 3","Tab 4","Tab 5","Tab 6"}
for i,n in ipairs(tabs) do
	local t=Instance.new("TextButton",TabBar)
	t.Size=UDim2.new(1,-10,0,40)
	t.Position=UDim2.new(0,5,0,(i-1)*45+10)
	t.Text=n
	t.Font=Enum.Font.GothamBold
	t.TextSize=14
	t.BackgroundColor3=Color3.fromRGB(235,235,235)
	Instance.new("UICorner",t)

	t.MouseButton1Click:Connect(function()
		ESP_Frame.Visible = (n=="👁 INVISIBLE")
		if n=="✅ INFO" then
			SetInfo("Welcome to SLK HUB\n\nStatus: Working\nVersion: v1.2")
		elseif n~="👁 INVISIBLE" then
			SetInfo(n.." đang phát triển 🚧")
		end
	end)
end

---------------- DRAG FIX ----------------
local drag=false
local startPos,mousePos
TopBar.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		drag=true
		startPos=Main.Position
		mousePos=i.Position
	end
end)

UIS.InputChanged:Connect(function(i)
	if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
		local d=i.Position-mousePos
		Main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
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
	local bg=Instance.new("Frame",gui)
	bg.Size=UDim2.fromScale(1,1)
	bg.BackgroundColor3=Color3.new(0,0,0)
	bg.BackgroundTransparency=0.4

	local box=Instance.new("Frame",bg)
	box.Size=UDim2.new(0,260,0,130)
	box.Position=UDim2.new(0.5,-130,0.5,-65)
	box.BackgroundColor3=Color3.fromRGB(255,255,255)
	Instance.new("UICorner",box)

	local txt=Instance.new("TextLabel",box)
	txt.Size=UDim2.new(1,0,0,60)
	txt.BackgroundTransparency=1
	txt.Text="Bạn có chắc muốn tắt SLK HUB?"
	txt.Font=Enum.Font.GothamBold
	txt.TextSize=14
	txt.TextWrapped=true

	local yes=Instance.new("TextButton",box)
	yes.Size=UDim2.new(0.45,0,0,32)
	yes.Position=UDim2.new(0.05,0,1,-40)
	yes.Text="Có"
	yes.BackgroundColor3=Color3.fromRGB(220,70,70)
	Instance.new("UICorner",yes)

	local no=Instance.new("TextButton",box)
	no.Size=UDim2.new(0.45,0,0,32)
	no.Position=UDim2.new(0.5,0,1,-40)
	no.Text="Không"
	no.BackgroundColor3=Color3.fromRGB(200,200,200)
	Instance.new("UICorner",no)

	yes.MouseButton1Click:Connect(function() gui:Destroy() end)
	no.MouseButton1Click:Connect(function() bg:Destroy() end)
end)
