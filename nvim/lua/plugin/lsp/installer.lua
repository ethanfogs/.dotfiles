local lsp_installer = require("nvim-lsp-installer")

lsp_installer.config = {
  automatic_installation = true,
  ensure_installed = {
    'bashls',
    'cssls',
    'gopls',
    'html',
    'jsonls',
    'jsonnet_ls',
    'marksman',
    'pylsp',
    'pyright',
    'sqlls',
    'sumneko_lua',
    'tsserver',
    'vimls',
  },
}

lsp_installer.setup(lsp_installer.config)

return lsp_installer
