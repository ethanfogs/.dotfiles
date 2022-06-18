if exists('b:loaded_ftplugin')
    finish
endif
let b:loaded_ftplugin = 1

"OPTS -------------------------------------------------------------------------
let &l:scrolloff = winheight(winnr()) / 4

"KEYMAPS ----------------------------------------------------------------------
nnoremap <buffer><CR> <C-]>

nnoremap <buffer><nowait>d 3<C-e>
nnoremap <buffer><nowait>u 3<C-y>

noremap <buffer>J <C-d>
noremap <buffer>K <C-u>
