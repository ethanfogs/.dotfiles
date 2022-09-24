let s:plug = {}
let s:plug.data = $HOME . '/.local/share/' . v:progname . '/site/plugins'
let s:plug.head = $HOME . '/.local/share/' . v:progname . '/site/autoload'

let &runtimepath .= (&runtimepath =~ s:plug.head) ? '' : ',' . s:plug.head

if(!filereadable(s:plug.autoload . '/plug.vim'))
  let s:plug.uri =  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call system('curl -sSfLO --create-dirs --output-dir ' . s:plug.autoload . ' ' . s:plug.uri)
  let s:plug.sync = 1
endif

"-----------------------------------------------------------------------------

call plug#begin(s:plug.data)

  Plug 'junegunn/vim-plug' "only for helptags, not involved with bootstrapping

  " GIT PLUGINS
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

  " FILE-BROWSER
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/nerdtree-project-plugin'
    " Plug 'PhilRunninger/nerdtree-buffer-ops'
    " Plug 'PhilRunninger/nerdtree-visual-selection'

  " USER-INTERACTIVE BASED PLUGINS
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

  " VISUAL BASED PLUGINS
    Plug 'RRethy/vim-illuminate'
    Plug 'airblade/vim-gitgutter'
    Plug 'chrisbra/Colorizer'

  " VISUAL BASED PLUGINS
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'

    " COLORSCHEMES
      " Plug 'chriskempson/base16-vim'
      " Plug 'chase/focuspoint-vim'
      " Plug 'lifepillar/vim-solarized8'
      " Plug 'mkarmona/materialbox'
      " Plug 'gregsexton/Atom'

    " VIM LSP
      Plug 'prabirshrestha/vim-lsp'
      Plug 'mattn/vim-lsp-settings'

    " AUTO-COMPLETIONS
      Plug 'prabirshrestha/asyncomplete.vim'
      Plug 'prabirshrestha/asyncomplete-lsp.vim'
      " Plug 'Shougo/ddc.vim'

    " TREESITTER EQUIVELANT FOR VIM
      Plug 'wellle/context.vim'

    " DEBUGGING
      Plug 'puremourning/vimspector'
call plug#end()

" ----------------------------------------------------------------------------

function s:open_plugin_github_repo(repo=trim(expand('<cWORD>'), '[''"]'))
  if(a:repo !~ '\w\+\/\w\+') | return | endif
  if(system('curl https://api.github.com/repos/' . a:repo) !~ "Not Found")
    call system('open https://github.com/' . a:repo)
  endif
endfunction

nnoremap <buffer> <C-]> <Cmd>call <SID>open_plugin_github_repo()<CR>
