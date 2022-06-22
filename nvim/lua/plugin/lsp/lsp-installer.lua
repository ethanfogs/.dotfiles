local lsp_installer = require("nvim-lsp-installer") 

-- local import_status, lsp_installer = require('nvim-lsp-installer')
-- if not import_status then
--     return
-- end

-------------------------------------------------------------------------------

local servers = { "jsonls", "solc", "sumneko_lua", "tsserver", "pyright", "bashls" }
local settings = { ensure_installed = servers, }

lsp_installer.setup(settings)

-------------------------------------------------------------------------------

local import_status, lspconfig = pcall(require, "lspconfig")
if not import_status then
    return
end

-------------------------------------------------------------------------------

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("plugin.lsp.handlers").on_attach,
        capabilities = require("plugin.lsp.handlers").capabilities,
    }

    if server == "jsonls" then
        local jsonls_opts = require("plugin.lsp.settings.jsonls")
    end

    if server == "sumneko_lua" then
        local sumneko_opts = require("plugin.lsp.settings.sumneko_lua")
    end

    if server == "pyright" then
        local pyright_opts = require("plugin.lsp.settings.pyright")
    end

    lspconfig[server].setup(opts)
end

-------------------------------------------------------------------------------

local import_status, on_server_ready = pcall(lsp_installer.on_server_ready)
if not import_status then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('plugin.lsp.handlers').on_attach,
        capabilities = require('plugin.lsp.handlers').capabilities,
    }

    if (server.name == "jsonls") then
        local jsonls_opts = require("plugin.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_otps, otps)
    end

    if (server.name == "sumneko_lua") then
        local sumneko_opts = require("plugin.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)

end)
