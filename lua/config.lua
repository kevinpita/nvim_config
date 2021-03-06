-- vim.api.nvim_set_option()
local o = vim.opt

-- Colorscheme

-- Basic
o.autowrite = true
o.errorbells = false
o.wrap = false
o.swapfile = false
o.ruler = true
o.hidden = true
o.incsearch = true
o.backup = false
o.showcmd = true
o.ignorecase = true
o.smartcase = true
o.list = true

-- Scroll
o.scrolloff = 5
o.sidescroll = 10

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

-- CursorHold
o.updatetime = 2000

-- ColorColumn
o.colorcolumn = "88"
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=LightRed]]

-- Call remove whitespaces when file is saved
