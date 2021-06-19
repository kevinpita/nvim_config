vim.cmd [[colorscheme gruvbox-flat]]

require'plugins'
require'keymaps'
require'functions'
require'config'


-- Plugins config
require'treesitter'
require'lsp'
require'completion'
require'telescope_config'
require'trouble_config'
require'line_galaxy'
require'symbolsoutline'
require'pictograms'
require'lightbulb'
require'revjoin'
require'general_plugins'


require'plugins.keymaps'
require'plugins.autocommands'
