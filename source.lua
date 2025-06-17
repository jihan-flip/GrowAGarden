-- PetSpawnerScript.lua
-- Pet Spawner GUI for Roblox --
-- Made by Jihan ✨

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "PetSpawnerUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(1, -40, 0, 40)
textBox.Position = UDim2.new(0, 20, 0, 40)
textBox.PlaceholderText = "Enter Pet Name (e.g., Raccoon)"
textBox.Text = ""
textBox.ClearTextOnFocus = false
textBox.Font = Enum.Font.GothamBold
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.TextScaled = true

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.6, 0, 0, 40)
button.Position = UDim2.new(0.2, 0, 1, -60)
button.Text = "Spawn"
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextScaled = true

button.MouseButton1Click:Connect(function()
	local petName = textBox.Text
	if petName == "" then return end

	local petFolder = ReplicatedStorage:FindFirstChild("Pets")
	if not petFolder then return end

	local pet = petFolder:FindFirstChild(petName)
	if pet then
		local petClone = pet:Clone()
		petClone.Parent = player:WaitForChild("Backpack")
		print("✅ Spawned:", petName)
	else
		warn("Pet not found:", petName)
	end
end)
