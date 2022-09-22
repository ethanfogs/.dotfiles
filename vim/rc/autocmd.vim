augroup on_win_change
  autocmd! BufEnter,WinEnter * set number cursorline colorcolumn=79
  autocmd! BufLeave,WinLeave * set nonumber nocursorline colorcolumn=0
augroup END

" ----------------------------------------------------------------------------

if (exists('##TermClose'))
  augroup on_term_exit
    autocmd! TermClose term://* :bdelete
  augroup END
endif

" ----------------------------------------------------------------------------

if(exists('&guicursor'))
  augroup cursor_reset_on_vim_exit
    autocmd! VimLeavePre * set guicursor=a:ver25
  augroup END
endif
