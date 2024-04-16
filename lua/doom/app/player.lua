local player = {}


---
function player.new(x,y,direction)
    local self = setmetatable({}, {__index = player})
    self.x = x
    self.y = y
    self.direction = direction
    return self
end



return player