local ContentProvider = game:GetService("ContentProvider")
local speedcoins = {}

all_active_parts = {}

function get_length(tbl: { [string | number]: any }): number
    -- https://devforum.roblox.com/t/i-have-problem-with-tablegetn/1094089/2
	local length = 0

	for _ in pairs(tbl) do
		length += 1
	end
	return length
end

function speedcoins:spawn()
    local max_coins = 50

    if get_length(all_active_parts) >= max_coins then return end

    local part = Instance.new("Part")
    part.Name = "SpeedCoin"
    part.Anchored = true
    part.CanCollide = false
    part.Shape = Enum.PartType.Block
    part.Color = Color3.fromRGB(255, 255, 0)
    part.Position = Vector3.new( math.random(-200, 200), 1, math.random(-200, 200 ) )
    part.Size = Vector3.new(1, 2, 2)
    part.Parent = workspace
    
    all_active_parts[part] = part

    part.Touched:Connect(function(Object)
        if Object.Parent:FindFirstChild("Humanoid") then
            local plr = Object.Parent
            print("Coin touched by " .. plr.Name)

            all_active_parts[part] = nil
            part:Destroy()
        end
    end)
end

function speedcoins:loop_spawn()
    print("Looping speedcoin spawn")
    while true do
        local co = coroutine.create(function()
            speedcoins:spawn()
        end)

        coroutine.resume(co)
        task.wait(0)
    end
end



return speedcoins