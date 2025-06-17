-- source.lua
-- Grow a Garden Pet Spawner by Jihan
-- Spawn pets like Raccoon, Dragonfly with one click

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Build GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "GAGPetSpawner"
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 100)
frame.Position = UDim2.new(0.5, -125, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local dropdown = Instance.new("TextBox", frame)
dropdown.PlaceholderText = "Enter pet: Raccoon, Dragonfly"
dropdown.Size = UDim2.new(1, -20, 0, 40)
dropdown.Position = UDim2.new(0, 10, 0, 10)
dropdown.ClearTextOnFocus = false
dropdown.TextColor3 = Color3.new(1,1,1)
dropdown.BackgroundColor3 = Color3.fromRGB(40,40,40)

local spawnBtn = Instance.new("TextButton", frame)
spawnBtn.Text = "Spawn Pet"
spawnBtn.Size = UDim2.new(0.5, -10, 0, 30)
spawnBtn.Position = UDim2.new(0.25, 0, 0, 60)
spawnBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
spawnBtn.TextColor3 = Color3.new(1,1,1)

-- Define Pet List — adapt with actual names
local validPets = { "Raccoon", "Dragonfly", "RedFox", "QueenBee" }

spawnBtn.MouseButton1Click:Connect(function()
    local input = dropdown.Text:lower()
    local petFolder = ReplicatedStorage:FindFirstChild("Pets")
    if not petFolder then return warn("Pets folder not found") end

    for _, pet in ipairs(petFolder:GetChildren()) do
        if pet.Name:lower():match(input) then
            local clone = pet:Clone()
            clone.Parent = player:WaitForChild("Backpack")
            print("✅ Spawned pet:", pet.Name)
            return
        end
    end
    warn("❌ Pet not found:", dropdown.Text)
end)
