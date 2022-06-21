local lsp_handlers = {}

lsp_handlers.capabilities = vim.lsp.protocol.make_client_capabilities()

lsp_handlers.setup = function()

    -- local icons = {} -- require('plugin.icons')
    local signs = {
        { name = "DiagnosticSignError", text = "💥" },
        { name = "DiagnosticSignWarn", text = "⚠️"},
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

    local function lsp_highlight_document(client)
        if client.resolved_capabilities.document_highlight then

            local create_augroup = vim.api.nvim_create_augroup
            local create_autocmd = function(event, luafunc)
                local create_autocmd = vim.api.nvim_create_autocmd
                local au_opts = { group = "lsp_document_highlight", buffer = 0, }

                create_autocmd(event, { au_opts, callback = vim.lsp.buf[luafunc] })
            end

            create_augroup( "lsp_document_highlight", { clear = true })
                create_autocmd("CursorHold", "document_highlight")
                create_autocmd("CursorMoved", "clear_references")
        end
    end
    
    local function lsp_keymaps(bufnr)
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true, }
        local buf_set_n_keymap = function(bufnr, lhs, rhs)
            buf_set_keymap(bufnr, "n", lhs, rhs, opts)
        end

        local fmt_rhs = function(fn) return "<Cmd>lua vim." .. fn .. "<CR>" end
        local _rnd = function(fn) return fn .. "({ border = 'rounded', })" end
        local fmt_rhs = {
            fmt_rhs, _rnd,
            lbuf  = function(fn) return fmt._cmd("lsp.buf." .. fn .. "()") end,
            diag  = function(fn) return fmt_rhs(_rnd("diagnostic." .. fn)) end,
            ldiag = function(fn) return fmt_rhs(_rnd("lsp.diagnostic." .. fn)) end,
        }

        buf_set_n_keymap(bufnr, "gc", fmt_rhs.lbuf("code_action"))
        buf_set_n_keymap(bufnr, "gd", fmt_rhs.lbuf("definition"))
        buf_set_n_keymap(bufnr, "gD", fmt_rhs.lbuf("declaration"))
        buf_set_n_keymap(bufnr, "gi", fmt_rhs.lbuf("implementation"))
        buf_set_n_keymap(bufnr, "gr", fmt_rhs.lbuf("references"))
        buf_set_n_keymap(bufnr, "gR", fmt_rhs.lbuf("rename"))
        buf_set_n_keymap(bufnr, "gS", fmt_rhs.lbuf("signature_help"))
        buf_set_n_keymap(bufnr, "K",  fmt_rhs.lbuf('hover'))
        buf_set_n_keymap(bufnr, "gj", fmt_rhs.ldiag("show_line_diagnostics"))
        buf_set_n_keymap(bufnr, "gl", fmt_rhs.ldiag("goto_next"))
        buf_set_n_keymap(bufnr, "go", fmt_rhs.diag("open_float"))

        local create_user_cmd = vim.api.nvim_create_user_command
        create_user_cmd("Format", "execute 'lua vim.lsp.buf.formatting()'")
    end
end

lsp_handlers.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

lsp_handlers.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return lsp_handlers

-- vim: filetype=lua:foldmethod=indent:
