--==================================================
-- SLK HUB | CLEAN VERSION (NO MOBILE EXEC BANNER)
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--==================================================
-- 🔥 REMOVE EXECUTOR GUI / BANNER BẨN
--==================================================
for _, v in ipairs(PlayerGui:GetChildren()) do
    if v:IsA("ScreenGui") then
        local n = string.lower(v.Name)
        if n:find("slk") or n:find("hub") or n:find("mobile") then
            v:Destroy()
        end
    end
end

for _, v in ipairs(game:GetDescendants()) do
    if v:IsA("TextLabel") then
        local t = string.lower(v.Text)
        if t:find("slk hub") or t:find("mobile exec") then
            pcall(function()
                v.Parent:Destroy()
            end)
        end
    end
end

--==================================================
-- 🎬 LOADING GUI
--==================================================
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "SLK_Loading"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.45, 0.28)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.fromScale(1,0.3)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.TextColor3 = Color3.fromRGB(255,60,60)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local status = Instance.new("TextLabel", main)
status.Position = UDim2.fromScale(0,0.3)
status.Size = UDim2.fromScale(1,0.2)
status.BackgroundTransparency = 1
status.Text = "Welcome to script"
status.TextColor3 = Color3.fromRGB(200,200,200)
status.Font = Enum.Font.Gotham
status.TextScaled = true

local barBG = Instance.new("Frame", main)
barBG.Position = UDim2.fromScale(0.1,0.6)
barBG.Size = UDim2.fromScale(0.8,0.12)
barBG.BackgroundColor3 = Color3.fromRGB(255,0,0)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", main)
percent.Position = UDim2.fromScale(0,0.75)
percent.Size = UDim2.fromScale(1,0.2)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.Font = Enum.Font.Code
percent.TextScaled = true

--==================================================
-- ⏳ LOADING (5–7s)
--==================================================
local texts = {
    "Welcome to script",
    "Script will load",
    "Script will ready",
    "Okay wait a script",
}

local loadTime = math.random(5,7)
local steps = 100
local stepTime = loadTime / steps

for i = 1, steps do
    bar.Size = UDim2.fromScale(i/100,1)
    percent.Text = i.."%"

    if i % 25 == 0 then
        status.Text = texts[(i/25)%#texts + 1]
    end

    task.wait(stepTime)
end

status.Text = "Thanks for use script"

--==================================================
-- ✨ FADE OUT + SHRINK
--==================================================
TweenService:Create(
    main,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {
        Size = UDim2.fromScale(0.1,0.05),
        BackgroundTransparency = 1
    }
):Play()

for _, v in ipairs(main:GetDescendants()) do
    if v:IsA("TextLabel") then
        TweenService:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    end
end

task.wait(0.9)
gui:Destroy()

--==================================================
-- 🚀 HUB START (CHỖ NÀY GẮN MENU SAU)
--==================================================
print("SLK HUB READY")
