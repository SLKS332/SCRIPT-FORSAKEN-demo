-- SLKS GAMING | DEMO HUB V0.1 (FIXED)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-------------------------------------------------
-- MENU GUI
-------------------------------------------------
local MenuGui = Instance.new("ScreenGui", player.PlayerGui)
MenuGui.ResetOnSpawn = false
MenuGui.IgnoreGuiInset = true

local Menu = Instance.new("Frame", MenuGui)
Menu.Size = UDim2.new(0,420,0,260)
Menu.Position = UDim2.new(0.5,-210,0.5,-130)
Menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
Menu.BackgroundTransparency = 0.3
Menu.Active = true
Menu.Draggable = true
Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke", Menu)
stroke.Color = Color3.fromRGB(0,255,140)
stroke.Thickness = 2

-------------------------------------------------
-- HEADER (LUÔN HIỆN)
-------------------------------------------------
local header = Instance.new("TextLabel", Menu)
header.Size = UDim2.new(1,-80,0,60)
header.Position = UDim2.new(0,10,0,0)
header.BackgroundTransparency = 1
header.Text = "SLKS GAMING\nBY SLKS GAMING\nVERSION DEMO V0.1"
header.Font = Enum.Font.Code
header.TextSize = 16
header.TextColor3 = Color3.fromRGB(0,255,140)
header.TextXAlignment = Left
header.TextYAlignment = Center

-------------------------------------------------
-- BUTTONS (- / X)
-------------------------------------------------
local minBtn = Instance.new("TextButton", Menu)
minBtn.Size = UDim2.new(0,30,0,30)
minBtn.Position = UDim2.new(1,-70,0,15)
minBtn.Text = "-"
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 22
minBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
minBtn.TextColor3 = Color3.fromRGB(0,255,140)
Instance.new("UICorner", minBtn)

local closeBtn = Instance.new("TextButton", Menu)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,15)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(60,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", closeBtn)

-------------------------------------------------
-- CONTENT FRAME (ẨN / HIỆN)
-------------------------------------------------
local Content = Instance.new("Frame", Menu)
Content.Size = UDim2.new(1,-20,1,-80)
Content.Position = UDim2.new(0,10,0,70)
Content.BackgroundTransparency = 1

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local infoBtn = Instance.new("TextButton", Content)
infoBtn.Size = UDim2.new(0,100,0,30)
infoBtn.Position = UDim2.new(0,0,0,0)
infoBtn.Text = "INFO"
infoBtn.Font = Enum.Font.Code
infoBtn.TextSize = 16
infoBtn.TextColor3 = Color3.fromRGB(0,255,140)
infoBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", infoBtn)

local infoFrame = Instance.new("Frame", Content)
infoFrame.Size = UDim2.new(1,0,1,-40)
infoFrame.Position = UDim2.new(0,0,0,40)
infoFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
infoFrame.BackgroundTransparency = 0.15
infoFrame.Visible = false
Instance.new("UICorner", infoFrame)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1,-20,0,90)
infoText.Position = UDim2.new(0,10,0,10)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.Text = "SLKS GAMING HUB\nDemo V0.1\n\nScript thử nghiệm\nCảm ơn đã sử dụng!"
infoText.Font = Enum.Font.Code
infoText.TextSize = 15
infoText.TextColor3 = Color3.fromRGB(255,255,255)

local yt = Instance.new("TextButton", infoFrame)
yt.Size = UDim2.new(0.45,0,0,35)
yt.Position = UDim2.new(0.03,0,1,-45)
yt.Text = "YouTube"
yt.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", yt)

local dc = Instance.new("TextButton", infoFrame)
dc.Size = UDim2.new(0.45,0,0,35)
dc.Position = UDim2.new(0.52,0,1,-45)
dc.Text = "Discord"
dc.BackgroundColor3 = Color3.fromRGB(60,90,200)
Instance.new("UICorner", dc)

infoBtn.MouseButton1Click:Connect(function()
	infoFrame.Visible = not infoFrame.Visible
end)

-------------------------------------------------
-- MINIMIZE (CÓ NÚT KHÔI PHỤC)
-------------------------------------------------
local minimized = false

local restoreBtn = Instance.new("TextButton", MenuGui)
restoreBtn.Size = UDim2.new(0,50,0,50)
restoreBtn.Position = UDim2.new(0.5,-25,1,-70)
restoreBtn.Text = "SLKS"
restoreBtn.Visible = false
restoreBtn.Font = Enum.Font.Code
restoreBtn.TextSize = 12
restoreBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
restoreBtn.TextColor3 = Color3.fromRGB(0,255,140)
restoreBtn.Active = true
restoreBtn.Draggable = true
Instance.new("UICorner", restoreBtn)

minBtn.MouseButton1Click:Connect(function()
	minimized = true
	Menu.Visible = false
	restoreBtn.Visible = true
end)

restoreBtn.MouseButton1Click:Connect(function()
	minimized = false
	Menu.Visible = true
	restoreBtn.Visible = false
end)

-------------------------------------------------
-- CLOSE CONFIRM
-------------------------------------------------
closeBtn.MouseButton1Click:Connect(function()
	local confirm = Instance.new("Frame", MenuGui)
	confirm.Size = UDim2.new(0,260,0,120)
	confirm.Position = UDim2.new(0.5,-130,0.5,-60)
	confirm.BackgroundColor3 = Color3.fromRGB(15,15,15)
	Instance.new("UICorner", confirm)

	local txt = Instance.new("TextLabel", confirm)
	txt.Size = UDim2.new(1,-20,0,50)
	txt.Position = UDim2.new(0,10,0,10)
	txt.BackgroundTransparency = 1
	txt.Text = "Bạn chắc chắn muốn tắt script?"
	txt.Font = Enum.Font.Code
	txt.TextSize = 16
	txt.TextColor3 = Color3.fromRGB(255,255,255)

	local yes = Instance.new("TextButton", confirm)
	yes.Size = UDim2.new(0.4,0,0,30)
	yes.Position = UDim2.new(0.05,0,1,-40)
	yes.Text = "CÓ"
	yes.BackgroundColor3 = Color3.fromRGB(200,60,60)
	Instance.new("UICorner", yes)

	local no = Instance.new("TextButton", confirm)
	no.Size = UDim2.new(0.4,0,0,30)
	no.Position = UDim2.new(0.55,0,1,-40)
	no.Text = "KHÔNG"
	no.BackgroundColor3 = Color3.fromRGB(60,200,100)
	Instance.new("UICorner", no)

	yes.MouseButton1Click:Connect(function()
		MenuGui:Destroy()
	end)

	no.MouseButton1Click:Connect(function()
		confirm:Destroy()
	end)
end)
