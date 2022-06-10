if v:progname == 'nvim'
    let g:plug_head = stdpath('data') . '/plugged'
endif

call plug#begin()
    "GIT
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'cohama/lexima.vim'
                                                                  
    "COLORSHEMES
    Plug 'rafi/awesome-vim-colorschemes'

    "MISC
    Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-surround'

    if v:progname == 'nvim'
        "LSP\AUTOCOMPLETE
        Plug 'neovim/nvim-lspconfig'
        Plug 'folke/lsp-colors.nvim'
        Plug 'glepnir/lspsaga.nvim'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
        Plug 'L3MON4D3/LuaSnip'
        Plug 'windwp/nvim-autopairs'
        Plug 'nvim-lualine/lualine.nvim'
        Plug 'nvim-lua/plenary.nvim'
        "Plug 'akinsho/toggleterm.nvim'

        "File Manager
        Plug 'preservim/nerdtree'

        "MENUS\POPUPS\SIDEBARS
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-nvim-lua'
        Plug 'hrsh7th/cmp-path'
        Plug 'saadparwaiz1/cmp_luasnip'
        Plug 'onsails/lspkind-nvim'
        "Plug 'kyazdani42/nvim-tree.lua'
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-telescope/telescope-fzy-native.nvim'
        Plug 'nvim-telescope/telescope-symbols.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
    endif
call plug#end()
