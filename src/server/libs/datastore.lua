local runservice = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")

local database_name = "dev-3"
local database = DataStoreService:GetDataStore(database_name)

local dataservice = {}

function dataservice.test()
    local user = "client"
    if runservice:IsServer() then user = "server" end
    print("dataservice called from the " .. user )
end

function dataservice.set(player, value)	
	local success, errormessage = pcall(function()
		database:SetAsync(player.UserId, value)

        --[[
            Creates an index of the database
            This is so I can iterate through it later

            It is prone to data loss, but it's not a huge
            deal as this isn't the actual data, just indexes
        ]]
        
        local keys = database:GetAsync("keys")
        if not keys then keys = {} end
        table.insert(keys, player.UserId)
        database:SetAsync("keys", keys)
	end)
	
	if not success then
		print('datastore failed')
		error(errormessage)
		return false
	end
	return true
end

function dataservice.get(player)
	local success, errormessage = pcall(function()
		_r = database:GetAsync(player.UserId)
	end)
	if not success then
		print(errormessage)
		return false
	end
	return _r
end

function dataservice.dump()
    -- Dumps whole database
    local keys = database:GetAsync("keys")
    local db_array = {}

    for _, key in keys do
        db_array[key] = database:GetAsync(key)
    end
    print(db_array)
end

function dataservice.wipe()
    -- Wipes the whole database
    warn("You are attempting to recursively wipe the database! This is a bad idea, and takes a long time. I recommend you make a new database entirely, or remove an entry manually.")
    for _, key in database:GetAsync("keys") do
        database:RemoveAsync(key)
    end
end

return dataservice