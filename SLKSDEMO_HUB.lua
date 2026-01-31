-- SLK HUB | Block PC Only
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ===== CHECK PC =====
local isPC = UIS.KeyboardEnabled and not UIS.TouchEnabled

if isPC then
    -- ===== GUI =====
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SLK_Block_PC"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.fromScale(0.5, 0.35)
    Frame.Position = UDim2.fromScale(0.25, 0.325)
    Frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
    Frame.BorderColor3 = Color3.fromRGB(255,0,0)
    Frame.BorderSizePixel = 2

    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(0,12)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0.25,0)
    Title.BackgroundTransparency = 1
    Title.Text = "SLK HUB"
    Title.TextColor3 = Color3.fromRGB(255,60,60)
    Title.Font = Enum.Font.GothamBlack
    Title.TextScaled = true

    local MainText = Instance.new("TextLabel", Frame)
    MainText.Position = UDim2.new(0,0,0.25,0)
    MainText.Size = UDim2.new(1,0,0.45,0)
    MainText.BackgroundTransparency = 1
    MainText.TextWrapped = true
    MainText.TextScaled = true
    MainText.Font = Enum.Font.GothamBold
    MainText.TextColor3 = Color3.fromRGB(255,255,255)
    MainText.Text =
        "SORRY\n" ..
        "SCRIPT NOT WORK ON PC\n" ..
        "PLEASE USE MOBILE"

    local Countdown = Instance.new("TextLabel", Frame)
    Countdown.Position = UDim2.new(0,0,0.72,0)
    Countdown.Size = UDim2.new(1,0,0.25,0)
    Countdown.BackgroundTransparency = 1
    Countdown.TextColor3 = Color3.fromRGB(120,180,255)
    Countdown.Font = Enum.Font.GothamBold
    Countdown.TextScaled = true

    -- ===== COUNTDOWN 5 -> 0 =====
    for i = 5, 0, -1 do
        Countdown.Text = "Closing in "..i.."s"
        task.wait(1)
    end

    -- ===== FINAL TEXT =====
    MainText.Text =
        "SORRY AGAIN.\n" ..
        "CLOSING FAILED.\n" ..
        "PLEASE LEAVE THE GAME."

    Countdown.Text = "Closing..."
    task.wait(1.5)

    -- ===== FADE OUT =====
    local tween = TweenService:Create(
        Frame,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1, BorderTransparency = 1}
    )
    tween:Play()

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
    ScreenGui:Destroy()

    return -- ⛔ CHẶN TOÀN BỘ SCRIPT PHÍA DƯỚI
end

-- ===== MOBILE CHẠY BÌNH THƯỜNG Ở DƯỚI =====
-- loading / menu của bạn đặt ở đây
