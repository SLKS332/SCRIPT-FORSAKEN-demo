-- 🌸 SLK GAMING HUB | DELTA FIX
-- ĐƯỢC LÀM BY SLK GAMING

local Players = game:GetService("Players")
local player = Players.LocalPlayer

--------------------------------------------------
-- CLEANUP (KHÔNG RETURN – XÓA HUB CŨ NẾU CÓ)
--------------------------------------------------
pcall(function()
	local pg = player:WaitForChild("PlayerGui")
	if pg:FindFirstChild("SLK_GAMING_HUB") then
		pg.SLK_GAMING_HUB:Destroy()
	end
end)

--------------------------------------------------
-- GUI ROOT (KHÔNG MẤT KHI CHẾT)
--------------------------------------------------
local Gui = Instance.new("ScreenGui")
Gui.Name = "SLK_GAMING_HUB"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- 🌸 LOADING (HỒNG + BAR + % RIÊNG)
--------------------------------------------------
local bg = Instance.new("Frame", Gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(255,190,215)

local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0,400,0,230)
box.Position = UDim2.new(0.5,-200,0.5,-115)
box.BackgroundColor3 = Color3.fromRGB(255,225,235)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,22)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,20)
title.BackgroundTransparency = 1
title.Text = "💗 SLK GAMING HUB 💗"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,90,150)

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(0.85,0,0,18)
barBG.Position = UDim2.new(0.075,0,0,110)
barBG.BackgroundColor3 = Color3.fromRGB(255,200,220)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,110,170)
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1,0,0,30)
percent.Position = UDim2.new(0,0,0,145)
percent.BackgroundTransparency = 1
percent.Font = Enum.Font.Gotham
percent.TextSize = 16
percent.TextColor3 = Color3.fromRGB(255,90,150)
percent.Text = "Loading... 0%"

for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	percent.Text = "Loading... "..i.."%"
	task.wait(0.02)
end
bg:Destroy()

--------------------------------------------------
-- 🎀 MENU
--------------------------------------------------
local Menu = Instance.new("Frame", Gui)
Menu.Size = UDim2.new(0,520,0,340)
Menu.Position = UDim2.new(0.5,-260,0.5,-170)
Menu.BackgroundColor3 = Color3.fromRGB(255,220,235)
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,26)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(255,120,170)
stroke.Thickness = 3

local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,0,0,50)
header.BackgroundTransparency = 1
header.Text = "🌸 SLK GAMING HUB 🌸"
header.Font = Enum.Font.GothamBold
header.TextSize = 22
header.TextColor3 = Color3.fromRGB(255,90,150)

--------------------------------------------------
-- 🔘 NÚT TRÒN
--------------------------------------------------
local function circleBtn(text,x,color)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,32,0,32)
	b.Position = UDim2.new(1,x,0,10)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 16
	b.BackgroundColor3 = color
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
	return b
end

local minBtn = circleBtn("-", -80, Color3.fromRGB(255,150,190))
local closeBtn = circleBtn("X", -40, Color3.fromRGB(255,110,150))

--------------------------------------------------
-- 📂 TABS
--------------------------------------------------
local tabs = {"INFO","FARM","PLAYER","SETTINGS"}
local pages = {}

local function makeTab(name,x)
	local b = Instance.new("TextButton", Menu)
	b.Size = UDim2.new(0,110,0,32)
	b.Position = UDim2.new(0,x,0,60)
	b.Text = name
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(255,90,150)
	b.BackgroundColor3 = Color3.fromRGB(255,200,220)
	Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
	return b
end

local tabBtns = {}
local startX = 20
for i,name in ipairs(tabs) do
	tabBtns[name] = makeTab(name, startX + (i-1)*120)
end

local function makePage()
	local f = Instance.new("Frame", Menu)
	f.Size = UDim2.new(1,-40,1,-120)
	f.Position = UDim2.new(0,20,0,100)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

for _,name in ipairs(tabs) do
	pages[name] = makePage()
end
pages.INFO.Visible = true

local function switch(name)
	for _,p in pairs(pages) do p.Visible = false end
	pages[name].Visible = true
end

for name,btn in pairs(tabBtns) do
	btn.MouseButton1Click:Connect(function()
		switch(name)
	end)
end

--------------------------------------------------
-- 📄 INFO
--------------------------------------------------
local info = Instance.new("TextLabel", pages.INFO)
info.Size = UDim2.new(1,0,1,0)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Text = "SLK GAMING HUB\nForsaken Roblox\n\nĐƯỢC LÀM BY SLK GAMING\n\n🌸 Cute Pink Edition"
info.Font = Enum.Font.Gotham
info.TextSize = 16
info.TextColor3 = Color3.fromRGB(255,90,150)

--------------------------------------------------
-- ➖ THU NHỎ
--------------------------------------------------
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _,v in pairs(Menu:GetChildren()) do
		if v ~= header and v ~= minBtn and v ~= closeBtn then
			v.Visible = not minimized
		end
	end
	Menu.Size = minimized and UDim2.new(0,520,0,50) or UDim2.new(0,520,0,340)
end)

--------------------------------------------------
-- ❌ XÁC NHẬN ĐÓNG
--------------------------------------------------
closeBtn.MouseButton1Click:Connect(function()
	local confirm = Instance.new("Frame", Gui)
	confirm.Size = UDim2.new(0,320,0,160)
	confirm.Position = UDim2.new(0.5,-160,0.5,-80)
	confirm.BackgroundColor3 = Color3.fromRGB(255,225,235)
	Instance.new("UICorner", confirm).CornerRadius = UDim.new(0,20)

	local txt = Instance.new("TextLabel", confirm)
	txt.Size = UDim2.new(1,-20,0,60)
	txt.Position = UDim2.new(0,10,0,15)
	txt.BackgroundTransparency = 1
	txt.TextWrapped = true
	txt.Text = "😖 Bạn thực sự muốn rời khỏi?"
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 16
	txt.TextColor3 = Color3.fromRGB(255,90,150)

	local yes = Instance.new("TextButton", confirm)
	yes.Size = UDim2.new(0,120,0,36)
	yes.Position = UDim2.new(0.1,0,1,-50)
	yes.Text = "Có"
	yes.Font = Enum.Font.GothamBold
	yes.BackgroundColor3 = Color3.fromRGB(255,120,170)
	Instance.new("UICorner", yes).CornerRadius = UDim.new(1,0)

	local no = Instance.new("TextButton", confirm)
	no.Size = UDim2.new(0,120,0,36)
	no.Position = UDim2.new(0.55,0,1,-50)
	no.Text = "Ở lại"
	no.Font = Enum.Font.GothamBold
	no.BackgroundColor3 = Color3.fromRGB(255,170,200)
	Instance.new("UICorner", no).CornerRadius = UDim.new(1,0)

	yes.MouseButton1Click:Connect(function()
		Gui:Destroy()
	end)
	no.MouseButton1Click:Connect(function()
		confirm:Destroy()
	end)
end)
