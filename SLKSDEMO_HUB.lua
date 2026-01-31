-- SLK HUB | Stable Mobile Check

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- 🔒 ĐỢI GAME LOAD XONG
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- 🔒 ĐỢI LOCALPLAYER
local player = Players.LocalPlayer
while not player do
    task.wait()
    player = Players.LocalPlayer
end

-- =======================
-- PC / WEB / MICROSOFT → BLOCK
-- =======================
if not UIS.TouchEnabled then
    player:Kick(
        "SLK HUB\n\n" ..
        "PC version is locked.\n" ..
        "Please wait for V1 release."
    )
    return
end

-- =======================
-- ⬇️ MOBILE CHẠY TỪ ĐÂY
-- =======================
print("SLK HUB: Mobile exec success")

-- TEST CHO BẠN THẤY CHẮC CHẮN CHẠY
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_TEST"
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel", gui)
label.Size = UDim2.fromScale(0.8, 0.2)
label.Position = UDim2.fromScale(0.1, 0.4)
label.BackgroundColor3 = Color3.fromRGB(0,0,0)
label.TextColor3 = Color3.fromRGB(0,255,100)
label.TextScaled = true
label.Text = "SLK HUB\nMOBILE EXEC OK"
