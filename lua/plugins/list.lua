local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require'packer'.startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- ui
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'onsails/lspkind-nvim',
        config = function() require 'plugins.configs.pictograms' end
    }
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'folke/lsp-colors.nvim'
    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require'lsp_signature'.on_attach({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = {border = "single"}
            })
        end
    }
    use 'p00f/nvim-ts-rainbow'
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'plugins.configs.treesitter' end

    }
    use {
        'windwp/nvim-ts-autotag',
        config = function() require'nvim-ts-autotag'.setup() end
    }

    -- Lines
    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require'bufferline'.setup {} end
    }
    use {
        'glepnir/galaxyline.nvim',
        config = function() require 'plugins.configs.galaxyline' end

    }

    -- LSP
    use {'neovim/nvim-lspconfig', config = function() require 'plugins.configs.lsp' end}
    use 'kabouzeid/nvim-lspinstall'
    use {
        'kosayoda/nvim-lightbulb',
        config = function() require 'plugins.configs.lightbulb' end
    }

    -- Completion
    use {
        'hrsh7th/nvim-compe',
        config = function() require 'plugins.configs.completion' end
    }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Format
    use 'sbdchd/neoformat'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require 'plugins.configs.telescope' end
    }

    -- Symbols and Finder
    use {
        'folke/trouble.nvim',
        config = function() require 'plugins.configs.trouble' end
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function() require 'plugins.configs.symbolsoutline' end

    }
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }
    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim",
        config = function() require'todo-comments'.setup {} end
    }
    use {'kyazdani42/nvim-tree.lua',
        config = function() require'plugins.configs.luatree' end
}

    -- Basic
    use 'folke/which-key.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'plugins.configs.gitsigns' end

    }
    use 'andymass/vim-matchup'
    use 'b3nj5m1n/kommentary'
    use {
        'blackCauldron7/surround.nvim',
        config = function() require'surround'.setup {} end

    }
    use 'wellle/targets.vim'
    use 'tpope/vim-repeat'

    -- Misc
    use {
        'ahmedkhalf/lsp-rooter.nvim',
        config = function() require'lsp-rooter'.setup {} end
    }
    use 'sudormrfbin/cheatsheet.nvim'

    -- Markdown
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

end)
