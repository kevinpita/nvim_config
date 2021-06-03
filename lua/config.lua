-- vim.api.nvim_set_option()
local o = vim.o


-- Colorscheme
vim.cmd[[colorscheme gruvbox-flat]]


-- Basic
o.autowrite = true
o.errorbells = false
o.wrap = false
o.swapfile = false
o.ruler = true

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

-- ColorColumn
o.colorcolumn = "80"
vim.cmd[[highlight ColorColumn ctermbg=0 guibg=LightRed]]

-- Call remove whitespaces when file is saved
vim.cmd[[autocmd BufWritePre * :lua StripTrailingWhitespaces()]]
