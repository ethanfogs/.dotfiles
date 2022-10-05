require("lspconfig")

local icons      = require("plugins.icons")
local lsp        = require("vim.lsp")
local diagnostic = require("vim.diagnostic")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

------------------------------------------------------------------------------

local mappings = {
  n = {
    K  = lsp.buf.hover,
    gC = lsp.buf.code_action,
    gd = lsp.buf.definition,
    gD = lsp.buf.declaration,
    gh = diagnostic.goto_prev,
    gi = lsp.buf.implementation,
    gl = diagnostic.goto_next,
    go = diagnostic.open_float,
    gr = lsp.buf.references,
    gR = lsp.buf.rename,
    gS = lsp.buf.signature_help,
  },
}

------------------------------------------------------------------------------

local fn = {}

augroup("lsp_document_hl", { clear = true })

function fn.highlight_document(client)
  if (client.resolved_capabilities.document_highlight) then
    local function au_lsp_hl_document(event, callback)
      autocmd(event, { group = "lsp_document_hl", buffer = 0, callback = callback })
    end

    au_lsp_hl_document("CursorHold", lsp.buf.document_highlight)
    au_lsp_hl_document("CursorMoved", lsp.buf.clear_references)
  end
end

------------------------------------------------------------------------------

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true }
  for mode, mappings in pairs(mappings) do
    for lhs, rhs in pairs(mappings) do vim.keymap.set(mode, lhs, rhs, opts) end
  end
  -- fn.highlight_document(client)
end

------------------------------------------------------------------------------

local signs = {
  DiagnosticSignError = icons.diagnostics.Error,
  DiagnosticSignWarn = icons.diagnostics.Warning,
  DiagnosticSignHint = icons.diagnostics.Hint,
  DiagnosticSignInfo = icons.diagnostics.Information,
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, {
    texthl = name,
    text = sign,
    numhl = "",
  })
end

diagnostic.config({
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
})

------------------------------------------------------------------------------

local handlers = {
  capabilities = lsp.protocol.make_client_capabilities(),
}

handlers["textDocument/hover"] = lsp.with(handlers.hover, { border = "rounded" })
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, { border = "rounded" })

handlers.capabilities = require("cmp_nvim_lsp")
    .default_capabilities(handlers.capabilities)

------------------------------------------------------------------------------

local installer = require("mason")
installer.setup()

vim.api.nvim_create_user_command("LspInstallInfo", "Mason", {})

installer.config = {
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "cssls",
    "gopls",
    "html",
    "jsonls",
    "jsonnet_ls",
    "marksman",
    "pylsp",
    "pyright",
    "sqlls",
    "sumneko_lua",
    "tsserver",
    "vimls",
  }
}

require("mason-lspconfig").setup(installer.config)

------------------------------------------------------------------------------

local servers = {}

servers.tsserver = {
  filetype = {
    "typescript", "typescriptcommon", "typescriptreact", "typescript.tsx",
    "javascript", "javascriptreact",
  },
}

servers.bashls = {
  filetype = { "bash", "sh", "zsh", },
}

servers.sumneko_lua = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.getcwd()]                  = true,
        },
      },
      telemetry = { enable = false, },
    },
  },
}

servers.jsonls = {
  filetype = { "json", "jsonc" },
  settings = (pcall(require, "schemastore")) and require("schemastore").json.schemas() or {},
  init_options = { provideFormatter = false, },
  setup = {
    commands = {
      Format = {
        function()
          lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$", 0) })
        end,
      },
    },
  },
}

------------------------------------------------------------------------------

for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
  require("lspconfig")[server]
      .setup(vim.tbl_deep_extend("keep", servers[server] or {}, {
        on_attach    = on_attach,
        capabilities = handlers.capabilities,
      }))
end

------------------------------------------------------------------------------

require("lsp_signature").setup({
  debug = false,
  log_path = "debug_log_file_path",
  verbose = false,
  bind = true,
  doc_lines = 0,
  floating_window = false,
  floating_window_above_cur_line = false,
  fix_pos = false,
  hint_enable = true,
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
  hint_prefix = icons.diagnostics.Hint,
})

------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("format_on_write", { clear = true }),
  pattern = "*",
  callback = lsp.buf.formatting_sync
})
