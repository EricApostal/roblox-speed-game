--[[
    Handles the actual speed with speedcoins
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local data = require(ReplicatedStorage.libs.data)
local localplayer  = game:GetService("Players").LocalPlayer

while true do
    character = localplayer.Character or localplayer.CharacterAdded:Wait()
    print('Coins: ')
    print(data:get_attribute("coins"))
    character:WaitForChild("Humanoid").WalkToPoint = data:get_attribute("coin")
    task.wait(1)
end