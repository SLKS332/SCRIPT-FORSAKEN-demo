--// SLK HUB UI FRAME ONLY
--// Version v1 | By SLK GAMING

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Remove old
if PlayerGui:FindFirstChild("SLK_HUB_UI") then
    PlayerGui.SLK_HUB_UI:Destroy()
end

local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "SLK_HUB_UI"
gui.ResetOnSpawn = false

-- MAIN
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5, -260, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.Active = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- TOP BAR (DRAG)
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,42)
Top.BackgroundColor3 = Color3.fromRGB(235,235,235)
Top.BackgroundTransparency = 0.05
Top.BorderSizePixel = 0
Top.Active = true
Top.Draggable = true

Instance.new("UICorner", Top).CornerRadius = UDim.new(0,16)

-- TITLE
local Title = Instance.new("TextLabel", Top)
Title.Text = "SLK Hub | By SLK GAMING"
Title.Font = Enum.Font.GothamMedium
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(40,40,40)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,14,0,0)
Title.Size = UDim2.new(0,250,1,0)
Title.TextXAlignment = Left

-- VERSION
local Version = Instance.new("TextLabel", Top)
Version.Text = "Version v1"
Version.Font = Enum.Font.Gotham
Version.TextSize = 12
Version.TextColor3 = Color3.fromRGB(90,90,90)
Version.BackgroundColor3 = Color3.fromRGB(220,220,220)
Version.BackgroundTransparency = 0.2
Version.Position = UDim2.new(0.55,0,0.2,0)
Version.Size = UDim2.new(0,90,0,24)
Instance.new("UICorner", Version).CornerRadius = UDim.new(1,0)

-- MINUS
local Min = Instance.new("TextButton", Top)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.Size = UDim2.new(0,30,0,26)
Min.Position = UDim2.new(1,-70,0.2,0)
Min.BackgroundColor3 = Color3.fromRGB(220,220,220)
Min.BackgroundTransparency = 0.1
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

-- CLOSE
local Close = Instance.new("TextButton", Top)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.Size = UDim2.new(0,30,0,26)
Close.Position = UDim2.new(1,-35,0.2,0)
Close.BackgroundColor3 = Color3.fromRGB(230,80,80)
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- LEFT TAB BAR
local Tabs = Instance.new("Frame", Main)
Tabs.Position = UDim2.new(0,0,0,42)
Tabs.Size = UDim2.new(0,48,1,-42)
Tabs.BackgroundColor3 = Color3.fromRGB(245,245,245)
Tabs.BackgroundTransparency = 0.1
Tabs.BorderSizePixel = 0

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,48,0,42)
Content.Size = UDim2.new(1,-48,1,-42)
Content.BackgroundTransparency = 1

-- BUTTON ACTION
local minimized = false
Min.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    Tabs.Visible = not minimized
    Main.Size = minimized and UDim2.new(0,520,0,42) or UDim2.new(0,520,0,320)
end)

Close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
