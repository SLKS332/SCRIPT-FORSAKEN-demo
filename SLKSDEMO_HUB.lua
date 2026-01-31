-- SLK HUB | Mobile Allowed - PC Blocked

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- =======================
-- PC / WEB / MICROSOFT → BLOCK
-- =======================
if not UIS.TouchEnabled then
    -- GUI + countdown + kick (giữ nguyên như trước)

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

    local Text = Instance.new("TextLabel", Frame)
    Text.Position = UDim2.new(0,0,0.25,0)
    Text.Size = UDim2.new(1,0,0.45,0)
    Text.BackgroundTransparency = 1
    Text.TextWrapped = true
    Text.TextScaled = true
    Text.Font = Enum.Font.GothamBold
    Text.TextColor3 = Color3.fromRGB(255,255,255)
    Text.Text = "PC VERSION IS LOCKED\nPLEASE WAIT FOR V1"

    local Count = Instance.new("TextLabel", Frame)
    Count.Position = UDim2.new(0,0,0.72,0)
    Count.Size = UDim2.new(1,0,0.25,0)
    Count.BackgroundTransparency = 1
    Count.Font = Enum.Font.GothamBold
    Count.TextScaled = true
    Count.TextColor3 = Color3.fromRGB(120,180,255)

    for i = 5, 0, -1 do
        Count.Text = "Closing in "..i.."s"
        task.wait(1)
    end

    player:Kick("SLK HUB\n\nPC version is locked.\nPlease wait for V1.")
    return
end

-- =======================
-- ⬇️ MOBILE TIẾP TỤC CHẠY Ở ĐÂY
-- =======================

print("SLK HUB: Mobile exec success")

-- 👉 TỪ ĐÂY TRỞ XUỐNG
-- bạn đặt LOADING + MENU của SLK HUB
