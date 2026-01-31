--==================================================
-- SLK GAMING HUB | MENU ONLY | V1
-- UI FRAME ONLY - NO FUNCTION
--==================================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- tránh load trùng
if getgenv().SLK_MENU_V1 then return end
getgenv().SLK_MENU_V1 = true

--================ GUI =================
local Gui = Instance.new("ScreenGui")
Gui.Name = "SLK_HUB_GUI"
Gui.ResetOnSpawn = false
Gui.Parent = player:WaitForChild("PlayerGui")

--================ MAIN FRAME =================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 460, 0, 300)
Main.Position = UDim2.new(0.5, -230, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- trắng
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

--================ TOP BAR =================
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(235, 235, 235) -- đậm nhẹ
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 18)

-- che bo góc dưới
local Fix = Instance.new("Frame", TopBar)
Fix.Size = UDim2.new(1, 0, 0, 18)
Fix.Position = UDim2.new(0, 0, 1, -18)
Fix.BackgroundColor3 = TopBar.BackgroundColor3
Fix.BorderSizePixel = 0

--================ TITLE =================
local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB  |  by SLK GAMING"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Left
Title.TextColor3 = Color3.fromRGB(40, 40, 40)

--================ VERSION TAG =================
local Version = Instance.new("TextLabel", TopBar)
Version.Size = UDim2.new(0, 90, 0, 26)
Version.Position = UDim2.new(1, -210, 0.5, -13)
Version.BackgroundColor3 = Color3.fromRGB(200, 230, 200)
Version.Text = "v1"
Version.Font = Enum.Font.GothamBold
Version.TextSize = 14
Version.TextColor3 = Color3.fromRGB(40, 120, 40)
Instance.new("UICorner", Version).CornerRadius = UDim.new(1, 0)

--================ BUTTONS =================
local function TopButton(text, x)
	local b = Instance.new("TextButton", TopBar)
	b.Size = UDim2.new(0, 36, 0, 26)
	b.Position = UDim2.new(1, x, 0.5, -13)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 16
	b.BackgroundColor3 = Color3.fromRGB(220,220,220)
	b.TextColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
	return b
end

local MinBtn = TopButton("-", -80)
local CloseBtn = TopButton("X", -40)

--================ CONTENT =================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 0, 0, 42)
Content.Size = UDim2.new(1, 0, 1, -42)
Content.BackgroundTransparency = 1

--================ BUTTON LOGIC =================
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,460,0,42) or UDim2.new(0,460,0,300)
end)

CloseBtn.MouseButton1Click:Connect(function()
	Gui:Destroy()
	getgenv().SLK_MENU_V1 = nil
end)

print("SLK HUB MENU V1 LOADED")
