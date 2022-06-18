local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-------------------------------------------------------------------------------

local on_BufChange = create_augroup("on_BufChange", {
    clear = true
})

create_autocmd({ "VimEnter", "BufEnter", "BufNew", "BufCreate" }, {
    group = on_BufChange,
    pattern = { "*" },
    callback = function()
        vim.o.number = true
        vim.o.relativenumber = true
    end
})

create_autocmd({ "BufLeave" }, {
    group = on_BufChange,
    pattern = { "*" },
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
    end
})

-------------------------------------------------------------------------------

local on_InsModeChange = create_augroup("on_InsModeChange",{ clear = true })

create_autocmd({ "InsertEnter" }, {
    group = on_InsModeChange,
    pattern = { "*" },
    callback = function()
        vim.o.relativenumber = true
    end
})

create_autocmd({ "InsertLeave",  "InsertLeavePre" }, {
    group = on_InsModeChange,
    pattern = { "*" },
    callback = function()
        vim.o.relativenumber = false
    end
})

-------------------------------------------------------------------------------

local on_VimrcFile_Write = create_augroup("on_VimrcFile_Write", { clear = true })

create_autocmd({ "BufWritePost" }, {
    group = on_VimrcFile_Write,
    pattern = { "*/.config/*vim/*" },
    callback = function()
	    dofile(vim.fn.expand("%:p"))
    end
})

-------------------------------------------------------------------------------
