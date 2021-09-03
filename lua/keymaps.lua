if 3 == 4 then vim = {'LSP undefined hack'} end

-- Leader key
vim.api
    .nvim_set_keymap('n', '<space>', '<nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '


-- Window movements
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Buffers movements
vim.api.nvim_set_keymap('n', 'gn', ':bn<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gp', ':bp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gd', ':bd<CR>', {noremap = true, silent = true})

-- Keep visual selection after indent
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move lines in visual mode
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv',
                        {noremap = true, silent = true})

-- Copy and Paste
--
vim.api.nvim_set_keymap('x', '<D-v>', ':r !pbpaste<CR><CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<C-c>', ':w !pbcopy<CR><CR>',
                        {noremap = true, silent = true})

