-- source.lua — Grow a Garden Pet Spawner by Jihan 🌱

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Fetch the Pets folder
local petFolder = RS:FindFirstChild("Pets")
if not petFolder then
    warn("[Pet Spawner] ❌ 'Pets' folder missing in ReplicatedStorage")
    return
end

-- GUI
local G = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
G.Name = "GAGPetSpawner"
local F = Instance.new("Frame", G)
F.Size = UDim2.new(0, 300, 0, 140)
F.Position = UDim2.new(0.5, -150, 0.3, -70)
F.BackgroundColor3 = Color3.fromRGB(20,20,20)
F.BorderSizePixel = 0
F.Active = true
F.Draggable = true

-- Dropdown / Text Input
local T = Instance.new("TextBox", F)
T.Size = UDim2.new(1, -20, 0, 40)
T.Position = UDim2.new(0, 10, 0, 10)
T.PlaceholderText = "Type pet name… (e.g. Raccoon)"
T.ClearTextOnFocus = false
T.TextColor3 = Color3.fromRGB(230,230,230)
T.BackgroundColor3 = Color3.fromRGB(40,40,40)
T.TextScaled = true

-- Button
local B = Instance.new("TextButton", F)
B.Size = UDim2.new(0.6, 0, 0, 40)
B.Position = UDim2.new(0.2, 0, 0, 60)
B.Text = "Spawn!"
B.Font = Enum.Font.GothamBold
B.TextColor3 = Color3.new(1,1,1)
B.BackgroundColor3 = Color3.fromRGB(60,60,60)
B.TextScaled = true

-- Debug: print available pets
for _, p in ipairs(petFolder:GetChildren()) do
    print("[Pet Spawner] 🐾 Found pet:", p.Name)
end

-- Button action
B.MouseButton1Click:Connect(function()
    local inp = T.Text:lower()
    if inp == "" then return end

    for _, pet in ipairs(petFolder:GetChildren()) do
        if pet.Name:lower():match(inp) then
            local clone = pet:Clone()
            clone.Parent = player:WaitForChild("Backpack")
            print("[Pet Spawner] ✅ Spawned:", pet.Name)
            return
        end
    end

    warn("[Pet Spawner] ❌ No matching pet for:", T.Text)
end)
