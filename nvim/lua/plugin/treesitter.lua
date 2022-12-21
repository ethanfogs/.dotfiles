local M = {}

M.config = {
  auto_install = true,
  sync_install = false,
  ensure_installed = {
    "bash",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "regex",
    "sql",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  -- additional_vim_regex_highlighting = true,
  highlight = {
    use_languagetree = true,
    enable = true,
  },
  autopairs = { enable = true, },
  indent = { enable = true, },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
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
}

-- M.ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- M.ft_to_parser.motoko = "typescript"

require("nvim-treesitter.configs").setup(M.config)

vim.o.foldmethod = "expr"
vim.o.foldexpr   = "nvim_treesitter#foldexpr()"
