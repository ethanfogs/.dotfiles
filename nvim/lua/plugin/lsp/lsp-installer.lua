local import_status, lsp_installer = require('nvim-lsp-installer')
if not import_status then
    return
end

-------------------------------------------------------------------------------

if lsp_installer == nil then
    return
end

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
