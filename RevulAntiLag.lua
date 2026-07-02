local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Colors
local PURPLE = Color3.fromRGB(140, 0, 255)
local CYAN = Color3.fromRGB(0, 200, 255) -- Head title color
local BLACK = Color3.fromRGB(0, 0, 0)    -- GUI background
local BTN_GRAY = Color3.fromRGB(30, 30, 30) -- Button background
local WHITE = Color3.fromRGB(255, 255, 255)
local SILVER = Color3.fromRGB(192, 192, 192)

---------------------------------------------------------
-- 1. Billboard GUI (Discord link above head) - MASSIVE SIZE
---------------------------------------------------------
local function createBillboard()
    if LocalPlayer.Character then
        local head = LocalPlayer.Character:FindFirstChild("Head")
        if head then
            local oldBillboard = head:FindFirstChild("RevulDiscordBillboard")
            if oldBillboard then oldBillboard:Destroy() end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "RevulDiscordBillboard"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 300, 0, 75) -- Made much wider and taller
            billboard.StudsOffset = Vector3.new(0, 3.0, 0) -- Lifted higher above head
            billboard.AlwaysOnTop = true
            billboard.Parent = head

            local linkLabel = Instance.new("TextLabel")
            linkLabel.Size = UDim2.new(1, 0, 1, 0)
            linkLabel.BackgroundTransparency = 1
            linkLabel.Text = "discord.gg/revulhub"
            linkLabel.TextColor3 = CYAN
            linkLabel.Font = Enum.Font.GothamBold
            linkLabel.TextSize = 34 -- Massive text size
            linkLabel.Parent = billboard
        end
    end
end

LocalPlayer.CharacterAdded:Connect(createBillboard)
if LocalPlayer.Character then createBillboard() end

---------------------------------------------------------
-- 2. Main Screen GUI (Black background, 240x140)
---------------------------------------------------------
local existing = PlayerGui:FindFirstChild("RevulAntiLagGUI")
if existing then existing:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RevulAntiLagGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Main Frame (Black Background)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 140)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = BLACK
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Purple Outline
local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2
mainStroke.Color = PURPLE
mainStroke.Parent = mainFrame

-- Title ("REVUL ANTI LAGGER" - all caps)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "REVUL ANTI LAGGER"
title.TextColor3 = WHITE
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.Parent = mainFrame

-- Minimize Button (Bigger, with purple outline)
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 25)
minimizeBtn.Position = UDim2.new(1, -40, 0, 2)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = WHITE
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = minimizeBtn

-- Purple Outline for Minimize Button
local minimizeStroke = Instance.new("UIStroke")
minimizeStroke.Thickness = 2
minimizeStroke.Color = PURPLE
minimizeStroke.Parent = minimizeBtn

-- Subtitle (Silver, smaller text size 9)
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 26)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Leaked by weekly bitch"
subtitle.TextColor3 = SILVER
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 9
subtitle.Parent = mainFrame

-- Main Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 200, 0, 40)
toggleBtn.Position = UDim2.new(0.5, 0, 0.73, 0)
toggleBtn.AnchorPoint = Vector2.new(0.5, 0.5)
toggleBtn.BackgroundColor3 = BTN_GRAY
toggleBtn.Text = "ANTI LAGGER OFF"
toggleBtn.TextColor3 = WHITE
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 13
toggleBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = toggleBtn

local btnStroke = Instance.new("UIStroke")
btnStroke.Thickness = 2
btnStroke.Color = PURPLE
btnStroke.Parent = toggleBtn

---------------------------------------------------------
-- 3. Flashing Animation (White & Grey)
---------------------------------------------------------
local flashTime = 0
local greyFlash = Color3.fromRGB(160, 160, 160)

RunService.RenderStepped:Connect(function(dt)
    flashTime = flashTime + dt * 3 -- Speed of the flash
    local alpha = 0.5 + 0.5 * math.sin(flashTime)
    local currentColor = WHITE:Lerp(greyFlash, alpha)

    -- Make title flash
    title.TextColor3 = currentColor
    -- Make toggle button text flash
    toggleBtn.TextColor3 = currentColor
end)

---------------------------------------------------------
-- 4. Minimize & Toggle Logic
---------------------------------------------------------
local isMinimized = false
local defaultSize = UDim2.new(0, 240, 0, 140)
local minSize = UDim2.new(0, 240, 0, 32)

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        mainFrame.Size = minSize
        subtitle.Visible = false
        toggleBtn.Visible = false
        minimizeBtn.Text = "+"
    else
        mainFrame.Size = defaultSize
        subtitle.Visible = true
        toggleBtn.Visible = true
        minimizeBtn.Text = "-"
    end
end)

local isEnabled = false
local connection = nil

local function applyAntiLag()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 1
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0

    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA('BloomEffect') or child:IsA('BlurEffect') or child:IsA('SunRaysEffect') then
            child.Enabled = false
        end
    end

    for _, descendant in pairs(Workspace:GetDescendants()) do
        if descendant:IsA('ParticleEmitter') then
            descendant.Enabled = false
        elseif descendant:IsA('Decal') then
            descendant.Transparency = 1
        elseif descendant:IsA('BasePart') then
            descendant.Material = Enum.Material.Plastic
            descendant.Reflectance = 0
            descendant.CastShadow = false
        end
        if descendant:IsA('Accessory') then
            descendant:Destroy()
        end
    end
end

toggleBtn.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    
    if isEnabled then
        toggleBtn.Text = "ANTI LAGGER ON ✔"
        applyAntiLag()
        
        if connection then connection:Disconnect() end
        connection = Workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA('ParticleEmitter') then
                descendant.Enabled = false
            elseif descendant:IsA('Decal') then
                descendant.Transparency = 1
            elseif descendant:IsA('BasePart') then
                descendant.Material = Enum.Material.Plastic
                descendant.Reflectance = 0
                descendant.CastShadow = false
            end
            if descendant:IsA('Accessory') then
                descendant:Destroy()
            end
        end)
    else
        toggleBtn.Text = "ANTI LAGGER OFF"
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end)

print("✅ REVUL ANTI LAGGER LOADED (Black, Massive Head Title, All Caps)")