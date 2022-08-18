let s:plug_home = $HOME . '/.local/share/' . v:progname . '/site/plugged'

if(!isdirectory(s:plug_home))
  let s:plug_init = (v:progname == "vim")
              \ ? $HOME . '/.vim/autoload/plug.vim'
              \ : stdpath('data') . '/site/autoload/plug.vim'

  silent execute '!curl -fLo ' . 
    \ s:plug_init . ' --create-dirs ' . 
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
end

call plug#begin(s:plug_home)
  Plug 'junegunn/vim-plug' "only for helptags, not involved with bootstrapping

  "PLUGINS COMPATIBLE WITH BOTH VIM AND NVIM
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'ryanoasis/vim-devicons'

  Plug 'chase/focuspoint-vim'

  if (has('termguicolors'))
    "TODO: resolve TERM issue for vanilla vim - since these colorschemes dont
    "       render properly, even with vim versions with &termguicolor support.
    Plug 'lifepillar/vim-solarized8'
    Plug 'mkarmona/materialbox'
    Plug 'gregsexton/Atom'
  endif

  if (v:progname == 'vim')
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'PhilRunninger/nerdtree-buffer-ops'
    Plug 'PhilRunninger/nerdtree-visual-selection'
    Plug 'RRethy/vim-illuminate'
  else
    "GENERAL HOUSEKEEPING & DEPS
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'

    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'onsails/lspkind-nvim'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'folke/lsp-colors.nvim'

    "TREESITTER (LINTING)
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-treesitter/playground'

    " CMP (AUTO-COMPLETIONS& POPUP SUGGESTIONS)
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-path'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    "TELESCOPE (CONTENT BROWSER)
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tom-anders/telescope-vim-bookmarks.nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    "POP-UP TERMINALS
    Plug 'akinsho/toggleterm.nvim'

    "FILE BROWSER
    Plug 'kyazdani42/nvim-tree.lua'

    "FILE BROWSER
    Plug 'windwp/nvim-autopairs'
    Plug 'numToStr/Comment.nvim'

    "CODE AUTO-FORMATTER
    Plug 'jose-elias-alvarez/null-ls.nvim'

    "INDENTATION GUIDE
    Plug 'lukas-reineke/indent-blankline.nvim'

    "ICONS, STATUS-LINES & DIAGNOSTICS
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-pack/nvim-spectre'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
  endif
call plug#end()
