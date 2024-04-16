local player = require('doom.app.player')
local map = require('doom.app.map')

local app = {}


function app:new()
    local player_one = player.new(0, 0, 0)
    local map_one = map.new(10)

end

return app