--==================================================
-- SLK HUB - MOBILE BLOCK (SAFE VERSION)
--==================================================

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

--==================================================
-- GUI
--==================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SLK_MobileBlock"
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

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,18)

-- TITLE
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0.25,0)
Title.BackgroundTransparency = 1
Title.Text = "SLK HUB"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,0,0)

-- MAIN TEXT
local MainText = Instance.new("TextLabel", Frame)
MainText.Size = UDim2.new(1,-20,0.35,0)
MainText.Position = UDim2.new(0,10,0.28,0)
MainText.BackgroundTransparency = 1
MainText.TextWrapped = true
MainText.Font = Enum.Font.GothamBold
MainText.TextScaled = true
MainText.TextColor3 = Color3.fromRGB(255,255,255)

-- COUNTDOWN
local Countdown = Instance.new("TextLabel", Frame)
Countdown.Size = UDim2.new(1,0,0.18,0)
Countdown.Position = UDim2.new(0,0,0.78,0)
Countdown.BackgroundTransparency = 1
Countdown.Font = Enum.Font.GothamBold
Countdown.TextScaled = true
Countdown.TextColor3 = Color3.fromRGB(0,170,255)

--==================================================
-- MOBILE MODE
--==================================================
if isMobile then
    MainText.Text = "SORRY\nSCRIPT NOT WORK ON MOBILE\nPLEASE USE PC"

    -- COUNTDOWN 5 -> 0
    for i = 5, 0, -1 do
        Countdown.Text = "Closing in " .. i .. "s"
        task.wait(1)
    end

    Countdown.Text = "Closing..."

    -- TRY FADE
    local closed = false
    pcall(function()
        for t = 0, 1, 0.1 do
            Frame.BackgroundTransparency = t
            Frame.BorderTransparency = t
            Title.TextTransparency = t
            MainText.TextTransparency = t
            Countdown.TextTransparency = t
            task.wait(0.04)
        end
        closed = true
    end)

    -- TRY DESTROY
    task.wait(0.2)
    pcall(function()
        ScreenGui:Destroy()
    end)

    -- FAILSAFE CHECK
    task.wait(1.5)
    if ScreenGui.Parent ~= nil then
        -- ❌ KHÔNG TẮT ĐƯỢC → THÔNG BÁO CUỐI
        Frame.BackgroundTransparency = 0
        Frame.BorderTransparency = 0
        Title.TextTransparency = 0
        MainText.TextTransparency = 0
        Countdown.TextTransparency = 0

        MainText.Text =
            "SORRY AGAIN.\n" ..
            "CLOSING FAILED.\n" ..
            "PLEASE LEAVE THE GAME."

        Countdown.Text = "Close manually"
        Countdown.TextColor3 = Color3.fromRGB(255,80,80)
    end

    return
end

--==================================================
-- PC MODE
--==================================================
MainText.Text = "LOADING..."
Countdown.Text = "Please wait..."

-- loadstring(game:HttpGet("LINK_PC_MENU"))()
