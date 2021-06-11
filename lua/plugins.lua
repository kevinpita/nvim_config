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

return require("packer").startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- ui
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'onsails/lspkind-nvim'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'folke/lsp-colors.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'p00f/nvim-ts-rainbow'

    -- TreeSitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'windwp/nvim-ts-autotag'

    -- Lines
    use 'akinsho/nvim-bufferline.lua'
    use 'glepnir/galaxyline.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'kosayoda/nvim-lightbulb'

    -- Completion
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Format
    use 'sbdchd/neoformat'

    -- Symbols and Finder
    use 'folke/trouble.nvim'
    use 'simrat39/symbols-outline.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }
    -- Basic
    use 'folke/which-key.nvim'
    use 'airblade/vim-gitgutter'
    use 'andymass/vim-matchup'
    use 'b3nj5m1n/kommentary'
    use 'blackCauldron7/surround.nvim'
    use 'wellle/targets.vim'
    use 'tpope/vim-repeat'

    -- Misc
    use 'ahmedkhalf/lsp-rooter.nvim'
    use {
        'AckslD/nvim-revJ.lua',
        requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'}
    }
    use 'andweeb/presence.nvim'

    -- Markdown

end)
