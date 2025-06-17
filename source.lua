-- source.lua — Dragonfly Spawner 🐉 by Jihan

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Locate the pet
local petFolder = RS:FindFirstChild("Pets")
if not petFolder then
    warn("[Dragonfly Spawner] ❌ 'Pets' folder not found!")
    return
end

local dragonfly = petFolder:FindFirstChild("Dragonfly")
if not dragonfly then
    warn("[Dragonfly Spawner] ❌ 'Dragonfly' not found in Pets folder!")
    return
end

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DragonflySpawnUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 120)
frame.Position = UDim2.new(0.5, -120, 0.4, -60)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.4, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Spawn Dragonfly 🐉"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.6, 0, 0.3, 0)
button.Position = UDim2.new(0.2, 0, 0.55, 0)
button.Text = "Spawn"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(50, 100, 50)
button.TextScaled = true
button.Font = Enum.Font.GothamBold

-- Button function
button.MouseButton1Click:Connect(function()
	local clone = dragonfly:Clone()
	clone.Parent = player:WaitForChild("Backpack")
	print("[Dragonfly Spawner] ✅ Dragonfly added to backpack!")
end)
