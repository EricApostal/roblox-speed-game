local knit = require( game:GetService("ReplicatedStorage").Packages.Knit )
knit.Start():catch(warn):await()

local data_network = knit.GetService("data_network")
wait(3)

data_network:get_data():andThen(function(data)
    print('Player Data Retrieved: ')
    print(data)
end)
