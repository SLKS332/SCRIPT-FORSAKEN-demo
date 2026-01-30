--[[ 
SLK GAMING HUB | FORSAKEN
FULL UI + CORE FIX
Made by SLK GAMING
Tested Delta Executor
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- chống exec trùng
if getgenv().SLK_HUB_LOADED then return end
getgenv().SLK_HUB_LOADED = true

-- STATE (không mất khi chết)
getgenv().SLK_STATE = getgenv().SLK_STATE or {
    Speed = 16,
    SpeedOn = false,
    ESPPlayer = false,
    AutoFix = false,
    FixDelay = 2
}

-------------------------------------------------
-- LOADING
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui", player.PlayerGui)
LoadingGui.ResetOnSpawn = false

local LFrame = Instance.new("Frame", LoadingGui)
LFrame.Size = UDim2.new(0,300,0,120)
LFrame.Position = UDim2.new(0.5,-150,0.5,-60)
LFrame.BackgroundColor3 = Color3.fromRGB(255,180,220)
Instance.new("UICorner", LFrame).CornerRadius = UDim.new(0,20)

local LText = Instance.new("TextLabel", LFrame)
LText.Size = UDim2.new(1,0,1,0)
LText.BackgroundTransparency = 1
LText.Font = Enum.Font.Code
LText.TextSize = 18
LText.TextColor3 = Color3.new(1,1,1)

for i=1,100 do
    LText.Text = "Loading SLK GAMING HUB...\n"..i.."%"
    task.wait(0.02)
end

LoadingGui:Destroy()

-------------------------------------------------
-- GUI MAIN
-------------------------------------------------
local Gui = Instance.new("ScreenGui", player.PlayerGui)
Gui.ResetOnSpawn = false
Gui.Name = "SLK_HUB"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,520,0,360)
Main.Position = UDim2.new(0.5,-260,0.5,-180)
Main.BackgroundColor3 = Color3.fromRGB(255,190,225)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)

-- Header
local Header = Instance.new("TextLabel", Main)
Header.Size = UDim2.new(1,0,0,45)
Header.BackgroundTransparency = 1
Header.Text = "🌸 SLK GAMING HUB | FORSAKEN 🌸"
Header.Font = Enum.Font.Code
Header.TextSize = 18
Header.TextColor3 = Color3.new(1,1,1)

-- Close Button
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-40,0,6)
Close.Text = "X"
Close.Font = Enum.Font.Code
Close.TextSize = 18
Close.BackgroundColor3 = Color3.fromRGB(255,90,120)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- Minimize
local Min = Instance.new("TextButton", Main)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-80,0,6)
Min.Text = "-"
Min.Font = Enum.Font.Code
Min.TextSize = 22
Min.BackgroundColor3 = Color3.fromRGB(255,120,160)
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- TABS
-------------------------------------------------
local Tabs = {}
local Pages = {}

local function makeTab(name,x)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0,110,0,32)
    b.Position = UDim2.new(0,x,0,55)
    b.Text = name
    b.Font = Enum.Font.Code
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(255,140,190)
    Instance.new("UICorner", b)
    return b
end

Tabs.Info = makeTab("INFO",20)
Tabs.Farm = makeTab("FARM",140)
Tabs.Player = makeTab("PLAYER",260)
Tabs.Settings = makeTab("SETTINGS",380)

local function makePage()
    local f = Instance.new("Frame", Main)
    f.Size = UDim2.new(1,-40,1,-110)
    f.Position = UDim2.new(0,20,0,95)
    f.BackgroundTransparency = 1
    f.Visible = false
    return f
end

Pages.Info = makePage()
Pages.Farm = makePage()
Pages.Player = makePage()
Pages.Settings = makePage()

local function switch(name)
    for _,p in pairs(Pages) do p.Visible=false end
    Pages[name].Visible=true
end
switch("Info")

for n,b in pairs(Tabs) do
    b.MouseButton1Click:Connect(function()
        switch(n)
    end)
end

-------------------------------------------------
-- INFO
-------------------------------------------------
local InfoText = Instance.new("TextLabel", Pages.Info)
InfoText.Size = UDim2.new(1,0,1,0)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.Text = "SLK GAMING HUB\nMade by SLK GAMING\nCute Pink UI\nNo Reset On Death"
InfoText.Font = Enum.Font.Code
InfoText.TextSize = 16
InfoText.TextColor3 = Color3.new(1,1,1)

-------------------------------------------------
-- PLAYER TAB
-------------------------------------------------
local SpeedLabel = Instance.new("TextLabel", Pages.Player)
SpeedLabel.Size = UDim2.new(1,0,0,25)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.TextColor3 = Color3.new(1,1,1)
SpeedLabel.Font = Enum.Font.Code
SpeedLabel.Text = "Teleport Speed: 16"

local SpeedSlider = Instance.new("TextButton", Pages.Player)
SpeedSlider.Position = UDim2.new(0,0,0,30)
SpeedSlider.Size = UDim2.new(1,0,0,20)
SpeedSlider.Text = "Drag to change (0-50)"
SpeedSlider.BackgroundColor3 = Color3.fromRGB(255,150,200)

SpeedSlider.MouseButton1Down:Connect(function()
    local move
    move = RunService.RenderStepped:Connect(function()
        local x = math.clamp(
            (game:GetService("UserInputService"):GetMouseLocation().X - SpeedSlider.AbsolutePosition.X)
            / SpeedSlider.AbsoluteSize.X,0,1)
        getgenv().SLK_STATE.Speed = math.floor(x*50)
        SpeedLabel.Text = "Teleport Speed: "..getgenv().SLK_STATE.Speed
    end)
    game:GetService("UserInputService").InputEnded:Wait()
    move:Disconnect()
end)

local SpeedToggle = Instance.new("TextButton", Pages.Player)
SpeedToggle.Position = UDim2.new(0,0,0,60)
SpeedToggle.Size = UDim2.new(0,160,0,30)
SpeedToggle.Text = "Teleport Speed : OFF"
SpeedToggle.BackgroundColor3 = Color3.fromRGB(255,120,160)

SpeedToggle.MouseButton1Click:Connect(function()
    getgenv().SLK_STATE.SpeedOn = not getgenv().SLK_STATE.SpeedOn
    SpeedToggle.Text = getgenv().SLK_STATE.SpeedOn and "Teleport Speed : ON" or "Teleport Speed : OFF"
end)

-------------------------------------------------
-- APPLY SPEED (CHỈ KHI DI CHUYỂN)
-------------------------------------------------
RunService.RenderStepped:Connect(function()
    if getgenv().SLK_STATE.SpeedOn then
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            if hum.MoveDirection.Magnitude > 0 then
                hum.WalkSpeed = getgenv().SLK_STATE.Speed
            else
                hum.WalkSpeed = 16
            end
        end
    end
end)

-------------------------------------------------
-- ESP PLAYER (SURVIVAL XANH)
-------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if getgenv().SLK_STATE.ESPPlayer then
            for _,plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and not plr.Character:FindFirstChild("SLK_ESP") then
                    local h = Instance.new("Highlight", plr.Character)
                    h.Name = "SLK_ESP"
                    h.FillColor = Color3.fromRGB(0,255,0)
                    h.OutlineColor = h.FillColor
                end
            end
        end
    end
end)

-------------------------------------------------
-- FARM TAB (AUTO FIX GEN UI)
-------------------------------------------------
local FixLabel = Instance.new("TextLabel", Pages.Farm)
FixLabel.Size = UDim2.new(1,0,0,25)
FixLabel.BackgroundTransparency = 1
FixLabel.TextColor3 = Color3.new(1,1,1)
FixLabel.Font = Enum.Font.Code
FixLabel.Text = "Auto Fix Gen Delay: 2s"

local FixSlider = Instance.new("TextButton", Pages.Farm)
FixSlider.Position = UDim2.new(0,0,0,30)
FixSlider.Size = UDim2.new(1,0,0,20)
FixSlider.Text = "Delay 0 - 10"
FixSlider.BackgroundColor3 = Color3.fromRGB(255,150,200)

FixSlider.MouseButton1Down:Connect(function()
    local move
    move = RunService.RenderStepped:Connect(function()
        local x = math.clamp(
            (game:GetService("UserInputService"):GetMouseLocation().X - FixSlider.AbsolutePosition.X)
            / FixSlider.AbsoluteSize.X,0,1)
        getgenv().SLK_STATE.FixDelay = math.floor(x*10)
        FixLabel.Text = "Auto Fix Gen Delay: "..getgenv().SLK_STATE.FixDelay.."s"
    end)
    game:GetService("UserInputService").InputEnded:Wait()
    move:Disconnect()
end)

-------------------------------------------------
-- CLOSE CONFIRM
-------------------------------------------------
Close.MouseButton1Click:Connect(function()
    if Main:FindFirstChild("Confirm") then return end
    local C = Instance.new("Frame", Main)
    C.Name="Confirm"
    C.Size = UDim2.new(0,300,0,120)
    C.Position = UDim2.new(0.5,-150,0.5,-60)
    C.BackgroundColor3 = Color3.fromRGB(255,150,190)
    Instance.new("UICorner", C).CornerRadius = UDim.new(0,20)

    local T = Instance.new("TextLabel", C)
    T.Size = UDim2.new(1,0,0,60)
    T.BackgroundTransparency = 1
    T.Text = "Bạn thực sự muốn rời khỏi 😖 ?"
    T.TextColor3 = Color3.new(1,1,1)
    T.Font = Enum.Font.Code

    local Yes = Instance.new("TextButton", C)
    Yes.Size = UDim2.new(0,100,0,30)
    Yes.Position = UDim2.new(0,30,1,-40)
    Yes.Text="Rời"
    Yes.BackgroundColor3=Color3.fromRGB(255,90,120)

    local No = Instance.new("TextButton", C)
    No.Size = UDim2.new(0,100,0,30)
    No.Position = UDim2.new(1,-130,1,-40)
    No.Text="Ở lại"
    No.BackgroundColor3=Color3.fromRGB(255,120,160)

    Yes.MouseButton1Click:Connect(function()
        Gui:Destroy()
        getgenv().SLK_HUB_LOADED=false
    end)
    No.MouseButton1Click:Connect(function()
        C:Destroy()
    end)
end)
