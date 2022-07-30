require('plugin.lsp.lsp-signature')
require("nvim-lsp-installer").setup()

local lsp = {
    config = require("lspconfig"),
    handlers  = { capabilities = vim.lsp.protocol.make_client_capabilities() },
}

function lsp.handlers.on_attach(client, bufnr)
    local buf_set_n_keymap = function(bufnr, lhs, rhs)
        local opts = { noremap = true, silent = true, }
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
    end

    buf_set_n_keymap(bufnr, "gC", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_set_n_keymap(bufnr, "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
    buf_set_n_keymap(bufnr, "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    buf_set_n_keymap(bufnr, "gR", "<Cmd>lua vim.lsp.buf.rename(<CR>)<CR>")
    buf_set_n_keymap(bufnr, "gS", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
    buf_set_n_keymap(bufnr, "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    buf_set_n_keymap(bufnr, "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
    buf_set_n_keymap(bufnr, "gj", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")
    buf_set_n_keymap(bufnr, "gl", "<Cmd>lua vim.lsp.diagnostic.goto_next({ border = 'rounded' })<CR>")
    buf_set_n_keymap(bufnr, "go", "<Cmd>lua diagnostic.open_float({ border = 'rounded' })<CR>")
    buf_set_n_keymap(bufnr, "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
    vim.api.nvim_create_user_command("Format", "execute 'lua vim.lsp.buf.formatting()'", {})
end

lsp.signs = {
    { name = "DiagnosticSignError", text = "❌" },
    { name = "DiagnosticSignWarn", text = "⚠" },
    { name = "DiagnosticSignHint", text = "💡" },
    { name = "DiagnosticSignInfo", text = "ℹ️" },
}

for _, sign in pairs(lsp.signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = "",
    })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = { active = vim.lsp.signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

lsp.handlers.capabilities = require("cmp_nvim_lsp")
                                .update_capabilities(lsp.handlers.capabilities)

lsp.servers = {
    'bashls', 'cssls', 'emmet_ls', 'eslint', 'golangci_lint_ls', 'gopls', 'html',
    'jsonls', 'jsonnet_ls', 'marksman', 'pylsp', 'pyright', 'quick_lint_js',
    'rust_analyzer', 'sqlls', 'sumneko_lua', 'tsserver', 'vimls'
}

for _, ls in pairs(lsp.servers) do
    local import_status, opts = pcall(require, "plugin.lsp.settings." .. ls)
    if (not import_status) then opts = {} end

    opts.on_attach    = lsp.handlers.on_attach
    opts.capabilities = lsp.handlers.capabilities
    lsp.config[ls].setup(opts)
end
