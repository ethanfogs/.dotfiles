local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-------------------------------------------------------------------------------

create_augroup("onBufChange", { clear = true })
create_autocmd({ "VimEnter", "BufEnter", "BufNew", "BufCreate" }, {
    group = "onBufChange", pattern = { "*" },
    callback = function()
        vim.o.number = true
        vim.o.relativenumber = false
    end
})
create_autocmd({ "BufLeave" }, {
    group = "onBufChange", pattern = { "*" },
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = true
    end
})

-------------------------------------------------------------------------------

create_augroup("onInsModeChange", { clear = true })
create_autocmd({ "InsertEnter" }, {
    group = "onInsModeChange", pattern = { "*" },
    callback = function()
        vim.o.relativenumber = true
    end
})

create_autocmd({ "InsertLeave", "InsertLeavePre" }, {
    group = "onInsModeChange", pattern = { "*" },
    callback = function()
        vim.o.relativenumber = false
    end
})

-------------------------------------------------------------------------------

create_augroup("onInitLuaWrite", { clear = true })
create_autocmd({ "BufWritePost" }, {
    group = "onInitLuaWrite", pattern = { "*/.config/*vim/*" },
    command = 'source <afile>'
})

-------------------------------------------------------------------------------

create_augroup("onShellRcWrite", { clear = true })
create_autocmd({ "BufWritePost" }, {
    group = "onShellRcWrite", pattern = { "*/.config/shell/*.*sh" },
    command = 'silent !source <afile>'
})

-------------------------------------------------------------------------------

create_augroup("onTmuxConfWrite", { clear = true })
create_autocmd({ "BufWritePost" }, {
    group = "onTmuxConfWrite", pattern = "*/.config/tmux/*.conf",
    command = 'silent !tmux source-file <afile>'
})

-------------------------------------------------------------------------------

create_augroup("formatOnBufWrite", { clear = true })
create_autocmd({ "BufWritePre" }, {
    group = "formatOnBufWrite", pattern = "*.*",
    callback = vim.lsp.buf.formatting_sync
})

-------------------------------------------------------------------------------

create_autocmd("TermClose", {
    pattern = { "term://*" },
    callback = function()
        vim.api.nvim_buf_delete(0, {})
    end
})
