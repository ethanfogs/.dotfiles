source ~/.config/vim/rc/autocmd.vim
source ~/.config/vim/rc/keymap.vim
source ~/.config/vim/rc/opt.vim
source ~/.config/vim/rc/plugin.vim

colorscheme materialbox

function! ChangeDir(dir=$HOME)
    execute(()gettabinfo()->len() > 1 ? 'tcd' : 'cd') . ' ' . a:dir)
endfunction
