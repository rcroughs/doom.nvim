
--- @class WindowDetails
--- @field buf number The buffer id
--- @field win_id number The window id

local M = {}


--- Create a floating window
--- @return winProperties table The window properties
function M.createFloatWin() 
    local buf = vim.api.nvim_create_buf(false, false)
    local height = vim.api.nvim_win_get_height(0)
    local width = vim.api.nvim_win_get_width(0)
    local win_id = vim.api.nvim_open_win(buf, true, {
        relative = 'win',
        row = 3,
        col = 3,
        height = height - 6,
        width = width - 6
    })
    return {
        buf = buf,
        win_id = win_id
    }
end


--- Close the floating window
--- @param opts WindowDetails The window properties
function M.closeFloatWin(opts)
    if opts.win_id ~= nil and vim.api.nvim_win_is_valid(opts.win_id) then
        vim.api.nvim_win_close(opts.win_id, true)
    end

    if opts.buf ~= nil and vim.api.nvim_buf_is_valid(opts.buf) then
        vim.api.nvim_buf_delete(opts.buf, {force = true})
    end
end

--- Draw point in the floating window
--- @param x int The x coordinate
--- @param y int The y coordinate
function M.drawPoint(x, y)
    vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, {string.rep(' ', x) .. 'X' .. string.rep(' ', 80 - x)})
end


--- Setup the Window module
--- @param opts table
function M.setup(opts)
    M.buf = M.createFloatWin()
    
end

return M