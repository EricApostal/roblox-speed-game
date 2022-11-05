print("Hello Speed, from client!")

local ReplicatedStorage = game:GetService("ReplicatedStorage").Common
local Players = game:GetService("Players")

local Roact = require(ReplicatedStorage.Roact)

local app = Roact.createElement("ScreenGui", {}, {
    HelloWorld = Roact.createElement("TextLabel", {
        Size = UDim2.new(0, 400, 0, 300),
        Text = "Hello, Roact!"
    })
})

Roact.mount(app, Players.LocalPlayer.PlayerGui)