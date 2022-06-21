local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-------------------------------------------------------------------------------

create_augroup("onBufChange", { clear = true })

create_autocmd({ "VimEnter", "BufEnter", "BufNew", "BufCreate" }, {
    group = "onBufChange", pattern = { "*" },
    callback = function()
        vim.o.number = true
        vim.o.relativenumber = true
    end
})

create_autocmd({ "BufLeave" }, {
    group = "onBufChange", pattern = { "*" },
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
    end
})

-------------------------------------------------------------------------------

create_augroup("onInsModeChange", { clear = true })

create_autocmd({ "InsertEnter" }, {
    group = "onInsModeChange", pattern = { "*" },
    callback = function() vim.o.relativenumber = true end
})

create_autocmd({ "InsertLeave",  "InsertLeavePre" }, {
    group = "onInsModeChange", pattern = { "*" },
    callback = function() vim.o.relativenumber = false end
})

-------------------------------------------------------------------------------

create_augroup("onInitLuaWrite", { clear = true })

create_autocmd({ "BufWritePost" }, {
    group = "onInitLuaWrite", pattern = { "*/.config/*vim/*" },
    callback = function()
        vim.cmd('source ' .. vim.fn.expand('<afile>'))
    end
})

-------------------------------------------------------------------------------
