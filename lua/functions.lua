function StripTrailingWhitespaces()
    local cursorPosition = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursorPosition)
end

-- https://github.com/jghauser/mkdir.nvim/blob/main/lua/mkdir.lua

function CreateDirOnSave()
    local fn = vim.fn
    local dir = fn.expand('%:p:h')

    if fn.isdirectory(dir) == 0 then fn.mkdir(dir, 'p') end

end
