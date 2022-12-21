local null_ls = require("null-ls")

local completion  = null_ls.builtins.completion
local formatting  = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local config = {
  -- diagnostics.eslint,
  -- diagnostics.shellcheck,
  formatting.stylua,
  completion.spell,
  formatting.stylua,
  -- formatting.black.with({ extra_args = { "--fast", } }),
  -- sources = {
  --   formatting.prettier.with({
  --     extra_filetypes = { "toml" },
  --     extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  --   }),
  -- },
}

null_ls.setup(config)
