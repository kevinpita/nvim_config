-- hop
vim.api.nvim_set_keymap('n', '<leader>hh',
                        "<cmd>lua require'hop'.hint_words()<cr>", {})

-- nvim-compe
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]],
                        {silent = true, expr = true})

-- LSP
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
                        {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':Telescope live_grep<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>d', ':Telescope lsp_definitions<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rr', ':Telescope lsp_references<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>a', ':Telescope lsp_code_actions<CR>',
                        {noremap = true, silent = true})

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Trouble<cr>",
                        {silent = true, noremap = true})
