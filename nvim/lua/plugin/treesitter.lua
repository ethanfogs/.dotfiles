local treesitter = require("nvim-treesitter")

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

treesitter.config = {
  auto_install = true,
  sync_install = false,
  ensure_installed = {
    "bash", "lua", "python", "sql", "go", "gomod", "gowork", "regex",
    "vim", "help",
    "javascript", "tsx", "typescript", "html", "css", "scss",
    "yaml", "toml", "json", "json5", "jsonc", "jsonnet", "jsdoc", "hjson",
    "markdown", "markdown_inline", "comment", "todotxt",
    "dockerfile", "gitattributes", "gitignore", "make", "cmake",
    "devicetree", "http",
  },
  ignore_install = { "phpdoc" },
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
  -- playground = { enable = true, },
}

require("nvim-treesitter.configs").setup(treesitter.config)

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr   = "nvim_treesitter#foldexpr()"
