augroup on_win_change
  autocmd!
  autocmd FileType NvimTree :finish
  autocmd WinEnter * set number   "cursorline
  autocmd WinLeave * set nonumber "nocursorline
augroup END

if (exists('##TermClose'))
  augroup on_term_exit
    autocmd! TermClose term://* bdelete
  augroup END
endif

if(exists('&guicursor'))
  augroup cursor_reset_on_vim_exit
    autocmd! VimLeavePre * set guicursor=a:ver25
   augroup END
endif
