local lsp = {
    config    = require("lspconfig"),
    signature = require("lsp_signature"),
    handlers  = { capabilities = vim.lsp.protocol.make_client_capabilities() },
    installer = require("nvim-lsp-installer")
}

lsp.installer.setup()

lsp.signature.config = {
    debug = false,
    log_path = "debug_log_file_path",
    verbose = false,
    bind = true,
    doc_lines = 0,
    floating_window = false,
    floating_window_above_cur_line = false,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = icons.misc.Squirrel .. " ",
    hint_scheme = "Comment",
    use_lspsaga = false,
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 120,
    handler_opts = { border = "rounded", }, -- double, rounded, single, shadow, none
    always_trigger = false,
    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,
    padding = "",
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = "Black",
    timer_interval = 200,
    toggle_key = nil,
}

lsp.signature.setup(lsp.signature.config)
lsp.signature.on_attach(lsp.signature.config)

function lsp.handlers.on_attach(client, bufnr)
    local buf_set_n_keymap = function(bufnr, lhs, rhs)
        local opts = { noremap = true, silent = true, }
        local rhs = "<Cmd>lua vim." .. rhs .. "<CR>"
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
    end

    buf_set_n_keymap(bufnr, "gC", "lsp.buf.code_action()")
    buf_set_n_keymap(bufnr, "K", "lsp.buf.hover()")
    buf_set_n_keymap(bufnr, "gD", "lsp.buf.declaration()")
    buf_set_n_keymap(bufnr, "gR", "lsp.buf.rename()")
    buf_set_n_keymap(bufnr, "gS", "lsp.buf.signature_help()")
    buf_set_n_keymap(bufnr, "gd", "lsp.buf.definition()")
    buf_set_n_keymap(bufnr, "gi", "lsp.buf.implementation()")
    buf_set_n_keymap(bufnr, "gj", "lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "gl", "lsp.diagnostic.goto_next({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "go", "diagnostic.open_float({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "gr", "lsp.buf.references()")
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

for _, language_server in pairs(lsp.servers) do
    if (not lsp.installer.get_server(language_server)) then
        lsp.installer.install(language_server)
    end
end

for _, ls in pairs(lsp.servers) do
    local import_status, opts = pcall(require, "plugin.lsp.settings." .. ls)
    if (not import_status) then opts = {} end

    opts.on_attach    = lsp.handlers.on_attach
    opts.capabilities = lsp.handlers.capabilities
    lsp.config[ls].setup(opts)
end
