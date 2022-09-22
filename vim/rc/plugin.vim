let b:lasttick = b:changedtick

let s:plug = {}
let s:plug.data = $HOME . '/.local/share/' . v:progname . '/site/plugged'
let s:plug.head  = ((v:progname == 'nvim') ? stdpath('data') . '/site' : $HOME . '/.vim') . '/autoload'

if(!filereadable(s:plug.head . '/plug.vim'))
  let s:plug.uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call system('curl -sSfLO --create-dirs --output-dir ' . s:plug.head . ' ' . s:plug.uri)
  let s:plug.sync = 1
endif

"-----------------------------------------------------------------------------

call plug#begin(s:plug.data)
  Plug 'junegunn/vim-plug' "only for helptags, not involved with bootstrapping

  "PLUGINS COMPATIBLE WITH BOTH VIM AND NVIM
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'PhilRunninger/nerdtree-buffer-ops'
  " Plug 'PhilRunninger/nerdtree-visual-selection'

  Plug 'RRethy/vim-illuminate'

  Plug 'jiangmiao/auto-pairs'

  Plug 'airblade/vim-gitgutter'

  Plug 'chriskempson/base16-vim'
  Plug 'chase/focuspoint-vim'
  " if (has('termguicolors'))
    Plug 'lifepillar/vim-solarized8'
    Plug 'mkarmona/materialbox'
    Plug 'gregsexton/Atom'
  " endif

  if(v:progname == 'vim' || v:progname == 'vi')
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'wellle/context.vim'
  else

    "GENERAL HOUSEKEEPING & DEPS
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'

    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'onsails/lspkind-nvim' " lsp pictograms
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'folke/lsp-colors.nvim' " colorscheme support for lsp buffers
    Plug 'nvim-pack/nvim-spectre'

    "TREESITTER (LINTING)
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdateSync' }
    Plug 'nvim-treesitter/nvim-treesitter-context'
    " Plug 'nvim-treesitter/playground'

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
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-project.nvim'

    if (has('linux'))
      Plug 'nvim-telescope/telescope-media-files.nvim'
    endif

    " Plug 'akinsho/toggleterm.nvim'

    "CODE AUTO-FORMATTER
    Plug 'jose-elias-alvarez/null-ls.nvim'

    Plug 'kyazdani42/nvim-web-devicons'

    "INDENTATION GUIDE
    Plug 'lukas-reineke/indent-blankline.nvim'

    " Plug 'glepnir/dashboard-nvim'

    "ICONS & STATUS-LINES
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'
  endif
call plug#end()
