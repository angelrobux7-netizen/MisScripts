-- ============================================================
-- ENVY ANTI BAT (FULLY WORKING WITH UI FROM text 24.txt)
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- File saving for keybind persistence
local keybindFile = "EnvyAntiBat_Keybind.txt"

-- Variables
local AntiBatEnabled = false
local InfiniteJumpEnabled = false
local InfiniteJumpHoldEnabled = false
local IsJumpingHold = false

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local AntiBatConn = nil
local AntiRagdollConn = nil
local JumpHoldConn = nil

-- Keybinds
local CurrentKeybind = Enum.KeyCode.O
local WaitingForKeybind = false

-- UI References
local UI = {}
local isMinimized = false

-- Load saved keybind
local function loadKeybind()
    if isfile and isfile(keybindFile) then
        local success, savedData = pcall(function()
            return readfile(keybindFile)
        end)
        if success and savedData then
            for _, enum in ipairs(Enum.KeyCode:GetEnumItems()) do
                if enum.Name == savedData then
                    CurrentKeybind = enum
                    break
                end
            end
        end
    end
end

local function saveKeybind()
    if writefile then
        pcall(function()
            writefile(keybindFile, CurrentKeybind.Name)
        end)
    end
end

loadKeybind()

-- ==================== ANTI BAT CORE ====================
local function startAntiBat()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if AntiBatConn then AntiBatConn:Disconnect() end
    AntiBatConn = RunService.Heartbeat:Connect(function()
        if not root or not root.Parent then return end
        local origXZ = Vector3.new(root.Velocity.X, 0, root.Velocity.Z)
        root.Velocity = Vector3.new(1000, root.Velocity.Y, 1000)
        RunService.RenderStepped:Wait()
        root.Velocity = Vector3.new(origXZ.X, root.Velocity.Y, origXZ.Z)
    end)
end

local function stopAntiBat()
    if AntiBatConn then
        AntiBatConn:Disconnect()
        AntiBatConn = nil
    end
end

-- ==================== INFINITE JUMP LOGIC ====================
local function startJumpHoldLoop()
    if JumpHoldConn then JumpHoldConn:Disconnect() end
    JumpHoldConn = RunService.Heartbeat:Connect(function()
        if not InfiniteJumpHoldEnabled or not IsJumpingHold then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z)
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
        IsJumpingHold = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
        IsJumpingHold = false
    end
end)

UserInputService.JumpRequest:Connect(function()
    if not InfiniteJumpEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z)
    end
end)

-- ==================== ANTI RAGDOLL ====================
local function startAntiRagdoll()
    if AntiRagdollConn then return end
    AntiRagdollConn = RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum2 = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if hum2 then
            local st = hum2:GetState()
            if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
                hum2:ChangeState(Enum.HumanoidStateType.Running)
                workspace.CurrentCamera.CameraSubject = hum2
                pcall(function()
                    local pm = LocalPlayer.PlayerScripts:FindFirstChild("PlayerModule")
                    if pm then require(pm:FindFirstChild("ControlModule")):Enable() end
                end)
                if root then
                    root.Velocity = Vector3.new(0,0,0)
                    root.RotVelocity = Vector3.new(0,0,0)
                end
            end
        end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("Motor6D") and not obj.Enabled then
                obj.Enabled = true
            end
        end
    end)
end

local function stopAntiRagdoll()
    if AntiRagdollConn then
        AntiRagdollConn:Disconnect()
        AntiRagdollConn = nil
    end
end

-- ============================================================
-- UI CREATION (Preserving text 24.txt design)
-- ============================================================

-- Clean old UI
pcall(function()
    for _, old in ipairs(LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if old.Name == "EnvyAntiBat" then
            old:Destroy()
        end
    end
end)

-- Create ScreenGui
local EnvyAntiBat = Instance.new("ScreenGui")
EnvyAntiBat.Name = "EnvyAntiBat"
EnvyAntiBat.ResetOnSpawn = false
EnvyAntiBat.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.04,0,0.25,0)
Frame.Size = UDim2.new(0,200,0,260)
Frame.BackgroundColor3 = Color3.fromRGB(6,6,6)
Frame.BorderSizePixel = 0
Frame.Parent = EnvyAntiBat

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(0,18)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.fromRGB(50,50,50)
UIStroke.Thickness = 1.2
UIStroke.Parent = Frame

-- Drag System
local dragging, dragStart, startPos
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        local conn
        conn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                conn:Disconnect()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Header
local Frame2 = Instance.new("Frame")
Frame2.Name = "Frame"
Frame2.ZIndex = 2
Frame2.Size = UDim2.new(1,0,0,38)
Frame2.BackgroundColor3 = Color3.fromRGB(14,14,14)
Frame2.BorderSizePixel = 0
Frame2.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.CornerRadius = UDim.new(0,18)
UICorner2.Parent = Frame2

local Frame3 = Instance.new("Frame")
Frame3.Name = "Frame"
Frame3.ZIndex = 2
Frame3.Position = UDim2.new(0,0,0.5,0)
Frame3.Size = UDim2.new(1,0,0.5,2)
Frame3.BackgroundColor3 = Color3.fromRGB(14,14,14)
Frame3.BorderSizePixel = 0
Frame3.Parent = Frame2

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "TextLabel"
TextLabel.ZIndex = 3
TextLabel.Position = UDim2.new(0,14,0,0)
TextLabel.Size = UDim2.new(1,-16,1,0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Envy Anti Bat"
TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel.TextSize = 12
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Frame2

local Frame4 = Instance.new("Frame")
Frame4.Name = "Frame"
Frame4.ZIndex = 3
Frame4.Position = UDim2.new(1,-36,0.5,-7)
Frame4.Size = UDim2.new(0,28,0,14)
Frame4.BackgroundColor3 = Color3.fromRGB(38,38,38)
Frame4.BorderSizePixel = 0
Frame4.Parent = Frame2

local UICorner3 = Instance.new("UICorner")
UICorner3.Name = "UICorner"
UICorner3.CornerRadius = UDim.new(0,7)
UICorner3.Parent = Frame4

local TextLabel2 = Instance.new("TextLabel")
TextLabel2.Name = "TextLabel"
TextLabel2.ZIndex = 4
TextLabel2.Size = UDim2.new(1,0,1,0)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "v2"
TextLabel2.TextColor3 = Color3.fromRGB(120,120,120)
TextLabel2.TextSize = 7
TextLabel2.Font = Enum.Font.GothamBold
TextLabel2.Parent = Frame4

-- Separator
local Frame5 = Instance.new("Frame")
Frame5.Name = "Frame"
Frame5.ZIndex = 2
Frame5.Position = UDim2.new(0,12,0,38)
Frame5.Size = UDim2.new(1,-24,0,1)
Frame5.BackgroundColor3 = Color3.fromRGB(35,35,35)
Frame5.BorderSizePixel = 0
Frame5.Parent = Frame

-- ============================================================
-- ANTI BAT BUTTON
-- ============================================================
local Frame6 = Instance.new("Frame")
Frame6.Name = "Frame"
Frame6.ZIndex = 2
Frame6.Position = UDim2.new(0,10,0,46)
Frame6.Size = UDim2.new(1,-20,0,52)
Frame6.BackgroundColor3 = Color3.fromRGB(16,16,16)
Frame6.BorderSizePixel = 0
Frame6.Parent = Frame

local UICorner4 = Instance.new("UICorner")
UICorner4.Name = "UICorner"
UICorner4.CornerRadius = UDim.new(0,10)
UICorner4.Parent = Frame6

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Name = "UIStroke"
UIStroke2.Color = Color3.fromRGB(42,42,42)
UIStroke2.Parent = Frame6

local TextButton = Instance.new("TextButton")
TextButton.Name = "TextButton"
TextButton.ZIndex = 2
TextButton.Size = UDim2.new(1,0,1,0)
TextButton.BackgroundTransparency = 1
TextButton.Text = ""
TextButton.Parent = Frame6

local TextLabel3 = Instance.new("TextLabel")
TextLabel3.Name = "TextLabel"
TextLabel3.ZIndex = 3
TextLabel3.Position = UDim2.new(0,10,0,7)
TextLabel3.Size = UDim2.new(1,-56,0,15)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = "Anti Bat"
TextLabel3.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel3.TextSize = 10
TextLabel3.Font = Enum.Font.GothamBold
TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel3.Parent = Frame6

local TextLabel4 = Instance.new("TextLabel")
TextLabel4.Name = "TextLabel"
TextLabel4.ZIndex = 3
TextLabel4.Position = UDim2.new(0,10,0,23)
TextLabel4.Size = UDim2.new(1,-56,0,11)
TextLabel4.BackgroundTransparency = 1
TextLabel4.Text = "○ INACTIVE"
TextLabel4.TextColor3 = Color3.fromRGB(65,65,65)
TextLabel4.TextSize = 7
TextLabel4.Font = Enum.Font.GothamMedium
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel4.Parent = Frame6

local Frame7 = Instance.new("Frame")
Frame7.Name = "Frame"
Frame7.ZIndex = 3
Frame7.Position = UDim2.new(1,-44,0.5,-10)
Frame7.Size = UDim2.new(0,36,0,20)
Frame7.BackgroundColor3 = Color3.fromRGB(28,28,28)
Frame7.BorderSizePixel = 0
Frame7.Parent = Frame6

local UICorner5 = Instance.new("UICorner")
UICorner5.Name = "UICorner"
UICorner5.CornerRadius = UDim.new(0,10)
UICorner5.Parent = Frame7

local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Name = "UIStroke"
UIStroke3.Color = Color3.fromRGB(48,48,48)
UIStroke3.Parent = Frame7

local Frame8 = Instance.new("Frame")
Frame8.Name = "Frame"
Frame8.ZIndex = 4
Frame8.Position = UDim2.new(0,2,0.5,-6)
Frame8.Size = UDim2.new(0,12,0,12)
Frame8.BackgroundColor3 = Color3.fromRGB(55,55,55)
Frame8.BorderSizePixel = 0
Frame8.Parent = Frame7

local UICorner6 = Instance.new("UICorner")
UICorner6.Name = "UICorner"
UICorner6.CornerRadius = UDim.new(0,6)
UICorner6.Parent = Frame8

-- Keybind display for Anti Bat
local Frame9 = Instance.new("Frame")
Frame9.Name = "Frame"
Frame9.ZIndex = 3
Frame9.Position = UDim2.new(0,10,0,37)
Frame9.Size = UDim2.new(1,-20,0,13)
Frame9.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame9.BorderSizePixel = 0
Frame9.Parent = Frame6

local UICorner7 = Instance.new("UICorner")
UICorner7.Name = "UICorner"
UICorner7.CornerRadius = UDim.new(0,4)
UICorner7.Parent = Frame9

local UIStroke4 = Instance.new("UIStroke")
UIStroke4.Name = "UIStroke"
UIStroke4.Color = Color3.fromRGB(32,32,32)
UIStroke4.Parent = Frame9

local TextLabel5 = Instance.new("TextLabel")
TextLabel5.Name = "TextLabel"
TextLabel5.ZIndex = 4
TextLabel5.Position = UDim2.new(0,4,0,0)
TextLabel5.Size = UDim2.new(0,26,1,0)
TextLabel5.BackgroundTransparency = 1
TextLabel5.Text = "KEY:"
TextLabel5.TextColor3 = Color3.fromRGB(120,120,120)
TextLabel5.TextSize = 7
TextLabel5.Font = Enum.Font.GothamMedium
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel5.Parent = Frame9

local TextButton2 = Instance.new("TextButton")
TextButton2.Name = "TextButton"
TextButton2.ZIndex = 5
TextButton2.Position = UDim2.new(0,28,0,1)
TextButton2.Size = UDim2.new(0,46,1,-2)
TextButton2.BackgroundColor3 = Color3.fromRGB(28,28,28)
TextButton2.BorderSizePixel = 0
TextButton2.Text = "O"
TextButton2.TextColor3 = Color3.fromRGB(255,255,255)
TextButton2.TextSize = 7
TextButton2.Font = Enum.Font.GothamBold
TextButton2.Parent = Frame9

local UICorner8 = Instance.new("UICorner")
UICorner8.Name = "UICorner"
UICorner8.CornerRadius = UDim.new(0,3)
UICorner8.Parent = TextButton2

local UIStroke5 = Instance.new("UIStroke")
UIStroke5.Name = "UIStroke"
UIStroke5.Color = Color3.fromRGB(70,70,70)
UIStroke5.Parent = TextButton2

-- ============================================================
-- INF JUMP (Normal)
-- ============================================================
local Frame10 = Instance.new("Frame")
Frame10.Name = "Frame"
Frame10.ZIndex = 2
Frame10.Position = UDim2.new(0,10,0,104)
Frame10.Size = UDim2.new(1,-20,0,52)
Frame10.BackgroundColor3 = Color3.fromRGB(16,16,16)
Frame10.BorderSizePixel = 0
Frame10.Parent = Frame

local UICorner9 = Instance.new("UICorner")
UICorner9.Name = "UICorner"
UICorner9.CornerRadius = UDim.new(0,10)
UICorner9.Parent = Frame10

local UIStroke6 = Instance.new("UIStroke")
UIStroke6.Name = "UIStroke"
UIStroke6.Color = Color3.fromRGB(42,42,42)
UIStroke6.Parent = Frame10

local TextButton3 = Instance.new("TextButton")
TextButton3.Name = "TextButton"
TextButton3.ZIndex = 2
TextButton3.Size = UDim2.new(1,0,1,0)
TextButton3.BackgroundTransparency = 1
TextButton3.Text = ""
TextButton3.Parent = Frame10

local TextLabel6 = Instance.new("TextLabel")
TextLabel6.Name = "TextLabel"
TextLabel6.ZIndex = 3
TextLabel6.Position = UDim2.new(0,10,0,7)
TextLabel6.Size = UDim2.new(1,-56,0,15)
TextLabel6.BackgroundTransparency = 1
TextLabel6.Text = "Inf Jump"
TextLabel6.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel6.TextSize = 10
TextLabel6.Font = Enum.Font.GothamBold
TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
TextLabel6.Parent = Frame10

local TextLabel7 = Instance.new("TextLabel")
TextLabel7.Name = "TextLabel"
TextLabel7.ZIndex = 3
TextLabel7.Position = UDim2.new(0,10,0,23)
TextLabel7.Size = UDim2.new(1,-56,0,11)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Text = "○ INACTIVE"
TextLabel7.TextColor3 = Color3.fromRGB(65,65,65)
TextLabel7.TextSize = 7
TextLabel7.Font = Enum.Font.GothamMedium
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel7.Parent = Frame10

local Frame11 = Instance.new("Frame")
Frame11.Name = "Frame"
Frame11.ZIndex = 3
Frame11.Position = UDim2.new(1,-44,0.5,-10)
Frame11.Size = UDim2.new(0,36,0,20)
Frame11.BackgroundColor3 = Color3.fromRGB(28,28,28)
Frame11.BorderSizePixel = 0
Frame11.Parent = Frame10

local UICorner10 = Instance.new("UICorner")
UICorner10.Name = "UICorner"
UICorner10.CornerRadius = UDim.new(0,10)
UICorner10.Parent = Frame11

local UIStroke7 = Instance.new("UIStroke")
UIStroke7.Name = "UIStroke"
UIStroke7.Color = Color3.fromRGB(48,48,48)
UIStroke7.Parent = Frame11

local Frame12 = Instance.new("Frame")
Frame12.Name = "Frame"
Frame12.ZIndex = 4
Frame12.Position = UDim2.new(0,2,0.5,-6)
Frame12.Size = UDim2.new(0,12,0,12)
Frame12.BackgroundColor3 = Color3.fromRGB(55,55,55)
Frame12.BorderSizePixel = 0
Frame12.Parent = Frame11

local UICorner11 = Instance.new("UICorner")
UICorner11.Name = "UICorner"
UICorner11.CornerRadius = UDim.new(0,6)
UICorner11.Parent = Frame12

-- ============================================================
-- INF JUMP (Hold)
-- ============================================================
local Frame13 = Instance.new("Frame")
Frame13.Name = "Frame"
Frame13.ZIndex = 2
Frame13.Position = UDim2.new(0,10,0,162)
Frame13.Size = UDim2.new(1,-20,0,52)
Frame13.BackgroundColor3 = Color3.fromRGB(16,16,16)
Frame13.BorderSizePixel = 0
Frame13.Parent = Frame

local UICorner12 = Instance.new("UICorner")
UICorner12.Name = "UICorner"
UICorner12.CornerRadius = UDim.new(0,10)
UICorner12.Parent = Frame13

local UIStroke8 = Instance.new("UIStroke")
UIStroke8.Name = "UIStroke"
UIStroke8.Color = Color3.fromRGB(42,42,42)
UIStroke8.Parent = Frame13

local TextButton4 = Instance.new("TextButton")
TextButton4.Name = "TextButton"
TextButton4.ZIndex = 2
TextButton4.Size = UDim2.new(1,0,1,0)
TextButton4.BackgroundTransparency = 1
TextButton4.Text = ""
TextButton4.Parent = Frame13

local TextLabel8 = Instance.new("TextLabel")
TextLabel8.Name = "TextLabel"
TextLabel8.ZIndex = 3
TextLabel8.Position = UDim2.new(0,10,0,7)
TextLabel8.Size = UDim2.new(1,-56,0,15)
TextLabel8.BackgroundTransparency = 1
TextLabel8.Text = "Jump Hold"
TextLabel8.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel8.TextSize = 10
TextLabel8.Font = Enum.Font.GothamBold
TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
TextLabel8.Parent = Frame13

local TextLabel9 = Instance.new("TextLabel")
TextLabel9.Name = "TextLabel"
TextLabel9.ZIndex = 3
TextLabel9.Position = UDim2.new(0,10,0,23)
TextLabel9.Size = UDim2.new(1,-56,0,11)
TextLabel9.BackgroundTransparency = 1
TextLabel9.Text = "○ INACTIVE"
TextLabel9.TextColor3 = Color3.fromRGB(65,65,65)
TextLabel9.TextSize = 7
TextLabel9.Font = Enum.Font.GothamMedium
TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
TextLabel9.Parent = Frame13

local Frame14 = Instance.new("Frame")
Frame14.Name = "Frame"
Frame14.ZIndex = 3
Frame14.Position = UDim2.new(1,-44,0.5,-10)
Frame14.Size = UDim2.new(0,36,0,20)
Frame14.BackgroundColor3 = Color3.fromRGB(28,28,28)
Frame14.BorderSizePixel = 0
Frame14.Parent = Frame13

local UICorner13 = Instance.new("UICorner")
UICorner13.Name = "UICorner"
UICorner13.CornerRadius = UDim.new(0,10)
UICorner13.Parent = Frame14

local UIStroke9 = Instance.new("UIStroke")
UIStroke9.Name = "UIStroke"
UIStroke9.Color = Color3.fromRGB(48,48,48)
UIStroke9.Parent = Frame14

local Frame15 = Instance.new("Frame")
Frame15.Name = "Frame"
Frame15.ZIndex = 4
Frame15.Position = UDim2.new(0,2,0.5,-6)
Frame15.Size = UDim2.new(0,12,0,12)
Frame15.BackgroundColor3 = Color3.fromRGB(55,55,55)
Frame15.BorderSizePixel = 0
Frame15.Parent = Frame14

local UICorner14 = Instance.new("UICorner")
UICorner14.Name = "UICorner"
UICorner14.CornerRadius = UDim.new(0,6)
UICorner14.Parent = Frame15

-- ============================================================
-- RAGDOLL BUTTON
-- ============================================================
local Frame16 = Instance.new("Frame")
Frame16.Name = "Frame"
Frame16.ZIndex = 2
Frame16.Position = UDim2.new(0,10,0,220)
Frame16.Size = UDim2.new(1,-20,0,32)
Frame16.BackgroundColor3 = Color3.fromRGB(16,16,16)
Frame16.BorderSizePixel = 0
Frame16.Parent = Frame

local UICorner15 = Instance.new("UICorner")
UICorner15.Name = "UICorner"
UICorner15.CornerRadius = UDim.new(0,10)
UICorner15.Parent = Frame16

local UIStroke10 = Instance.new("UIStroke")
UIStroke10.Name = "UIStroke"
UIStroke10.Color = Color3.fromRGB(42,42,42)
UIStroke10.Parent = Frame16

local TextButton5 = Instance.new("TextButton")
TextButton5.Name = "TextButton"
TextButton5.ZIndex = 2
TextButton5.Size = UDim2.new(1,0,1,0)
TextButton5.BackgroundTransparency = 1
TextButton5.Text = ""
TextButton5.Parent = Frame16

local TextLabel10 = Instance.new("TextLabel")
TextLabel10.Name = "TextLabel"
TextLabel10.ZIndex = 3
TextLabel10.Position = UDim2.new(0,10,0,0)
TextLabel10.Size = UDim2.new(1,-56,1,0)
TextLabel10.BackgroundTransparency = 1
TextLabel10.Text = "Anti Ragdoll"
TextLabel10.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel10.TextSize = 10
TextLabel10.Font = Enum.Font.GothamBold
TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
TextLabel10.Parent = Frame16

local Frame17 = Instance.new("Frame")
Frame17.Name = "Frame"
Frame17.ZIndex = 3
Frame17.Position = UDim2.new(1,-44,0.5,-10)
Frame17.Size = UDim2.new(0,36,0,20)
Frame17.BackgroundColor3 = Color3.fromRGB(28,28,28)
Frame17.BorderSizePixel = 0
Frame17.Parent = Frame16

local UICorner16 = Instance.new("UICorner")
UICorner16.Name = "UICorner"
UICorner16.CornerRadius = UDim.new(0,10)
UICorner16.Parent = Frame17

local UIStroke11 = Instance.new("UIStroke")
UIStroke11.Name = "UIStroke"
UIStroke11.Color = Color3.fromRGB(48,48,48)
UIStroke11.Parent = Frame17

local Frame18 = Instance.new("Frame")
Frame18.Name = "Frame"
Frame18.ZIndex = 4
Frame18.Position = UDim2.new(0,2,0.5,-6)
Frame18.Size = UDim2.new(0,12,0,12)
Frame18.BackgroundColor3 = Color3.fromRGB(55,55,55)
Frame18.BorderSizePixel = 0
Frame18.Parent = Frame17

local UICorner17 = Instance.new("UICorner")
UICorner17.Name = "UICorner"
UICorner17.CornerRadius = UDim.new(0,6)
UICorner17.Parent = Frame18

-- ============================================================
-- LOGIC & INTERACTION
-- ============================================================

local function updateToggle(frame, state)
    local switch = frame:FindFirstChild("Frame")
    local circle = switch:FindFirstChild("Frame")
    local statusText = frame:FindFirstChild("TextLabel", true) -- find the active/inactive text
    
    if state then
        TweenService:Create(switch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(80,255,80)}):Play()
        TweenService:Create(circle, TweenInfo.new(0.3), {Position = UDim2.new(1,-14,0.5,-6), BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
        if statusText and statusText.Text:find("ACTIVE") then
            statusText.Text = "● ACTIVE"
            statusText.TextColor3 = Color3.fromRGB(80,255,80)
        end
    else
        TweenService:Create(switch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(28,28,28)}):Play()
        TweenService:Create(circle, TweenInfo.new(0.3), {Position = UDim2.new(0,2,0.5,-6), BackgroundColor3 = Color3.fromRGB(55,55,55)}):Play()
        if statusText and statusText.Text:find("ACTIVE") then
            statusText.Text = "○ INACTIVE"
            statusText.TextColor3 = Color3.fromRGB(65,65,65)
        end
    end
end

-- Anti Bat Toggle
TextButton.MouseButton1Click:Connect(function()
    AntiBatEnabled = not AntiBatEnabled
    updateToggle(Frame6, AntiBatEnabled)
    if AntiBatEnabled then startAntiBat() else stopAntiBat() end
end)

-- Inf Jump Toggle
TextButton3.MouseButton1Click:Connect(function()
    InfiniteJumpEnabled = not InfiniteJumpEnabled
    updateToggle(Frame10, InfiniteJumpEnabled)
end)

-- Jump Hold Toggle
TextButton4.MouseButton1Click:Connect(function()
    InfiniteJumpHoldEnabled = not InfiniteJumpHoldEnabled
    updateToggle(Frame13, InfiniteJumpHoldEnabled)
    if InfiniteJumpHoldEnabled then startJumpHoldLoop() end
end)

-- Anti Ragdoll Toggle
TextButton5.MouseButton1Click:Connect(function()
    local state = not AntiRagdollConn
    updateToggle(Frame16, state)
    if state then startAntiRagdoll() else stopAntiRagdoll() end
end)

-- Keybind Change
TextButton2.MouseButton1Click:Connect(function()
    WaitingForKeybind = true
    TextButton2.Text = "..."
end)

UserInputService.InputBegan:Connect(function(input)
    if WaitingForKeybind and input.UserInputType == Enum.UserInputType.Keyboard then
        CurrentKeybind = input.KeyCode
        TextButton2.Text = CurrentKeybind.Name
        saveKeybind()
        WaitingForKeybind = false
    elseif input.KeyCode == CurrentKeybind and not WaitingForKeybind then
        AntiBatEnabled = not AntiBatEnabled
        updateToggle(Frame6, AntiBatEnabled)
        if AntiBatEnabled then startAntiBat() else stopAntiBat() end
    end
end)

-- Minimization System (Press L to toggle visibility)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.L then
        isMinimized = not isMinimized
        Frame.Visible = not isMinimized
    end
end)

-- Mobile Support for minimizing
if isMobile then
    local MobileToggle = Instance.new("TextButton")
    MobileToggle.Name = "MobileToggle"
    MobileToggle.Size = UDim2.new(0,40,0,40)
    MobileToggle.Position = UDim2.new(0,10,0.5,-20)
    MobileToggle.BackgroundColor3 = Color3.fromRGB(16,16,16)
    MobileToggle.Text = "E"
    MobileToggle.TextColor3 = Color3.fromRGB(255,255,255)
    MobileToggle.Font = Enum.Font.GothamBold
    MobileToggle.Parent = EnvyAntiBat
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0,10)
    Corner.Parent = MobileToggle
    
    MobileToggle.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
    end)
end

print("Envy Anti Bat Loaded!")
