lsp.handlers.capabilities = vim.lsp.protocol.make_client_capabilities()

function lsp.handlers.setup()
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

    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
        border = "rounded",
    })

    lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function lsp.keymaps(bufnr)
    local buf_set_n_keymap = function(bufnr, lhs, rhs)
        local opts = { noremap = true, silent = true, }
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, '<Cmd>lua '.. rhs ..'<CR>', opts)
    end

    --buf_set_n_keymap(bufnr, "gc", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_set_n_keymap(bufnr, "gd", "lsp.buf.definition()")
    buf_set_n_keymap(bufnr, "gD", "lsp.buf.declaration()")
    buf_set_n_keymap(bufnr, "gi", "lsp.buf.implementation()")
    buf_set_n_keymap(bufnr, "gr", "lsp.buf.references()")
    buf_set_n_keymap(bufnr, "gR", "lsp.buf.rename(<CR>)")
    buf_set_n_keymap(bufnr, "gS", "lsp.buf.signature_help()")
    buf_set_n_keymap(bufnr, "K",  "lsp.buf.hover()")
    buf_set_n_keymap(bufnr, "gj", "lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "gl", "lsp.diagnostic.goto_next({ border = 'rounded' })")
    buf_set_n_keymap(bufnr, "go", "diagnostic.open_float({ border = 'rounded' })")

    vim.api.nvim_create_user_command("Format", "execute 'lua vim.lsp.buf.formatting()'", {})
end

lsp.handlers.capabilities = require("cmp_nvim_lsp")
                                .update_capabilities(lsp.handlers.capabilities)

lsp.handlers.setup()
