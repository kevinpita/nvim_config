vim.cmd [[autocmd CursorHold * :lua vim.lsp.diagnostic.open_float()]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
vim.cmd [[autocmd FileType java lua require'plugins.configs.jdtls_setup'.setup()]]
