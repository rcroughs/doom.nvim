local map = {}


local function new(size)
    local self = setmetatable({}, {__index = map})
    self.size = size
    self.map = {}
    for i = 1, size do
        self.map[i] = {}
        for j = 1, size do
            self.map[i][j] = 0
        end
    end
    return self
end


return map