local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "WaelHub"
gui.ResetOnSpawn = false

-- 🔧 Logo glissable
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0, 60, 0, 60)
logo.Position = UDim2.new(0.05, 0, 0.4, 0)
logo.Text = "🎮"
logo.Font = Enum.Font.Arcade
logo.TextScaled = true
logo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logo.TextColor3 = Color3.fromRGB(0, 255, 180)
logo.BorderSizePixel = 0
logo.Active = true
logo.Draggable = true

-- 🧱 Hub Frame
local hub = Instance.new("Frame", gui)
hub.Size = UDim2.new(0, 500, 0, 300)
hub.Position = UDim2.new(0.2, 0, 0.2, 0)
hub.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
hub.Visible = false

-- 🩶 Sidebar
local sidebar = Instance.new("Frame", hub)
sidebar.Size = UDim2.new(0, 120, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- 📦 Content
local content = Instance.new("Frame", hub)
content.Size = UDim2.new(1, -120, 1, 0)
content.Position = UDim2.new(0, 120, 0, 0)
content.BackgroundColor3 = Color3.fromRGB(20, 20, 35)

-- 🧠 Onglet Player
local playerTab = Instance.new("TextButton", sidebar)
playerTab.Size = UDim2.new(1, 0, 0, 50)
playerTab.Position = UDim2.new(0, 0, 0, 20)
playerTab.Text = "Player"
playerTab.Font = Enum.Font.Arcade
playerTab.TextScaled = true
playerTab.BackgroundColor3 = Color3.fromRGB(0, 255, 180)
playerTab.TextColor3 = Color3.fromRGB(15, 15, 25)

-- 🧠 Bouton Vitesse
local vitesseBtn = Instance.new("TextButton", content)
vitesseBtn.Size = UDim2.new(0, 150, 0, 50)
vitesseBtn.Position = UDim2.new(0.3, 0, 0.2, 0)
vitesseBtn.Text = "Vitesse"
vitesseBtn.Font = Enum.Font.Arcade
vitesseBtn.TextScaled = true
vitesseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
vitesseBtn.TextColor3 = Color3.fromRGB(15, 15, 25)
vitesseBtn.Visible = false

-- 🧠 Bouton Regenerate GUI
local regenBtn = Instance.new("TextButton", content)
regenBtn.Size = UDim2.new(0, 150, 0, 50)
regenBtn.Position = UDim2.new(0.3, 0, 0.4, 0)
regenBtn.Text = "Regenerate GUI"
regenBtn.Font = Enum.Font.Arcade
regenBtn.TextScaled = true
regenBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 180)
regenBtn.TextColor3 = Color3.fromRGB(15, 15, 25)
regenBtn.Visible = false

-- 🔁 Toggle Hub
logo.MouseButton1Click:Connect(function()
    hub.Visible = not hub.Visible
end)

-- 🧠 Affiche les boutons dans l’onglet Player
playerTab.MouseButton1Click:Connect(function()
    vitesseBtn.Visible = true
    regenBtn.Visible = true
end)

-- 🧠 GUI Vitesse externe
local function createSpeedGui()
    local speedGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    speedGui.Name = "WaelSpeedGui"
    speedGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", speedGui)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.6, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.Active = true
    frame.Draggable = true

    local label = Instance.new("TextLabel", frame)
    label.Position = UDim2.new(0.25, 0, 0.1, 0)
    label.Size = UDim2.new(0, 150, 0, 50)
    label.TextColor3 = Color3.fromRGB(0, 255, 180)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Arcade
    label.TextScaled = true

    local plus = Instance.new("TextButton", frame)
    plus.Position = UDim2.new(0.6, 0, 0.5, 0)
    plus.Size = UDim2.new(0, 50, 0, 50)
    plus.Text = "+"
    plus.Font = Enum.Font.Arcade
    plus.TextScaled = true
    plus.BackgroundColor3 = Color3.fromRGB(0, 255, 180)
    plus.TextColor3 = Color3.fromRGB(15, 15, 25)

    local minus = Instance.new("TextButton", frame)
    minus.Position = UDim2.new(0.25, 0, 0.5, 0)
    minus.Size = UDim2.new(0, 50, 0, 50)
    minus.Text = "-"
    minus.Font = Enum.Font.Arcade
    minus.TextScaled = true
    minus.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
    minus.TextColor3 = Color3.fromRGB(15, 15, 25)

    local speed = 16
    local function update()
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then
            h.WalkSpeed = speed
            label.Text = "Vitesse: " .. speed
        end
    end

    plus.MouseButton1Click:Connect(function()
        speed = math.min(100, speed + 2)
        update()
    end)

    minus.MouseButton1Click:Connect(function()
        speed = math.max(8, speed - 2)
        update()
    end)

    update()
end

-- 🧠 GUI Régénère HP externe
local function createRegenGui()
    local regenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    regenGui.Name = "WaelRegenGui"
    regenGui.ResetOnSpawn = false

    local btn = Instance.new("TextButton", regenGui)
    btn.Size = UDim2.new(0, 160, 0, 60)
    btn.Position = UDim2.new(0.7, 0, 0.5, 0)
    btn.Text = "Régénère HP"
    btn.Font = Enum.Font.Arcade
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
    btn.TextColor3 = Color3.fromRGB(15, 15, 25)
    btn.Active = true
    btn.Draggable = true

    btn.MouseButton1Click:Connect(function()
        local h = player.Character and player.Character:FindFirstChild("Humanoid")
        if h then
            h.Health = h.MaxHealth
        end
    end)
end

-- 🧠 Connecte les boutons
vitesseBtn.MouseButton1Click:Connect(function()
    if not player.PlayerGui:FindFirstChild("WaelSpeedGui") then
        createSpeedGui()
    end
end)

regenBtn.MouseButton1Click:Connect(function()
    if not player.PlayerGui:FindFirstChild("WaelRegenGui") then
        createRegenGui()
    end
end)
