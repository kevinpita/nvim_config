-- vim.api.nvim_set_option()
local o = vim.o
-- Basic
o.autowrite = true
o.errorbells = false
o.wrap = false

-- Set cursor to block when being on insert mode
o.guicursor = 'i:block'

-- Numbers
o.number = true
o.relativenumber = true

-- Tabs
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smarttab = true
o.autoindent = true

vim.cmd([[autocmd BufWritePre * :lua StripTrailingWhitespaces()]])
