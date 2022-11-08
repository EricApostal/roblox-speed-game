local ReplicatedStorage = game:GetService("ReplicatedStorage")
local data = require( ReplicatedStorage.libs.data )
local knit = require( game:GetService("ReplicatedStorage").Packages.Knit )
local Players = game:GetService("Players")

knit.Start():catch(warn):await()

task.wait(3)

print("Data recieved: ")
print( data:get_data(Players.LocalPlayer) )