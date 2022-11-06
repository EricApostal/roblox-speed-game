local knit = require( game:GetService("ReplicatedStorage").Packages.Knit )
print('client running')
knit.Start():catch(warn):await()
print('knit started fully')
local data_network = knit.GetService("data_network")

wait(3)
data_network:get_data():andThen(function(data)
    print('Player Data Retrieved: ')
    print(data)
end)

print('client script finished')