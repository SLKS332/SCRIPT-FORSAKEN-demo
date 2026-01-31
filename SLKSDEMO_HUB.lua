--==================================================
-- SLK HUB - ANTI MOBILE LOADER
--==================================================

-- 📱 CHECK MOBILE
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

--==================================================
-- GUI CREATE
--==================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromScale(0.45, 0.3)
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
Frame.BorderColor3 = Color3.fromRGB(255,0,0)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui
Frame.Name = "MainFrame"
Frame.BackgroundTransparency = 0

-- ROUND CORNER
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 18)

--==================================================
-- TITLE
--==================================================
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0.25,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,0,0)
Title.Parent = Frame

--==================================================
-- MAIN TEXT
--==================================================
local MainText = Instance.new("TextLabel")
MainText.Size = UDim2.new(1,-20,0.35,0)
MainText.Position = UDim2.new(0,10,0.28,0)
MainText.BackgroundTransparency = 1
MainText.TextWrapped = true
MainText.Text = "SORRY\nSCRIPT NOT WORK ON MOBILE\nPLEASE USE PC"
MainText.Font = Enum.Font.GothamBold
MainText.TextScaled = true
MainText.TextColor3 = Color3.fromRGB(255,255,255)
MainText.Parent = Frame

--==================================================
-- COUNTDOWN TEXT
--==================================================
local Countdown = Instance.new("TextLabel")
Countdown.Size = UDim2.new(1,0,0.18,0)
Countdown.Position = UDim2.new(0,0,0.78,0)
Countdown.BackgroundTransparency = 1
Countdown.Text = "Closing in 5s"
Countdown.Font = Enum.Font.GothamBold
Countdown.TextScaled = true
Countdown.TextColor3 = Color3.fromRGB(0,170,255)
Countdown.Parent = Frame

--==================================================
-- MOBILE BEHAVIOR
--==================================================
if isMobile then
    -- ⏱️ COUNTDOWN 5 → 0
    for i = 5, 0, -1 do
        Countdown.Text = "Closing in " .. i .. "s"
        task.wait(1)
    end

    Countdown.Text = "Closing..."

    -- 🌫️ FADE OUT (SAFE)
    pcall(function()
        for t = 0, 1, 0.1 do
            Frame.BackgroundTransparency = t
            Frame.BorderTransparency = t
            Title.TextTransparency = t
            MainText.TextTransparency = t
            Countdown.TextTransparency = t
            task.wait(0.04)
        end
    end)

    -- 💥 DESTROY CHẮC CHẮN
    task.wait(0.2)
    ScreenGui:Destroy()
    return
end

--==================================================
-- 🖥️ PC: CONTINUE SCRIPT
--==================================================

-- Nếu là PC thì đổi text (ví dụ)
MainText.Text = "LOADING..."
Countdown.Text = "Please wait..."

-- 🔽 BẠN GẮN LOADING / MENU HUB Ở DƯỚI ĐÂY 🔽
-- loadstring(game:HttpGet("LINK_MENU_PC"))()
