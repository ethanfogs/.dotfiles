local lsp_handlers = {}

lsp_handlers.capabilities = vim.lsp.protocol.make_client_capabilities()

lsp_handlers.setup = function()

    -- local icons = {} -- require('plugin.icons')
    local signs = {
        { name = "DiagnosticSignError", text = "❌" },
        { name = "DiagnosticSignWarn", text = "⚠"},
        { name = "DiagnosticSignHint", text = "💡" },
        { name = "DiagnosticSignInfo", text = "ℹ️" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = "",
        })
    end

    local config = {
        virtual_text = false,
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
    }

    vim.diagnostic.config(config)

    local handlers = vim.lsp.handlers
    handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function lsp_highlight_document(client)
    if client.resolved_capabilities.document_highlight then

        vim.api.nvim_create_augroup( "lsp_document_highlight", { clear = true })

        local au_opts = {}
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "lsp_document_highlight",
            buffer = 0,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = 0,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

function lsp_keymaps(bufnr)
    local buf_set_n_keymap = function(bufnr, lhs, rhs)
        local opts = { noremap = true, silent = true, }
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
    end

    buf_set_n_keymap(bufnr, "gc", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_set_n_keymap(bufnr, "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    buf_set_n_keymap(bufnr, "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    buf_set_n_keymap(bufnr, "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
    buf_set_n_keymap(bufnr, "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
    buf_set_n_keymap(bufnr, "gR", "<Cmd>lua vim.lsp.buf.rename(<CR>)")
    buf_set_n_keymap(bufnr, "gS", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
    buf_set_n_keymap(bufnr, "K",  "<Cmd>lua vim.lsp.buf.hover()<CR>")
    buf_set_n_keymap(bufnr, "gj", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")
    buf_set_n_keymap(bufnr, "gl", "<Cmd>lua vim.lsp.diagnostic.goto_next({ border = 'rounded' })<CR>")
    buf_set_n_keymap(bufnr, "go", "<Cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>")

    vim.api.nvim_create_user_command("Format", "execute 'lua vim.lsp.buf.formatting()'", {})
end

lsp_handlers.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

lsp_handlers.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return lsp_handlers
