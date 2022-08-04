augroup onBufChange
  autocmd!
  autocmd VimEnter,BufEnter * set number
  autocmd BufLeave * set nonumber
augroup END

augroup onConfigFileWrite
 autocmd!
  autocmd BufWritePost $HOME/*{config,dotfiles}/**/*vim/**.{vim,lua} source %
  autocmd BufWritePost $HOME/*{config,dotfiles}/shell/**.*sh silent !source %
  autocmd BufWritePost $HOME/*{config,dotfiles}/tmux/*.conf silent !tmux source-file %
augroup END

if (exists('##TermClose'))
  augroup onTermExit
    autocmd! TermClose term://* bdelete
  augroup END
endif
