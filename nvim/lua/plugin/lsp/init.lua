local import_status, lsp = pcall(vim.deepcopy, vim.lsp)

------------------------------------------------------------------------------

lsp.configs = {
  "installer",
  "handlers",
  "signs",
  "servers",
  "signature",
}

for _, config in pairs(lsp.configs) do
  import_status, lsp[config] = pcall(require, "plugin.lsp." .. config)
  if (not import_status) then
    print("{plugin.lsp.init} [import failed ] plugin.lsp." .. config)
  end
end

------------------------------------------------------------------------------

lsp.mappings = {
  ['n'] = {
    K = lsp.buf.hover,
    gC = lsp.buf.code_action,
    gD = lsp.buf.declaration,
    gl = function() vim.diagnostic.goto_next({ border = 'rounded' }) end,
    gj = function() vim.diagnostic.show_line_diagnostics({ border = 'rounded' }) end,
    go = function() vim.diagnostic.open_float({ border = 'rounded' }) end,
    gR = lsp.buf.rename,
    gS = lsp.buf.signature_help,
    gd = lsp.buf.definition,
    gi = lsp.buf.implementation,
    gr = lsp.buf.references,
  },
}

------------------------------------------------------------------------------

lsp.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  for mode, mappings in pairs(lsp.mappings) do
    for lhs, rhs in pairs(mappings) do
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

------------------------------------------------------------------------------

for _, ls in pairs(lsp.installer.get_installed_servers()) do
  local config = lsp.servers[ls.name] or {}
  config.on_attach = lsp.on_attach
  config.capabilities = lsp.handlers.capabilities

  require("lspconfig")[ls.name].setup(config)
end
