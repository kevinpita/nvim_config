require"lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {border = "single"}
})
require("bufferline").setup {}
require('nvim-ts-autotag').setup()
require("lsp-rooter").setup {}
require"surround".setup {}
