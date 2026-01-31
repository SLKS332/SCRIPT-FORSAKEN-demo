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
--// SLK HUB MENU (FULL FIX VERSION)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB_MENU"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.5, 0.5)
main.Position = UDim2.fromScale(0.25, 0.25)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0.35
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

-- FADE IN (mờ -> rõ)
main.BackgroundTransparency = 1
TweenService:Create(main, TweenInfo.new(0.4), {
	BackgroundTransparency = 0.35
}):Play()

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.fromScale(1, 0.12)
top.BackgroundColor3 = Color3.fromRGB(20,20,20)
top.BackgroundTransparency = 0.2
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,16)

top.Active = true
top.Draggable = true

-- TITLE
local title = Instance.new("TextLabel", top)
title.Size = UDim2.fromScale(0.6, 1)
title.Position = UDim2.fromScale(0.02, 0)
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1

-- MINIMIZE BUTTON
local minimize = Instance.new("TextButton", top)
minimize.Size = UDim2.fromScale(0.12, 0.8)
minimize.Position = UDim2.fromScale(0.74, 0.1)
minimize.Text = "-"
minimize.Font = Enum.Font.GothamBold
minimize.TextScaled = true
minimize.TextColor3 = Color3.fromRGB(255,255,255)
minimize.BackgroundColor3 = Color3.fromRGB(50,50,50)
Instance.new("UICorner", minimize)

-- CLOSE BUTTON
local close = Instance.new("TextButton", top)
close.Size = UDim2.fromScale(0.12, 0.8)
close.Position = UDim2.fromScale(0.87, 0.1)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.TextColor3 = Color3.fromRGB(255,80,80)
close.BackgroundColor3 = Color3.fromRGB(50,50,50)
Instance.new("UICorner", close)

-- CONTENT (MENU TRỐNG)
local content = Instance.new("Frame", main)
content.Position = UDim2.fromScale(0, 0.13)
content.Size = UDim2.fromScale(1, 0.87)
content.BackgroundTransparency = 1

-- ===== MINIMIZE LOGIC =====
local minimized = false
local normalSize = main.Size
local normalPos = main.Position

-- SLK HUB MINI BAR
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.fromScale(0.18, 0.06)
mini.Position = UDim2.fromScale(0.41, 0.02)
mini.Text = "SLK HUB"
mini.Font = Enum.Font.GothamBold
mini.TextScaled = true
mini.TextColor3 = Color3.fromRGB(255,255,255)
mini.BackgroundColor3 = Color3.fromRGB(0,0,0)
mini.BackgroundTransparency = 0.3
mini.Visible = false
mini.Active = true
mini.Draggable = true
Instance.new("UICorner", mini)

minimize.MouseButton1Click:Connect(function()
	if minimized then return end
	minimized = true

	main.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	minimized = false
	main.Visible = true
	mini.Visible = false
end)

-- ===== CLOSE CONFIRM =====
local confirm = Instance.new("Frame", gui)
confirm.Size = UDim2.fromScale(0.35, 0.25)
confirm.Position = UDim2.fromScale(0.325, 0.375)
confirm.BackgroundColor3 = Color3.fromRGB(0,0,0)
confirm.BackgroundTransparency = 0.25
confirm.Visible = false
Instance.new("UICorner", confirm)

local confirmText = Instance.new("TextLabel", confirm)
confirmText.Size = UDim2.fromScale(1, 0.4)
confirmText.Text = "DO YOU WANT DELETE SCRIPT?"
confirmText.Font = Enum.Font.GothamBold
confirmText.TextScaled = true
confirmText.TextColor3 = Color3.fromRGB(255,255,255)
confirmText.BackgroundTransparency = 1

local yes = Instance.new("TextButton", confirm)
yes.Size = UDim2.fromScale(0.4, 0.25)
yes.Position = UDim2.fromScale(0.05, 0.6)
yes.Text = "YES"
yes.Font = Enum.Font.GothamBold
yes.TextScaled = true
yes.BackgroundColor3 = Color3.fromRGB(255,80,80)
Instance.new("UICorner", yes)

local no = Instance.new("TextButton", confirm)
no.Size = UDim2.fromScale(0.4, 0.25)
no.Position = UDim2.fromScale(0.55, 0.6)
no.Text = "NO"
no.Font = Enum.Font.GothamBold
no.TextScaled = true
no.BackgroundColor3 = Color3.fromRGB(80,80,80)
Instance.new("UICorner", no)

close.MouseButton1Click:Connect(function()
	confirm.Visible = true
end)

yes.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

no.MouseButton1Click:Connect(function()
	confirm.Visible = false
end)
