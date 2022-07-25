if(!filereadable($HOME . '/.vim/autoload/plug.vim'))
    let s:plug_path = '~/.vim/autoload/plug.vim'
    let s:plug_gh = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    silent execute '!curl --silent -fLo ' . s:plug_path . ' --create-dirs ' . s:plug_gh
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
end

call plug#begin()
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'PhilRunninger/nerdtree-buffer-ops'
    Plug 'PhilRunninger/nerdtree-visual-selection'
call plug#end()
