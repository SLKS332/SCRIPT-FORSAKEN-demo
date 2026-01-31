--// SLK HUB | White Version v1.2 (FULL FIX + PLAYER SPEED)
--// Forsaken | ESP Player + ESP Generator + Player Speed
--// By SLK GAMING

---------------- SERVICES ----------------
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
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
Main.BackgroundTransparency = 0.18
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

---------------- TOP BAR -----------------
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,46)
TopBar.BackgroundColor3 = Color3.fromRGB(255,255,255)
TopBar.BackgroundTransparency = 0.55
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
Info.Text = "WELCOME TO SLK HUB 🤍\n\nStatus: Working ✅\nVersion: v1.2"

---------------- PLAYER TAB ----------------
local PlayerFrame = Instance.new("Frame", View)
PlayerFrame.Size = UDim2.new(1,0,1,0)
PlayerFrame.BackgroundTransparency = 1
PlayerFrame.Visible = false

local SpeedOn = false
local SpeedValue = 16

local SpeedBtn = Instance.new("TextButton", PlayerFrame)
SpeedBtn.Size = UDim2.new(0,240,0,38)
SpeedBtn.Position = UDim2.new(0,20,0,30)
SpeedBtn.Text = "SPEED : OFF"
SpeedBtn.Font = Enum.Font.GothamBold
SpeedBtn.TextSize = 14
SpeedBtn.TextColor3 = Color3.new(1,1,1)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
Instance.new("UICorner", SpeedBtn).CornerRadius = UDim.new(0,10)

-- Slider bar
local Bar = Instance.new("Frame", PlayerFrame)
Bar.Size = UDim2.new(0,240,0,8)
Bar.Position = UDim2.new(0,20,0,85)
Bar.BackgroundColor3 = Color3.fromRGB(200,200,200)
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

local Fill = Instance.new("Frame", Bar)
Fill.Size = UDim2.new(0,0,1,0)
Fill.BackgroundColor3 = Color3.fromRGB(80,180,255)
Instance.new("UICorner", Fill).CornerRadius = UDim.new(1,0)

local SpeedText = Instance.new("TextLabel", PlayerFrame)
SpeedText.Position = UDim2.new(0,20,0,100)
SpeedText.Size = UDim2.new(0,240,0,20)
SpeedText.BackgroundTransparency = 1
SpeedText.Font = Enum.Font.Gotham
SpeedText.TextSize = 13
SpeedText.TextColor3 = Color3.fromRGB(70,70,70)
SpeedText.Text = "Speed: 16"

-- Toggle speed
SpeedBtn.MouseButton1Click:Connect(function()
	SpeedOn = not SpeedOn
	if SpeedOn then
		SpeedBtn.Text = "SPEED : ON"
		SpeedBtn.BackgroundColor3 = Color3.fromRGB(80,180,255)
	else
		SpeedBtn.Text = "SPEED : OFF"
		SpeedBtn.BackgroundColor3 = Color3.fromRGB(160,160,160)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end
end)

-- Slider logic (PC + Mobile)
local dragging = false
Bar.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging = true
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

UIS.InputChanged:Connect(function(i)
	if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
		local x = math.clamp((i.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
		Fill.Size = UDim2.new(x,0,1,0)
		SpeedValue = math.floor(x * 100)
		SpeedText.Text = "Speed: "..SpeedValue
	end
end)

-- Apply speed
RunService.RenderStepped:Connect(function()
	if SpeedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
	end
end)

---------------- TABS ----------------
local Tabs = {"INFO","INVISIBLE","👤 PLAYER","TAB 4","TAB 5","TAB 6"}

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
		PlayerFrame.Visible = false

		if name == "INFO" then
			Info.Visible = true
		elseif name == "👤 PLAYER" then
			PlayerFrame.Visible = true
		else
			Info.Visible = true
			Info.Text = name.." đang phát triển 🚧"
		end
	end)
end
