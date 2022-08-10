augroup onWinChange
  autocmd!
  autocmd WinEnter * set number   cursorline
  autocmd WinLeave * set nonumber nocursorline
augroup END

if (exists('##TermClose'))
  augroup onTermExit
    autocmd! TermClose term://* bdelete
  augroup END
endif
