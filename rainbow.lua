repeat wait() until game:IsLoaded()

local ScreenGui = Instance.new("ScreenGui")
local Fps = Instance.new("TextLabel")
local Ping = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Fps.Name = "Fps"
Fps.Parent = ScreenGui
Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fps.BackgroundTransparency = 1.000
Fps.Position = UDim2.new(0, 10, 0, 10)
Fps.Size = UDim2.new(0, 100, 0, 20)
Fps.Font = Enum.Font.SourceSans
Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
Fps.TextScaled = true
Fps.TextSize = 10.000
Fps.TextWrapped = true

Ping.Name = "Ping"
Ping.Parent = ScreenGui
Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ping.BackgroundTransparency = 1.000
Ping.BorderColor3 = Color3.fromRGB(255, 255, 255)
Ping.Position = UDim2.new(0, 10, 0, 40)
Ping.Size = UDim2.new(0, 100, 0, 20)
Ping.Font = Enum.Font.SourceSans
Ping.TextColor3 = Color3.fromRGB(253, 253, 253)
Ping.TextScaled = true
Ping.TextSize = 10.000
Ping.TextWrapped = true

local RunService = game:GetService("RunService")

local function getRainbowColor()
    local time = tick() / 8
    return Color3.fromHSV((time % 1), 1, 1)
end

RunService.RenderStepped:Connect(function(frame)
    Fps.Text = ("FPS: " .. math.round(1/frame)) 
    
    Ping.Text = ("Ping: " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2/frame)))
    
    Fps.TextColor3 = getRainbowColor()
    Ping.TextColor3 = getRainbowColor()
end)
