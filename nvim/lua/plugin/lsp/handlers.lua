local lsp_handlers = {
  capabilities = vim.lsp.protocol.make_client_capabilities()
}

lsp_handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

lsp_handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

lsp_handlers.capabilities = require("cmp_nvim_lsp")
    .update_capabilities(lsp_handlers.capabilities)

return lsp_handlers
