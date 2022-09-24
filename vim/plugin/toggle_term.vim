let toggle_term = {}

" ----------------------------------------------------------------------------

function toggle_term.toggle() dict abort
  if(empty(gettabinfo(get(self, 'tabnr', 0))))
    call execute('tabnew | terminal')
    let self.tabnr = tabpagenr()
  else
    execute('tab' . (tabpagenr() != self.tabnr
          \ ? 'next ' . self.tabnr
          \ : tabpagenr('$') > 1 ? 'previous' : 'new'))

  endif
endfunction

" ----------------------------------------------------------------------------

command! -nargs=* ToggleTerm call toggle_term.toggle()

" ----------------------------------------------------------------------------

" Start insert-mode when entering terminal-tab (regardless of mode)
noremap <C-\> <Esc><Cmd>ToggleTerm<CR>i
noremap! <C-\> <Esc><Cmd>ToggleTerm<CR>i

noremap <Space>T <Cmd>ToggleTerm<CR>i

" Exit terminal-tab regardless of current mode
tnoremap <C-\> <C-\><C-n><Cmd>ToggleTerm<CR>
