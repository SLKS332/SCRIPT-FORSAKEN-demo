-- ==============================
-- SLK HUB - MOBILE BLOCK + COUNTDOWN (FIX)
-- ==============================

local UIS = game:GetService("UserInputService")

if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled then
    
    local CoreGui = game:GetService("CoreGui")

    -- tránh trùng GUI
    if CoreGui:FindFirstChild("SLK_Mobile_Block") then
        CoreGui:FindFirstChild("SLK_Mobile_Block"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SLK_Mobile_Block"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0, 380, 0, 200)
    Frame.Position = UDim2.new(0.5, -190, 0.5, -100)
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

    local MainText = Instance.new("TextLabel")
    MainText.Parent = Frame
    MainText.Position = UDim2.new(0, 15, 0, 45)
    MainText.Size = UDim2.new(1, -30, 0, 90)
    MainText.BackgroundTransparency = 1
    MainText.TextWrapped = true
    MainText.TextScaled = true
    MainText.Font = Enum.Font.GothamBold
    MainText.TextColor3 = Color3.fromRGB(230,230,230)
    MainText.Text = "SORRY\nSCRIPT NOT WORK ON MOBILE\nPLEASE USE PC"

    -- 🔢 COUNTDOWN (FIX CHẮC HIỆN)
    local Countdown = Instance.new("TextLabel")
    Countdown.Parent = Frame
    Countdown.Position = UDim2.new(0, 0, 1, -45)
    Countdown.Size = UDim2.new(1, 0, 0, 35)
    Countdown.BackgroundTransparency = 1
    Countdown.Font = Enum.Font.GothamBold
    Countdown.TextScaled = true
    Countdown.TextColor3 = Color3.fromRGB(120,180,255)
    Countdown.Text = "Closing in 5s"

    -- ⏱️ ĐẾM NGƯỢC 5 → 0 (CHẮC CHẮN UPDATE)
    for i = 5, 0, -1 do
        Countdown.Text = "Closing in " .. tostring(i) .. "s"
        Countdown.Visible = true
        task.wait(1)
    end

    -- 🌫️ MỜ DẦN
    for i = 0, 1, 0.1 do
        Frame.BackgroundTransparency = i
        Frame.BorderTransparency = i
        Title.TextTransparency = i
        MainText.TextTransparency = i
        Countdown.TextTransparency = i
        task.wait(0.05)
    end

    ScreenGui:Destroy()
    return -- ❌ MOBILE DỪNG HẲN
end

-- ==============================
-- PC CHẠY TỪ ĐÂY
-- ==============================
print("SLK HUB: PC detected, continue...")
