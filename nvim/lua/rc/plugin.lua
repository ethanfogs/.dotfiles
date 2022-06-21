return require('packer').startup(function()
    use 'L3MON4D3/LuaSnip'
    --  use 'PhilRunninger/nerdtree-buffer-ops' 
    --  use 'PhilRunninger/nerdtree-visual-selection' 
    --  use 'Xuyuanp/nerdtree-git-plugin' 
    use 'akinsho/toggleterm.nvim'
    use 'cohama/lexima.vim'
    use 'folke/lsp-colors.nvim'
    -- use 'folke/which-key.nvimfolke/which-key' -- 
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'lewis6991/impatient.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-pack/nvim-spectre'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    -- use 'nvim-treesitter/nvim-treesitter-context'
    use 'onsails/lspkind-nvim'
    use 'preservim/nerdtree'
    use 'rafi/awesome-vim-colorschemes'
    --  use 'ryanoasis/vim-devicons' 
    use 'saadparwaiz1/cmp_luasnip'
    --  use 'scrooloose/nerdtree-project-plugin' 
    --  use 'tiagofumo/vim-nerdtree-syntax-highlight' 
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-surround'
    use 'vimwiki/vimwiki'
    use 'wbthomason/packer.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'windwp/nvim-autopairs'
end)
