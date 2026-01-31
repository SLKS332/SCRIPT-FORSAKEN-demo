-- 🔥 SLK HUB | MOBILE ONLY | FIX DISAPPEAR

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = Players.LocalPlayer
while not player do
    task.wait()
    player = Players.LocalPlayer
end

-- =====================
-- ❌ BLOCK PC / WEB
-- =====================
if not UIS.TouchEnabled then
    player:Kick(
        "SLK HUB\n\n" ..
        "PC version is locked.\n" ..
        "Please wait for V1."
    )
    return
end

-- =====================
-- 📱 LOADING GUI
-- =====================
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_LOADING"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.fromScale(0.5,0.5)
frame.Size = UDim2.fromScale(0.65,0.25)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,20)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.35)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(0,255,100)

local percent = Instance.new("TextLabel", frame)
percent.Position = UDim2.fromScale(0,0.4)
percent.Size = UDim2.fromScale(1,0.25)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.Gotham
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(255,255,255)

local status = Instance.new("TextLabel", frame)
status.Position = UDim2.fromScale(0,0.7)
status.Size = UDim2.fromScale(1,0.2)
status.BackgroundTransparency = 1
status.Text = "Loading..."
status.Font = Enum.Font.Gotham
status.TextScaled = true
status.TextColor3 = Color3.fromRGB(180,180,180)

-- =====================
-- 🔢 COUNT 0 → 100
-- =====================
for i = 0,100 do
    percent.Text = i .. "%"
    task.wait(0.035)
end

status.Text = "Loaded!"
task.wait(0.4)

-- =====================
-- ✨ TWEEN BIẾN MẤT
-- =====================
local tween = TweenService:Create(
    frame,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {
        Size = UDim2.fromScale(0,0),
        BackgroundTransparency = 1
    }
)

tween:Play()
tween.Completed:Wait()

-- 🔥 XÓA HẲN GUI
gui:Destroy()

-- =====================
-- 🚀 VÀO HUB (PLACEHOLDER)
-- =====================
print("SLK HUB loaded successfully (Mobile)")
