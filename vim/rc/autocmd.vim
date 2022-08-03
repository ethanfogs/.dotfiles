augroup on_config_write
    autocmd!
    autocmd BufWritePost $HOME/*{config,dotfiles}/**/*vim/**.{vim,lua} source %
augroup END

augroup onShellRcWrite
    autocmd!
    autocmd BufWritePost **/.config/shell/**.*sh silent !source %
augroup END

augroup onTmuxConfWrite
    autocmd!
    autocmd BufWritePost **/tmux/*.conf 
                \ silent !tmux source-file %
augroup END

if (exists('##TermClose'))
    augroup onTermExit
        autocmd!
        autocmd TermClose term://* bdelete
    augroup END
endif

if (&runtimepath =~ ".*/nvim-lspconfig")
    augroup FormatOnBufWrite
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
    augroup END
endif
