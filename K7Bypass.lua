-- // K7 SPEED BYPASS — By @Atlanta.rar//
-- // 1 (Services) //
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- // 2 (Player + state) //
local lp = Players.LocalPlayer
local activated = false
local keybind = Enum.KeyCode.E
local waitingForKey = false
local power = 300000
local lagAmount = 0.12
local lagConn = nil

-- // 3 (Map power to lag amount) //
local function applyPower(val)
	power = math.clamp(val, 10000, 500000)
	local t = (power - 10000) / 490000
	lagAmount = t * 0.2
end

applyPower(power)

-- // 4 (Start / stop lag) //
local function startLag()
	if lagConn then lagConn:Disconnect() end

	lagConn = RunService.RenderStepped:Connect(function()
		if not activated then return end
		if lagAmount > 0 then
			local t = tick()
			while tick() - t < lagAmount do end
		end
	end)
end

local function stopLag()
	activated = false
	if lagConn then lagConn:Disconnect(); lagConn = nil end
end

-- // 5 (Cleanup) //
if CoreGui:FindFirstChild("K7_Ultimate_Bypass") then
	CoreGui.K7_Ultimate_Bypass:Destroy()
end

-- // 6 (ScreenGui) //
local gui = Instance.new("ScreenGui")
gui.Name = "K7_Ultimate_Bypass"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- // 7 (Main frame with intro tween) //
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 220, 0, 0)
main.Position = UDim2.new(0.5, -110, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true
main.Parent = gui

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2.5
mainStroke.Color = Color3.fromRGB(70, 70, 70)
mainStroke.Parent = main

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
	Size = UDim2.new(0, 220, 0, 320)
}):Play()

-- // 8 (Title) //
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "K7 SPEED BYPASS"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = main

-- // 9 (Power input — 10k least, 500k most) //
local powerLabel = Instance.new("TextLabel")
powerLabel.Size = UDim2.new(0.8, 0, 0, 20)
powerLabel.Position = UDim2.new(0.1, 0, 0, 60)
powerLabel.BackgroundTransparency = 1
powerLabel.Text = "SET POWER (10k - 500k):"
powerLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
powerLabel.Font = Enum.Font.GothamMedium
powerLabel.TextSize = 11
powerLabel.TextXAlignment = Enum.TextXAlignment.Left
powerLabel.Parent = main

local powerBox = Instance.new("TextBox")
powerBox.Size = UDim2.new(0.8, 0, 0, 40)
powerBox.Position = UDim2.new(0.1, 0, 0, 85)
powerBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
powerBox.Text = tostring(power)
powerBox.TextColor3 = Color3.new(1, 1, 1)
powerBox.Font = Enum.Font.GothamBold
powerBox.TextSize = 16
powerBox.BorderSizePixel = 0
powerBox.ClearTextOnFocus = false
powerBox.Parent = main

Instance.new("UICorner", powerBox).CornerRadius = UDim.new(0, 8)

powerBox.FocusLost:Connect(function()
	local val = tonumber(powerBox.Text)
	if val then
		applyPower(val)
		powerBox.Text = tostring(power)
	else
		powerBox.Text = tostring(power)
	end
end)

-- // 10 (Keybind) //
local kbLabel = Instance.new("TextLabel")
kbLabel.Size = UDim2.new(0.8, 0, 0, 20)
kbLabel.Position = UDim2.new(0.1, 0, 0, 135)
kbLabel.BackgroundTransparency = 1
kbLabel.Text = "TOGGLE KEY:"
kbLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
kbLabel.Font = Enum.Font.GothamMedium
kbLabel.TextSize = 11
kbLabel.TextXAlignment = Enum.TextXAlignment.Left
kbLabel.Parent = main

local kbBtn = Instance.new("TextButton")
kbBtn.Size = UDim2.new(0.8, 0, 0, 40)
kbBtn.Position = UDim2.new(0.1, 0, 0, 160)
kbBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
kbBtn.Text = "E"
kbBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
kbBtn.Font = Enum.Font.GothamBold
kbBtn.TextSize = 16
kbBtn.BorderSizePixel = 0
kbBtn.AutoButtonColor = false
kbBtn.Parent = main

Instance.new("UICorner", kbBtn).CornerRadius = UDim.new(0, 8)

kbBtn.MouseButton1Click:Connect(function()
	waitingForKey = true
	kbBtn.Text = "..."
	kbBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

-- // 11 (Toggle button) //
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.8, 0, 0, 50)
toggleBtn.Position = UDim2.new(0.1, 0, 0, 230)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.Text = "DEACTIVATED"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 16
toggleBtn.BorderSizePixel = 0
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = main

Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-- // 12 (Toggle logic) //
local function toggle()
	if not activated then
		activated = true
		toggleBtn.Text = "ACTIVATED"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 70)
		startLag()
	else
		stopLag()
		toggleBtn.Text = "DEACTIVATED"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
end

toggleBtn.MouseButton1Click:Connect(toggle)

-- // 13 (Input listener) //
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if waitingForKey then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			keybind = input.KeyCode
			kbBtn.Text = keybind.Name
			kbBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
			waitingForKey = false
		end
		return
	end
	if input.KeyCode == keybind then
		toggle()
	end
end)

-- // 14 (Re-apply on respawn) //
lp.CharacterAdded:Connect(function()
	task.wait(1)
	if activated then
		stopLag()
		activated = true
		startLag()
	end
end)

-- // 15 (End) //
