vim.cmd [[autocmd BufWritePre * :lua if vim.bo.filetype ~= "markdown" then StripTrailingWhitespaces() end]]
vim.cmd [[autocmd BufWritePre * :lua CreateDirOnSave()]]
