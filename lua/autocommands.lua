vim.cmd [[autocmd BufWritePre * :lua StripTrailingWhitespaces()]]
vim.cmd [[autocmd BufWritePre * :lua CreateDirOnSave()]]
