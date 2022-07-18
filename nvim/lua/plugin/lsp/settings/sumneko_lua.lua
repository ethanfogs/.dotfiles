-- TODO: setup global vim var to prevent lsp from not recognizing it
return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                    [vim.fn.getcwd()] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
