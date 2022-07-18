lsp = vim.lsp

-------------------------------------------------------------------------------

lsp.signature = require('plugin.lsp.lsp-signature')

-------------------------------------------------------------------------------

require("nvim-lsp-installer").setup()

local servers = { "jsonls", "sumneko_lua", "tsserver", "bashls", "vimls", "quick_lint_js" }

for _, server in pairs(servers) do
    local opts = {
        on_attach    = lsp.handlers.on_attach,
        capabilities = lsp.handlers.capabilities,
    }

    require('lspconfig')[server].setup(opts)
end

-------------------------------------------------------------------------------

require('plugin.lsp.handlers')
