if 3 == 4 then
   vim = {'LSP undefined hack'}
end

-- Leader key
vim.api
    .nvim_set_keymap('n', '<space>', '<nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>',
                        {noremap = true, silent = true})

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
