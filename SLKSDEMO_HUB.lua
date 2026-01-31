-- SLK HUB Loading Screen
-- Duration: ~6 seconds

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "SLK_Loading"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.6, 0.6)
frame.Position = UDim2.fromScale(0.2, 0.2)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255,0,0)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.15)
title.Position = UDim2.fromScale(0, 0.25)
title.Text = "SLK HUB"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1

local by = Instance.new("TextLabel", frame)
by.Size = UDim2.fromScale(1, 0.07)
by.Position = UDim2.fromScale(0, 0.4)
by.Text = "By SLK Gaming"
by.TextScaled = true
by.Font = Enum.Font.Gotham
by.TextColor3 = Color3.fromRGB(200,200,200)
by.BackgroundTransparency = 1

-- Loading text
local statusText = Instance.new("TextLabel", frame)
statusText.Size = UDim2.fromScale(1, 0.08)
statusText.Position = UDim2.fromScale(0, 0.6)
statusText.Text = "Welcome to script"
statusText.TextScaled = true
statusText.Font = Enum.Font.Code
statusText.TextColor3 = Color3.fromRGB(255,255,255)
statusText.BackgroundTransparency = 1

-- Percent
local percentText = Instance.new("TextLabel", frame)
percentText.Size = UDim2.fromScale(0.2, 0.08)
percentText.Position = UDim2.fromScale(0.75, 0.6)
percentText.Text = "0%"
percentText.TextScaled = true
percentText.Font = Enum.Font.Code
percentText.TextColor3 = Color3.fromRGB(255,255,255)
percentText.BackgroundTransparency = 1

-- Vertical loading bar
local barHolder = Instance.new("Frame", frame)
barHolder.Size = UDim2.fromScale(0.05, 0.5)
barHolder.Position = UDim2.fromScale(0.05, 0.3)
barHolder.BackgroundColor3 = Color3.fromRGB(255,0,0)

local barFill = Instance.new("Frame", barHolder)
barFill.Size = UDim2.fromScale(1, 0)
barFill.Position = UDim2.fromScale(0, 1)
barFill.AnchorPoint = Vector2.new(0,1)
barFill.BackgroundColor3 = Color3.fromRGB(0,170,255)

-- Binary text
local binary = Instance.new("TextLabel", frame)
binary.Size = UDim2.fromScale(1, 0.06)
binary.Position = UDim2.fromScale(0, 0.75)
binary.Text = "1010101010101010101010101"
binary.TextScaled = true
binary.Font = Enum.Font.Code
binary.TextColor3 = Color3.fromRGB(0,170,255)
binary.BackgroundTransparency = 1

-- Binary animation
task.spawn(function()
	while gui.Parent do
		binary.Position = UDim2.fromScale(-0.1, 0.75)
		TweenService:Create(binary, TweenInfo.new(4, Enum.EasingStyle.Linear), {
			Position = UDim2.fromScale(0.1, 0.75)
		}):Play()
		task.wait(4)
	end
end)

-- Loading logic
local messages = {
	"Welcome to script",
	"Script will done",
	"Script will ready",
	"Okay wait a script"
}

local totalTime = 6
for i = 1, 100 do
	barFill.Size = UDim2.fromScale(1, i/100)
	percentText.Text = i .. "%"

	if i == 25 then statusText.Text = messages[2] end
	if i == 50 then statusText.Text = messages[3] end
	if i == 75 then statusText.Text = messages[4] end

	task.wait(totalTime / 100)
end

statusText.Text = "Thanks for use script"

-- Hiệu ứng nhỏ dần + mờ dần
local tweenInfo = TweenInfo.new(
	1.2, -- thời gian (chậm, mượt)
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local fadeGoals = {
	BackgroundTransparency = 1
}

-- Fade toàn bộ UI
for _, v in ipairs(gui:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
	elseif v:IsA("Frame") then
		TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
	end
end

-- Thu nhỏ khung
TweenService:Create(frame, tweenInfo, {
	Size = UDim2.fromScale(0.4, 0.4),
	Position = UDim2.fromScale(0.3, 0.3)
}):Play()

task.wait(1.3)
gui:Destroy()

--// SLK HUB MENU - ANDROID EXEC SAFE VERSION
--// GUARANTEED EXEC - NO TOUCH API - NO MOUSE API

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

------------------------------------------------
-- GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB_MENU"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- MAIN
------------------------------------------------
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.6,0.5)
main.Position = UDim2.fromScale(0.2,0.25)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0.3
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

------------------------------------------------
-- TOP
------------------------------------------------
local top = Instance.new("Frame", main)
top.Size = UDim2.fromScale(1,0.18)
top.BackgroundColor3 = Color3.fromRGB(25,25,25)
top.BackgroundTransparency = 0.2
Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.fromScale(0.6,1)
title.Position = UDim2.fromScale(0.04,0)
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local min = Instance.new("TextButton", top)
min.Size = UDim2.fromScale(0.08,0.6)
min.Position = UDim2.fromScale(0.78,0.2)
min.Text = "-"
min.Font = Enum.Font.GothamBold
min.TextScaled = true
min.BackgroundColor3 = Color3.fromRGB(80,80,80)
Instance.new("UICorner", min).CornerRadius = UDim.new(1,0)

local close = Instance.new("TextButton", top)
close.Size = UDim2.fromScale(0.08,0.6)
close.Position = UDim2.fromScale(0.88,0.2)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(180,60,60)
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- CONTENT
------------------------------------------------
local content = Instance.new("Frame", main)
content.Size = UDim2.fromScale(0.9,0.7)
content.Position = UDim2.fromScale(0.05,0.25)
content.BackgroundTransparency = 1

------------------------------------------------
-- TELEPORT SPEED (ANDROID SAFE)
------------------------------------------------
local tpEnabled = false
local speed = 16

local toggle = Instance.new("TextButton", content)
toggle.Size = UDim2.fromScale(1,0.25)
toggle.Text = "⚡ TELEPORT SPEED : OFF"
toggle.Font = Enum.Font.GothamBold
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,14)

toggle.MouseButton1Click:Connect(function()
	tpEnabled = not tpEnabled
	if tpEnabled then
		toggle.Text = "⚡ TELEPORT SPEED : ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0,170,255)
	else
		toggle.Text = "⚡ TELEPORT SPEED : OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(70,70,70)
	end
end)

local label = Instance.new("TextLabel", content)
label.Size = UDim2.fromScale(1,0.2)
label.Position = UDim2.fromScale(0,0.3)
label.BackgroundTransparency = 1
label.Text = "Speed : 16"
label.TextScaled = true
label.Font = Enum.Font.Gotham
label.TextColor3 = Color3.new(1,1,1)

local plus = Instance.new("TextButton", content)
plus.Size = UDim2.fromScale(0.45,0.2)
plus.Position = UDim2.fromScale(0,0.55)
plus.Text = "+"
plus.TextScaled = true
plus.Font = Enum.Font.GothamBold
plus.BackgroundColor3 = Color3.fromRGB(60,120,60)
Instance.new("UICorner", plus).CornerRadius = UDim.new(0,12)

local minus = Instance.new("TextButton", content)
minus.Size = UDim2.fromScale(0.45,0.2)
minus.Position = UDim2.fromScale(0.55,0.55)
minus.Text = "-"
minus.TextScaled = true
minus.Font = Enum.Font.GothamBold
minus.BackgroundColor3 = Color3.fromRGB(120,60,60)
Instance.new("UICorner", minus).CornerRadius = UDim.new(0,12)

plus.MouseButton1Click:Connect(function()
	speed = math.clamp(speed + 1,0,100)
	label.Text = "Speed : "..speed
end)

minus.MouseButton1Click:Connect(function()
	speed = math.clamp(speed - 1,0,100)
	label.Text = "Speed : "..speed
end)

------------------------------------------------
-- APPLY SPEED (MOVE ONLY)
------------------------------------------------
RunService.Heartbeat:Connect(function()
	if not tpEnabled then return end
	local c = player.Character
	if not c then return end
	local h = c:FindFirstChildOfClass("Humanoid")
	if h and h.MoveDirection.Magnitude > 0 then
		h.WalkSpeed = speed
	end
end)

------------------------------------------------
-- MINIMIZE
------------------------------------------------
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.fromScale(0.25,0.06)
mini.Position = UDim2.fromScale(0.375,0.03)
mini.Text = "SLK HUB"
mini.TextScaled = true
mini.Visible = false
mini.BackgroundColor3 = Color3.fromRGB(0,0,0)
mini.BackgroundTransparency = 0.3
Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)

min.MouseButton1Click:Connect(function()
	main.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	main.Visible = true
	mini.Visible = false
end)

------------------------------------------------
-- CLOSE CONFIRM + COUNTDOWN
------------------------------------------------
close.MouseButton1Click:Connect(function()
	local f = Instance.new("Frame", gui)
	f.Size = UDim2.fromScale(0.45,0.25)
	f.Position = UDim2.fromScale(0.275,0.38)
	f.BackgroundColor3 = Color3.fromRGB(0,0,0)
	f.BackgroundTransparency = 0.2
	Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)

	local t = Instance.new("TextLabel", f)
	t.Size = UDim2.fromScale(1,0.6)
	t.BackgroundTransparency = 1
	t.Text = "CLOSE SCRIPT?"
	t.TextScaled = true
	t.Font = Enum.Font.GothamBold
	t.TextColor3 = Color3.new(1,1,1)

	local y = Instance.new("TextButton", f)
	y.Size = UDim2.fromScale(0.35,0.25)
	y.Position = UDim2.fromScale(0.1,0.65)
	y.Text = "YES"
	y.TextScaled = true
	y.BackgroundColor3 = Color3.fromRGB(200,60,60)
	Instance.new("UICorner", y).CornerRadius = UDim.new(0,10)

	local n = Instance.new("TextButton", f)
	n.Size = UDim2.fromScale(0.35,0.25)
	n.Position = UDim2.fromScale(0.55,0.65)
	n.Text = "NO"
	n.TextScaled = true
	n.BackgroundColor3 = Color3.fromRGB(70,70,70)
	Instance.new("UICorner", n).CornerRadius = UDim.new(0,10)

	n.MouseButton1Click:Connect(function() f:Destroy() end)
	y.MouseButton1Click:Connect(function()
		for i=5,0,-1 do
			t.Text = "Thanks for using\nClosing in "..i
			task.wait(1)
		end
		gui:Destroy()
	end)
end)
