-- Leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- vim.api.nvim_set_option()
local o = vim.o


o.errorbells = false
o.number = true
o.relativenumber = true
