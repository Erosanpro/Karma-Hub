local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- Font ayarı
local guiFont = Enum.Font.Gotham

-- GUI Oluşturma
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 9999
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local function createLabel(parent, size, position, text, color, scaled)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.Font = guiFont
    label.TextScaled = scaled or false
    label.Parent = parent
    return label
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = screenGui

-- Başlık
createLabel(frame, UDim2.new(1, 0, 0, 60), UDim2.new(0, 0, 0.05, 0), 
    "Fling Things And People Script (DARK HUB)", Color3.fromRGB(255, 0, 0), true)

-- Ana metin
createLabel(frame, UDim2.new(1, 0, 0, ), UDim2.new(0, 0, 0.3, 0), 
    "Eski BlizT Premium + Srv9 Loaded!", Color3.fromRGB(255, 0, 0), true)

-- İpucu metni
createLabel(frame, UDim2.new(1, 0, 0, 60), UDim2.new(0, 0, 0.45, 0), 
    "İpucu: BlizT ekranı kapatma tuşu [M]  |  Srv9 tuşu [Sağ Shift]", Color3.fromRGB(255, 0, 0), true)

-- Başlama açıklaması
createLabel(frame, UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0.55, 0), 
    "Başlamak için B tuşuna basın veya butona tıklayın.", Color3.new(1, 1, 1), true)

-- Başla Butonu
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 250, 0, 70)
startButton.Position = UDim2.new(0.5, 0, 0.7, 0)
startButton.AnchorPoint = Vector2.new(0.5, 0.5)
startButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
startButton.Text = "Başla"
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.TextScaled = true
startButton.Font = guiFont
startButton.Parent = frame

local uicorner1 = Instance.new("UICorner")
uicorner1.CornerRadius = UDim.new(0, 20)
uicorner1.Parent = startButton

-- GetSRV9 Butonu
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 250, 0, 50)
getKeyButton.Position = UDim2.new(0.5, 0, 0.85, 0)
getKeyButton.AnchorPoint = Vector2.new(0.5, 0.5)
getKeyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
getKeyButton.Text = "Kopyala SRV9 Keyi"
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.TextScaled = true
getKeyButton.Font = guiFont
getKeyButton.Parent = frame

local uicorner2 = Instance.new("UICorner")
uicorner2.CornerRadius = UDim.new(0, 15)
uicorner2.Parent = getKeyButton

local function closeGui()
    screenGui:Destroy()
end

local function runScripts()
    getgenv().gethui = function() return game.CoreGui end
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Oxwoey/Main/refs/heads/main/ScriptHub/srv9FREE"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/chaosscripter/cracks/m/blitz"))()
end

local function start()
    closeGui()
    runScripts()
end

startButton.MouseButton1Click:Connect(start)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.B then
            start()
        end
    end
end)

-- GetSRV9 Butonuna basınca Key panoya kopyalanıyor
getKeyButton.MouseButton1Click:Connect(function()
    local srv9Key = "GetSRV9"  -- Buraya gerçek key linkini koy
    if setclipboard then
        setclipboard(srv9Key)
        StarterGui:SetCore("SendNotification", {
            Title = "SRV9 Key";
            Text = "Key panoya kopyalandı!";
            Duration = 3;
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Error";
            Text = "Executor panoya kopyalamayı desteklemiyor!";
            Duration = 5;
        })
    end
end)
