-- ==============================
-- SLK HUB - MOBILE BLOCK + COUNTDOWN
-- ==============================

local UIS = game:GetService("UserInputService")

if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled then
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SLK_Mobile_Block"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0, 380, 0, 190)
    Frame.Position = UDim2.new(0.5, -190, 0.5, -95)
    Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    Frame.BorderColor3 = Color3.fromRGB(255,0,0)
    Frame.BorderSizePixel = 2

    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 14)

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.Text = "SLK HUB"
    Title.Font = Enum.Font.GothamBlack
    Title.TextScaled = true
    Title.TextColor3 = Color3.fromRGB(255,60,60)

    local Text = Instance.new("TextLabel")
    Text.Parent = Frame
    Text.Position = UDim2.new(0, 15, 0, 45)
    Text.Size = UDim2.new(1, -30, 0, 80)
    Text.BackgroundTransparency = 1
    Text.TextWrapped = true
    Text.TextScaled = true
    Text.Font = Enum.Font.GothamBold
    Text.TextColor3 = Color3.fromRGB(230,230,230)
    Text.Text = "SORRY\nSCRIPT NOT WORK ON MOBILE\nPLEASE USE PC"

    -- ⏱️ COUNTDOWN TEXT
    local Countdown = Instance.new("TextLabel")
    Countdown.Parent = Frame
    Countdown.Position = UDim2.new(0, 0, 1, -45)
    Countdown.Size = UDim2.new(1, 0, 0, 35)
    Countdown.BackgroundTransparency = 1
    Countdown.Font = Enum.Font.GothamBold
    Countdown.TextScaled = true
    Countdown.TextColor3 = Color3.fromRGB(120,180,255)

    -- ĐẾM NGƯỢC 5 → 0
    for i = 5, 0, -1 do
        Countdown.Text = "Closing in " .. i .. "s"
        task.wait(1)
    end

    -- Hiệu ứng mờ dần
    for i = 0, 1, 0.1 do
        Frame.BackgroundTransparency = i
        Frame.BorderTransparency = i
        Title.TextTransparency = i
        Text.TextTransparency = i
        Countdown.TextTransparency = i
        task.wait(0.05)
    end

    ScreenGui:Destroy()
    return -- ❌ MOBILE DỪNG TẠI ĐÂY
end

-- ==============================
-- PC SẼ CHẠY TỪ ĐÂY TRỞ XUỐNG
-- ==============================

print("SLK HUB: PC detected, continue...")
