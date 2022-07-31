augroup onBufChange
    autocmd!
    autocmd VimEnter,BufEnter,BufNew,BufCreate * set number relativenumber
    autocmd BufLeave * set nonumber norelativenumber
augroup END

"-----------------------------------------------------------------------------

augroup onInsertModeChange
    autocmd!
    autocmd InsertEnter * let &relativenumber = v:false
    autocmd InsertLeavePre * let &relativenumber = v:true
augroup END

"-----------------------------------------------------------------------------

let ft_source_map = #{
    \ vim:  'source %',
    \ nvim: 'source %',
    \ bash: '!source %',
    \ sh:   '!source %',
    \ zsh:  '!source %',
    \ tmux: '!tmux source-file <afile>',
\}

augroup on_config_write
    autocmd!
    autocmd BufWritePost **/.{config,dotfiles}/**/*vim/**.{vim,lua} source <afile>
augroup END

augroup onShellRcWrite
    autocmd!
    autocmd BufWritePost **/.config/shell/**.*sh silent !source %
augroup END

augroup onTmuxConfWrite
    autocmd!
    autocmd BufWritePost **/tmux/*.conf 
                \ silent !tmux source-file $HOME/.config/tmux/tmux.conf
augroup END

augroup onShellScriptFileEnter
    autocmd!
    autocmd FileType bash,zsh,sh 
        \ let &l:makeprg = executable(expand('<afile>:p')) ? './%' : '.\ ./%'
augroup END
