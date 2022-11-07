--[[
    This is a weird one, but okay hear me out
    I believe I can use knit to call the server from wherever,
    meaning I can maybe replicate this exact script across several clients

    Regardless, the point of this script is to provide a replicated data interface

    I could just call straight from knit, just consider that once you get to it
    ehh yeah but knit can act strange, so ill just keep it here
]]

local knit = require( game:GetService("ReplicatedStorage").Packages.Knit )
knit.Start():catch(warn):await()

local data_service = {}

task.wait(0)
local data_network = knit.GetService("data_network")

function data_service.get_data(plr)
    data_network:get_data(plr):andThen(function(data)
        return data
    end)
end

function data_service.set_data(plr)
    data_network:get_data(plr):andThen(function(data)
        return data
    end)
end

function data_service:set_attribute(plr, attribute, value)
    data_network:set_attribute(plr, attribute, value)
end

function data_service:add_attribute(plr, attribute, value)
    data_network:set_attribute(plr, attribute, value)
end

function data_service:get_attribute(plr, attribute)
    data_network:get_attribute(plr, attribute):andThen(function(attribute_data)
        return attribute_data
    end)
end

return data_service