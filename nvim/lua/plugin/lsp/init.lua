local lspconfig = require("lspconfig")

--vim.lsp.signature = require('plugin.lsp.lsp-signature')

vim.lsp.installer = require("nvim-lsp-installer")
vim.lsp.installer.setup()

require('plugin.lsp.handlers')

for _, server in pairs(vim.lsp.installer.get_installed_servers()) do
    local import_status, opts = pcall(require, "plugin.lsp.settings." .. server.name)
    if(not import_status) then opts = {} end
    opts.on_attach    = vim.lsp.handlers.on_attach
    opts.capabilities = vim.lsp.handlers.capabilities
    lspconfig[server.name].setup(opts)
end
