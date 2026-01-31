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

--// SLK HUB MENU (FULL - INFORMATION TAB ONLY)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

------------------------------------------------
-- GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_HUB_MENU"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- MAIN FRAME
------------------------------------------------
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.6, 0.55)
main.Position = UDim2.fromScale(0.2, 0.22)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = 0.35
main.BorderSizePixel = 0
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

------------------------------------------------
-- TOP BAR
------------------------------------------------
local top = Instance.new("Frame", main)
top.Size = UDim2.fromScale(1, 0.16)
top.BackgroundColor3 = Color3.fromRGB(20,20,20)
top.BackgroundTransparency = 0.25
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

-- TITLE
local title = Instance.new("TextLabel", top)
title.Position = UDim2.fromScale(0.02, 0)
title.Size = UDim2.fromScale(0.25, 1)
title.BackgroundTransparency = 1
title.Text = "SLK HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- VERSION
local verBox = Instance.new("Frame", top)
verBox.Position = UDim2.fromScale(0.28, 0.28)
verBox.Size = UDim2.fromScale(0.2, 0.45)
verBox.BackgroundColor3 = Color3.fromRGB(0,170,255)
verBox.BorderSizePixel = 0
Instance.new("UICorner", verBox).CornerRadius = UDim.new(1,0)

local verText = Instance.new("TextLabel", verBox)
verText.Size = UDim2.fromScale(1,1)
verText.BackgroundTransparency = 1
verText.Text = "VERSION v1"
verText.Font = Enum.Font.GothamBold
verText.TextScaled = true
verText.TextColor3 = Color3.fromRGB(255,255,255)

-- MINIMIZE
local min = Instance.new("TextButton", top)
min.Position = UDim2.fromScale(0.88, 0.2)
min.Size = UDim2.fromScale(0.05, 0.6)
min.Text = "-"
min.Font = Enum.Font.GothamBold
min.TextScaled = true
min.BackgroundColor3 = Color3.fromRGB(70,70,70)
min.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", min).CornerRadius = UDim.new(1,0)

-- CLOSE
local close = Instance.new("TextButton", top)
close.Position = UDim2.fromScale(0.94, 0.2)
close.Size = UDim2.fromScale(0.05, 0.6)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(180,50,50)
close.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- BY TEXT
------------------------------------------------
local by = Instance.new("TextLabel", main)
by.Position = UDim2.fromScale(0.02, 0.17)
by.Size = UDim2.fromScale(0.4, 0.06)
by.BackgroundTransparency = 1
by.Text = "BY slk gaming"
by.Font = Enum.Font.Gotham
by.TextScaled = true
by.TextColor3 = Color3.fromRGB(180,180,180)
by.TextXAlignment = Enum.TextXAlignment.Left

------------------------------------------------
-- TAB LIST (LEFT)
------------------------------------------------
local tabList = Instance.new("Frame", main)
tabList.Position = UDim2.fromScale(0.02, 0.26)
tabList.Size = UDim2.fromScale(0.25, 0.7)
tabList.BackgroundTransparency = 1

local tabLayout = Instance.new("UIListLayout", tabList)
tabLayout.Padding = UDim.new(0,8)

------------------------------------------------
-- CONTENT AREA (RIGHT)
------------------------------------------------
local contentArea = Instance.new("Frame", main)
contentArea.Position = UDim2.fromScale(0.29, 0.26)
contentArea.Size = UDim2.fromScale(0.69, 0.7)
contentArea.BackgroundTransparency = 1

------------------------------------------------
-- TAB SYSTEM
------------------------------------------------
local contents = {}

local function showTab(name)
	for _,v in pairs(contents) do
		v.Visible = false
	end
	if contents[name] then
		contents[name].Visible = true
	end
end

------------------------------------------------
-- INFORMATION TAB
------------------------------------------------
local infoTab = Instance.new("TextButton", tabList)
infoTab.Size = UDim2.fromScale(1, 0.12)
infoTab.Text = "ℹ INFORMATION"
infoTab.Font = Enum.Font.GothamBold
infoTab.TextScaled = true
infoTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
infoTab.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", infoTab).CornerRadius = UDim.new(0,10)

------------------------------------------------
-- INFORMATION CONTENT
------------------------------------------------
local infoContent = Instance.new("Frame", contentArea)
infoContent.Size = UDim2.fromScale(1,1)
infoContent.BackgroundTransparency = 1
infoContent.Visible = false

-- ICON
local icon = Instance.new("TextLabel", infoContent)
icon.Size = UDim2.fromScale(0.2, 0.3)
icon.Position = UDim2.fromScale(0.4, 0.05)
icon.BackgroundTransparency = 1
icon.Text = "🚧"
icon.Font = Enum.Font.GothamBold
icon.TextScaled = true
icon.TextColor3 = Color3.fromRGB(0,170,255)

-- TEXT
local infoText = Instance.new("TextLabel", infoContent)
infoText.Position = UDim2.fromScale(0, 0.35)
infoText.Size = UDim2.fromScale(1, 0.6)
infoText.BackgroundTransparency = 1
infoText.Text = "SCRIPT IS DEVELOPING\nPLEASE WAIT FOR UPDATE"
infoText.Font = Enum.Font.GothamBlack
infoText.TextScaled = true
infoText.TextWrapped = true
infoText.TextColor3 = Color3.fromRGB(0,170,255)

contents["Information"] = infoContent

infoTab.MouseButton1Click:Connect(function()
	showTab("Information")
end)

------------------------------------------------
-- DEFAULT (NO TAB OPEN AT START)
------------------------------------------------
-- Không auto show, phải ấn tab mới hiện

------------------------------------------------
-- MINIMIZE SYSTEM
------------------------------------------------
local miniBtn = Instance.new("TextButton", gui)
miniBtn.Size = UDim2.fromScale(0.18, 0.06)
miniBtn.Position = UDim2.fromScale(0.41, 0.02)
miniBtn.Text = "SLK HUB"
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextScaled = true
miniBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
miniBtn.BackgroundTransparency = 0.3
miniBtn.TextColor3 = Color3.fromRGB(255,255,255)
miniBtn.Visible = false
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(1,0)

min.MouseButton1Click:Connect(function()
	main.Visible = false
	miniBtn.Visible = true
end)

miniBtn.MouseButton1Click:Connect(function()
	main.Visible = true
	miniBtn.Visible = false
end)

------------------------------------------------
-- CLOSE CONFIRM + GOODBYE COUNTDOWN
------------------------------------------------
close.MouseButton1Click:Connect(function()
	local ask = Instance.new("Frame", gui)
	ask.Size = UDim2.fromScale(0.4, 0.25)
	ask.Position = UDim2.fromScale(0.3, 0.38)
	ask.BackgroundColor3 = Color3.fromRGB(0,0,0)
	ask.BackgroundTransparency = 0.2
	Instance.new("UICorner", ask).CornerRadius = UDim.new(0,14)

	local txt = Instance.new("TextLabel", ask)
	txt.Size = UDim2.fromScale(1, 0.55)
	txt.BackgroundTransparency = 1
	txt.Text = "DO YOU WANT CLOSE SCRIPT?"
	txt.Font = Enum.Font.GothamBold
	txt.TextScaled = true
	txt.TextColor3 = Color3.fromRGB(255,255,255)

	local yes = Instance.new("TextButton", ask)
	yes.Position = UDim2.fromScale(0.1, 0.62)
	yes.Size = UDim2.fromScale(0.35, 0.25)
	yes.Text = "YES"
	yes.Font = Enum.Font.GothamBold
	yes.TextScaled = true
	yes.BackgroundColor3 = Color3.fromRGB(200,60,60)
	Instance.new("UICorner", yes).CornerRadius = UDim.new(0,10)

	local no = Instance.new("TextButton", ask)
	no.Position = UDim2.fromScale(0.55, 0.62)
	no.Size = UDim2.fromScale(0.35, 0.25)
	no.Text = "NO"
	no.Font = Enum.Font.GothamBold
	no.TextScaled = true
	no.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", no).CornerRadius = UDim.new(0,10)

	no.MouseButton1Click:Connect(function()
		ask:Destroy()
	end)

	yes.MouseButton1Click:Connect(function()
		ask:Destroy()

		local bye = Instance.new("TextLabel", gui)
		bye.Size = UDim2.fromScale(0.4, 0.25)
		bye.Position = UDim2.fromScale(0.3, 0.38)
		bye.BackgroundColor3 = Color3.fromRGB(0,0,0)
		bye.BackgroundTransparency = 0.2
		bye.TextScaled = true
		bye.Font = Enum.Font.GothamBold
		bye.TextColor3 = Color3.fromRGB(255,255,255)
		Instance.new("UICorner", bye).CornerRadius = UDim.new(0,16)

		for i = 5,0,-1 do
			bye.Text = "👋\nOkay sorry\nSee you again\n"..i.."s"
			task.wait(1)
		end

		gui:Destroy()
	end)
end)

------------------------------------------------
-- DRAG SYSTEM
------------------------------------------------
local dragging, dragStart, startPos
top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)
