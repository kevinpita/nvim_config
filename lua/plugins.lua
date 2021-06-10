local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer
    use "wbthomason/packer.nvim"
    -- Packer

    use { 'nvim-telescope/telescope.nvim',
        requires = {
                    {'nvim-lua/popup.nvim'},
                    {'nvim-lua/plenary.nvim'}
                   }
        }

    -- ui
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'folke/todo-comments.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'simrat39/symbols-outline.nvim'

    -- Basic
    use 'airblade/vim-gitgutter'
    use 'glepnir/indent-guides.nvim'
    use 'andymass/vim-matchup'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'

    -- Markdown

end)
