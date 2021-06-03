function StripTrailingWhitespaces()
    local cursorPosition = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursorPosition)
end
