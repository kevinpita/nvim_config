vim.cmd([[autocmd CursorHold * :lua vim.lsp.diagnostic.show_line_diagnostics()]])
