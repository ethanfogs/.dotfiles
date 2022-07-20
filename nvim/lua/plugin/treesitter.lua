local treesitter = require("nvim-treesitter")
local configs    = require("nvim-treesitter.configs")

--local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
--ft_to_parser.motoko = "typescript"

vim.o.foldmethod = "expr"
vim.o.foldexpr   = "treesitter#foldexpr()"

configs.setup({
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        -- use_languagetree = true,
        enable = true, -- false will disable the whole extension
        -- additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = false,
    },
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
        colors = {
            "Gold",
            "Orchid",
            "DodgerBlue",
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
        },
        disable = { "html" },
    },
    playground = {
        enable = true,
    },
})

require("treesitter-context").setup({
    enable = false,
    throttle = true, -- may improve performance
    max_lines = 0, -- How many lines the window should span. 0 => no limit.
})
