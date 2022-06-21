local import_status, _ = pcall(require, 'lspconfig')
if not import_status then
    return
end

-------------------------------------------------------------------------------

pcall(require, 'plugin.lsp.lsp-installer')

local import_status, handlers = pcall(require, 'plugin.lsp.handlers')
if import_status then
    pcall(setup, handlers)
end
