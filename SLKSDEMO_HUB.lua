-- ==============================
-- SLK HUB - MOBILE BLOCK
-- ==============================

local UIS = game:GetService("UserInputService")

-- Detect MOBILE thật
if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled then
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SLK_Mobile_Block"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0, 380, 0, 170)
    Frame.Position = UDim2.new(0.5, -190, 0.5, -85)
    Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    Frame.BorderColor3 = Color3.fromRGB(255,0,0)
    Frame.BorderSizePixel = 2

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 14)
    UICorner.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.BackgroundTransparency = 1
    Title.Text = "SLK HUB"
    Title.Font = Enum.Font.GothamBlack
    Title.TextScaled = true
    Title.TextColor3 = Color3.fromRGB(255,60,60)

    local Text = Instance.new("TextLabel")
    Text.Parent = Frame
    Text.Position = UDim2.new(0, 15, 0, 55)
    Text.Size = UDim2.new(1, -30, 1, -70)
    Text.BackgroundTransparency = 1
    Text.TextWrapped = true
    Text.TextScaled = true
    Text.Font = Enum.Font.GothamBold
    Text.TextColor3 = Color3.fromRGB(230,230,230)
    Text.Text = "SORRY\nSCRIPT NOT WORK ON MOBILE\n\nPLEASE USE PC"

    -- ❌ DỪNG TOÀN BỘ SCRIPT TẠI ĐÂY
    return
end

-- ==============================
-- PC SẼ CHẠY TỪ ĐÂY TRỞ XUỐNG
-- (Loading / Hub bạn gắn sau)
-- ==============================

print("SLK HUB: PC detected, continue...")
