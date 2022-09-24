local lsp        = require("vim.lsp.buf")
local diagnostic = require("vim.diagnostic")

lsp.configs = {
  "installer",
  "handlers",
  "signs",
  "servers",
  "signature",
}

for _, config in pairs(lsp.configs) do
  lsp[config] = require("plugin.lsp." .. config)
end

------------------------------------------------------------------------------

lsp.mappings = {
  ['n'] = {
    K  = lsp.hover,
    gC = lsp.code_action,
    gd = lsp.definition,
    gD = lsp.declaration,
    gh = diagnostic.goto_prev,
    gi = lsp.implementation,
    gl = diagnostic.goto_next,
    go = diagnostic.open_float,
    gr = lsp.references,
    gR = lsp.rename,
    gS = lsp.signature_help,
  },
}

------------------------------------------------------------------------------

lsp.on_attach = function(client)
  local opts = { buffer = 0, noremap = true }
  for mode, mappings in pairs(lsp.mappings) do
    for lhs, rhs in pairs(mappings) do vim.keymap.set(mode, lhs, rhs, opts) end
  end
end

------------------------------------------------------------------------------

for _, ls in pairs(lsp.installer.get_installed_servers()) do
  local opts = lsp.servers[ls.name] or {}
  opts.on_attach = lsp.on_attach
  opts.capabilities = lsp.handlers.capabilities
  require("lspconfig")[ls.name].setup(opts)
end

------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("FormatOnWrite", { clear = true }),
  pattern = "*",
  callback = vim.lsp.buf.formatting_sync
})
