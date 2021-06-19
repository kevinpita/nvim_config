-- PERF
-- HACK
-- TODO
-- NOTE
-- FIX
-- WARNING
local function buf_set_keymap(...) vim.api.nvim_set_keymap( ...) end


-- Mappings.
local opts = { noremap=true, silent=true }

 buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    require'lspinstall'.setup() -- important

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{}
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
