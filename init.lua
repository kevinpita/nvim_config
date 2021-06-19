require 'functions'
require 'config'
require 'plugins.list'

vim.cmd [[colorscheme gruvbox-flat]]

require 'keymaps'

-- Plugins config
require 'plugins.configs.treesitter'
require 'plugins.configs.lsp'
require 'plugins.configs.completion'
require 'plugins.configs.telescope'
require 'plugins.configs.trouble'
require 'plugins.configs.galaxyline'
require 'plugins.configs.symbolsoutline'
require 'plugins.configs.pictograms'
require 'plugins.configs.lightbulb'
require 'plugins.configs.revjoin'

require 'plugins.keymaps'
require 'plugins.autocommands'
