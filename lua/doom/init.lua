local M = {}

local window = require('doom.window')

function M.setup(opts)
    vim.api.nvim_create_user_command('Doom', function()
        window.createFloatWin()
    end, {})
end

return M