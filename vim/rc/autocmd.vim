augroup onBufChange
    autocmd!
    autocmd VimEnter,BufEnter,BufNew,BufCreate * set number relativenumber
    autocmd BufLeave * set nonumber norelativenumber
augroup END

"-----------------------------------------------------------------------------

augroup onInstModeChange
    autocmd!
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave,InsertLeavePre * set relativenumber
augroup END

"-----------------------------------------------------------------------------

augroup onVimrcFileWrite
    autocmd!
    autocmd BufWritePost **/.config/**.vim source %
augroup END

augroup onShellRcWrite
    autocmd!
    autocmd BufWritePost **/.config/shell/**.*sh silent !source %
augroup END

augroup onTmuxConfWrite
    autocmd!
    autocmd BufWritePost **/.config/tmux/*.conf silent !tmux source-file <afile>
augroup END
