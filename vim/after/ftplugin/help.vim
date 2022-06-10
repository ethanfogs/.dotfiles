if exists('b:loaded_ftplugin')
    finish
endif

let b:loaded_ftplugin = 1

let s:winheight = winheight(winnr())
let s:winheight_qtrs = s:winheight / 4

let &l:scrolloff =  s:winheight_qtrs / 3

nnoremap <buffer><CR> <C-]>
nnoremap <buffer><nowait>d <C-d>
nnoremap <buffer>u <C-u>
nnoremap <buffer>J 5<C-e>
noremap <buffer>K 5<C-y>

echo 'SOURCED: ftplugin/help.vim'
