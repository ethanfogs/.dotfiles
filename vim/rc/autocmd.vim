augroup on_BufChange
    autocmd!
    autocmd VimEnter,BufEnter,BufNew,BufCreate * set number relativenumber
    autocmd BufLeave * set nonumber norelativenumber
augroup END

"-----------------------------------------------------------------------------

augroup on_InsertMode_EnterLeave
    autocmd!
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave,InsertLeavePre * set relativenumber
augroup END

"-----------------------------------------------------------------------------

augroup on_VimrcFile_Write
    autocmd!
    autocmd BufWritePost $XDG_CONFIG_HOME/**.vim source %
augroup END
