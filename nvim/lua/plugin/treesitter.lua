local treesitter = require("nvim-treesitter")
local configs    = require("nvim-treesitter.configs")

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

configs.setup({
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        -- use_languagetree = true,
        enable = true,
    },
    autopairs = { enable = true, },
    indent = { enable = false, },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true,
        disable = { "xml" },
    },
    rainbow = {
        enable = true,
        colors = { "Gold", "Orchid", "DodgerBlue", },
        disable = { "html" },
    },
    playground = { enable = true, },
})
