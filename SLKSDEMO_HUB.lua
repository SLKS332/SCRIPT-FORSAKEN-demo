-- SLK HUB | Mobile Only (PC Locked Until V1)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- =======================
-- CHECK MOBILE
-- =======================
if UIS.TouchEnabled then
    -- Mobile (Android + iOS) được phép
    print("SLK HUB: Mobile detected")
    return
end

-- =======================
-- PC / WEB / MICROSOFT
-- =======================

-- ===== GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SLK_PC_Block"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.fromScale(0.55, 0.35)
Frame.Position = UDim2.fromScale(0.225, 0.325)
Frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
Frame.BorderColor3 = Color3.fromRGB(255,0,0)
Frame.BorderSizePixel = 2

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0.25,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB"
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,80,80)

local MainText = Instance.new("TextLabel", Frame)
MainText.Position = UDim2.new(0,0,0.25,0)
MainText.Size = UDim2.new(1,0,0.45,0)
MainText.BackgroundTransparency = 1
MainText.TextWrapped = true
MainText.TextScaled = true
MainText.Font = Enum.Font.GothamBold
MainText.TextColor3 = Color3.fromRGB(255,255,255)
MainText.Text =
    "PC VERSION IS LOCKED\n" ..
    "PLEASE WAIT FOR V1 RELEASE"

local Countdown = Instance.new("TextLabel", Frame)
Countdown.Position = UDim2.new(0,0,0.72,0)
Countdown.Size = UDim2.new(1,0,0.25,0)
Countdown.BackgroundTransparency = 1
Countdown.Font = Enum.Font.GothamBold
Countdown.TextScaled = true
Countdown.TextColor3 = Color3.fromRGB(120,180,255)

-- ===== COUNTDOWN =====
for i = 5, 0, -1 do
    Countdown.Text = "Closing in "..i.."s"
    task.wait(1)
end

-- ===== FINAL TEXT =====
MainText.Text =
    "THANK YOU FOR WAITING\n" ..
    "PC SUPPORT WILL OPEN IN V1 ❤️"

Countdown.Text = "Closing..."
task.wait(1.5)

-- ===== FADE OUT =====
TweenService:Create(
    Frame,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1, BorderTransparency = 1}
):Play()

for _,v in ipairs(Frame:GetDescendants()) do
    if v:IsA("TextLabel") then
        TweenService:Create(
            v,
            TweenInfo.new(0.8),
            {TextTransparency = 1}
        ):Play()
    end
end

task.wait(1)

-- ===== KICK =====
player:Kick(
    "SLK HUB\n\n" ..
    "PC version is locked.\n" ..
    "Please wait for V1 release."
)
