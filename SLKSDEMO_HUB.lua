-- SLKS GAMING HUB V0.1 (FINAL FIX)
-- Loading + Menu + Tabs + Speed + ESP

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-------------------------------------------------
-- LOADING
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui", player.PlayerGui)
LoadingGui.IgnoreGuiInset = true

local bg = Instance.new("Frame", LoadingGui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(5,10,15)

local txt = Instance.new("TextLabel", bg)
txt.Size = UDim2.new(1,0,1,0)
txt.BackgroundTransparency = 1
txt.Font = Enum.Font.Code
txt.TextSize = 28
txt.TextColor3 = Color3.fromRGB(0,255,140)
txt.Text = "SLKS GAMING\nLoading..."

task.wait(1)
LoadingGui:Destroy()

-------------------------------------------------
-- MENU
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,450,0,300)
Menu.Position = UDim2.new(0.5,-225,0.5,-150)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.25
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundTransparency = 1
header.Font = Enum.Font.Code
header.TextSize = 18
header.TextColor3 = Color3.fromRGB(0,255,140)
header.Text = "SLKS GAMING HUB V0.1"

-- top buttons
local function topBtn(t,x,c)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,30,0,30)
	b.Position = UDim2.new(1,x,0,5)
	b.Text = t
	b.Font = Enum.Font.Code
	b.TextSize = 20
	b.BackgroundColor3 = c
	Instance.new("UICorner", b)
	return b
end

local minBtn = topBtn("-", -70, Color3.fromRGB(30,30,30))
local closeBtn = topBtn("X", -35, Color3.fromRGB(80,30,30))

-------------------------------------------------
-- TABS
-------------------------------------------------
local tabs = {}
local pages = {}

local function tabBtn(name,x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,120,0,30)
	b.Position = UDim2.new(0,x,0,45)
	b.Text = name
	b.Font = Enum.Font.Code
	b.TextColor3 = Color3.fromRGB(0,255,140)
	b.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Instance.new("UICorner", b)
	return b
end

tabs.Main = tabBtn("MAIN",15)
tabs.Info = tabBtn("INFO",145)

local function page()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-30,1,-90)
	f.Position = UDim2.new(0,15,0,85)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

pages.Main = page()
pages.Info = page()
pages.Main.Visible = true

local function switch(p)
	for _,v in pairs(pages) do v.Visible = false end
	pages[p].Visible = true
end

tabs.Main.MouseButton1Click:Connect(function() switch("Main") end)
tabs.Info.MouseButton1Click:Connect(function() switch("Info") end)

-------------------------------------------------
-- TELEPORT SPEED (ĐÚNG Ý BẠN)
-------------------------------------------------
local speed = 20
local speedOn = false

local speedTxt = Instance.new("TextLabel", pages.Main)
speedTxt.Size = UDim2.new(1,0,0,25)
speedTxt.Text = "Teleport Speed: 20"
speedTxt.Font = Enum.Font.Code
speedTxt.TextColor3 = Color3.new(1,1,1)
speedTxt.BackgroundTransparency = 1

local slider = Instance.new("TextButton", pages.Main)
slider.Position = UDim2.new(0,0,0,30)
slider.Size = UDim2.new(1,0,0,20)
slider.Text = "KÉO ĐỂ CHỈNH (0 - 50)"
slider.BackgroundColor3 = Color3.fromRGB(30,30,30)

slider.MouseButton1Down:Connect(function()
	local con
	con = UIS.InputChanged:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement then
			local p = math.clamp((i.Position.X - slider.AbsolutePosition.X)/slider.AbsoluteSize.X,0,1)
			speed = math.floor(p*50)
			speedTxt.Text = "Teleport Speed: "..speed
		end
	end)
	UIS.InputEnded:Wait()
	con:Disconnect()
end)

local speedBtn = Instance.new("TextButton", pages.Main)
speedBtn.Position = UDim2.new(0,0,0,60)
speedBtn.Size = UDim2.new(0,160,0,30)
speedBtn.Text = "SPEED : OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(60,30,30)
Instance.new("UICorner", speedBtn)

speedBtn.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	speedBtn.Text = speedOn and "SPEED : ON" or "SPEED : OFF"
end)

RunService.RenderStepped:Connect(function()
	if not speedOn then return end
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if not hum or not root then return end

	local dir = hum.MoveDirection
	if dir.Magnitude > 0 then
		root.CFrame = root.CFrame + dir.Unit * speed * 0.35
	end
end)

-------------------------------------------------
-- ESP SYSTEM
-------------------------------------------------
local espPlayer = false
local espGen = false
local cache = {}

local function addESP(obj,color)
	if cache[obj] then return end
	local h = Instance.new("Highlight")
	h.Adornee = obj
	h.FillColor = color
	h.OutlineColor = color
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = obj
	cache[obj] = h
end

local function clearESP()
	for _,h in pairs(cache) do h:Destroy() end
	cache = {}
end

local function refreshESP()
	clearESP()

	if espPlayer then
		for _,plr in pairs(Players:GetPlayers()) do
			if plr ~= player and plr.Character then
				addESP(plr.Character, Color3.fromRGB(255,80,80))
			end
		end
	end

	if espGen then
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") and v.Name:lower():find("gen") then
				addESP(v, Color3.fromRGB(255,255,0))
			end
		end
	end
end

local y = 100
local function espBtn(name,color,callback)
	local b = Instance.new("TextButton", pages.Main)
	b.Position = UDim2.new(0,0,0,y)
	b.Size = UDim2.new(0,220,0,32)
	b.Text = name.." : OFF"
	b.Font = Enum.Font.Code
	b.TextColor3 = color
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Instance.new("UICorner", b)
	y += 40

	b.MouseButton1Click:Connect(function()
		callback(b)
		refreshESP()
	end)
end

espBtn("ESP PLAYER (KILLER + SURVIVAL)", Color3.fromRGB(255,120,120), function(b)
	espPlayer = not espPlayer
	b.Text = "ESP PLAYER : "..(espPlayer and "ON" or "OFF")
end)

espBtn("ESP GENERATOR", Color3.fromRGB(255,255,120), function(b)
	espGen = not espGen
	b.Text = "ESP GENERATOR : "..(espGen and "ON" or "OFF")
end)

-------------------------------------------------
-- INFO
-------------------------------------------------
local info = Instance.new("TextLabel", pages.Info)
info.Size = UDim2.new(1,0,1,0)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Font = Enum.Font.Code
info.TextColor3 = Color3.new(1,1,1)
info.Text =
"SLKS GAMING HUB V0.1\n\n"..
"- Teleport Speed (điều khiển mới chạy)\n"..
"- ESP Player (Killer + Survival)\n"..
"- ESP Generator\n\n"..
"Made for Delta / Mobile"

-------------------------------------------------
-- MIN / CLOSE
-------------------------------------------------
local mini = false
minBtn.MouseButton1Click:Connect(function()
	mini = not mini
	for _,v in pairs(Menu:GetChildren()) do
		if v ~= header and v ~= minBtn and v ~= closeBtn then
			if v:IsA("GuiObject") then
				v.Visible = not mini
			end
		end
	end
	Menu.Size = mini and UDim2.new(0,450,0,40) or UDim2.new(0,450,0,300)
end)

closeBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)
