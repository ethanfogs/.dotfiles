local import_status, schemastore = pcall(require, "schemastore")
if not import_status then
    return nil
end

return {
    init_options = {
        provideFormatter = false,
    },
    settings = {
        json = {
          schemas = schemastore.json.schemas(),
        },
    },
    setup = {
        commands = {
          -- Format = {
          --   function()
          --     vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
          --   end,
          -- },
        },
    },
}
