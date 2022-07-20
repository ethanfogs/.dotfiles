vim.lsp.handlers.capabilities = vim.lsp.protocol.make_client_capabilities()

function vim.lsp.handlers.setup()
    local signs = {
        { name = "DiagnosticSignError", text = "❌" },
        { name = "DiagnosticSignWarn", text = "⚠"},
        { name = "DiagnosticSignHint", text = "💡" },
        { name = "DiagnosticSignInfo", text = "ℹ️" },
    }

    for _, sign in pairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = "",
        })
    end

    vim.diagnostic.config({
        --virtual_text = false,
        signs = { active = signs },
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
end

function vim.lsp.handlers.on_attach(client, bufnr)
    local buf_set_n_keymap = function(bufnr, lhs, rhs)
        local opts = { noremap = true, silent = true, }
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, '<Cmd>lua '.. rhs ..'<CR>', opts)
    end

    --buf_set_n_keymap(bufnr, "gc", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_set_n_keymap(bufnr, "gd", "vim.lsp.buf.definition()")
    buf_set_n_keymap(bufnr, "gD", "vim.lsp.buf.declaration()")
    buf_set_n_keymap(bufnr, "gi", "vim.lsp.buf.implementation()")
    buf_set_n_keymap(bufnr, "gr", "vim.lsp.buf.references()")
    buf_set_n_keymap(bufnr, "gR", "vim.lsp.buf.rename(<CR>)")
    buf_set_n_keymap(bufnr, "gS", "vim.lsp.buf.signature_help()")
    buf_set_n_keymap(bufnr, "K",  "vim.lsp.buf.hover()")
    buf_set_n_keymap(bufnr, "gj", "vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "gl", "vim.lsp.diagnostic.goto_next({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "go", "diagnostic.open_float({ border = 'rounded' })")

    vim.api.nvim_create_user_command("Format", "execute 'lua vim.lsp.buf.formatting()'", {})
end

vim.lsp.handlers.capabilities = require("cmp_nvim_lsp")
                                .update_capabilities(vim.lsp.handlers.capabilities)

vim.lsp.handlers.setup()
