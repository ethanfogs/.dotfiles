local lsp_signs = {}
local icons = require("plugin.icons")

lsp_signs = {
  DiagnosticSignError = icons.diagnostics.Error,
  DiagnosticSignWarn = icons.diagnostics.Warning,
  DiagnosticSignHint = icons.diagnostics.Hint,
  DiagnosticSignInfo = icons.diagnostics.Information,
}

for name, sign in pairs(lsp_signs) do
  vim.fn.sign_define(name, {
    texthl = name,
    text = sign,
    numhl = "",
  })
end

local vim_diagnostic_config = {
  virtual_text = false,
  signs = { active = lsp_signs },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
}

vim.diagnostic.config(vim_diagnostic_config)

return lsp_signs
