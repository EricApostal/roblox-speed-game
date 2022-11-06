local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local datastore = require(ServerScriptService.libs.datastore)
local knit = require(ReplicatedStorage.Packages.Knit)

function init_player(plr)
    local data_network = knit.GetService("data_network")

    local plr_data = datastore.get(plr)

    print(plr.Name .. ' has joined the game with data: ')
    print(plr_data)

    data_network:init(plr)
end

function player_leaving(plr)
    local data_network = knit.GetService("data_network")
    local plr_data = data_network:get_data(plr)

    print(plr.Name .. ' has left the game with data: ')
    print(plr_data)
    datastore.set(plr, plr_data) -- {} is player data, change for real data later
end

Players.PlayerAdded:Connect(init_player)
Players.PlayerRemoving:Connect(player_leaving)