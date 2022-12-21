require("lspconfig")

local icons      = require("plugin.icons")
local lsp        = require("vim.lsp")
local diagnostic = require("vim.diagnostic")

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

vim.api.nvim_create_augroup("lsp_format_on_write", { clear = true })

local on_attach = function(client, bufnr)

  local opts = { buffer = bufnr, noremap = true }
  for mode, mappings in pairs(mappings) do
    for lhs, rhs in pairs(mappings) do vim.keymap.set(mode, lhs, rhs, opts) end
  end

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = "lsp_format_on_write",
    buffer = bufnr,
    callback = vim.lsp.buf.format
  })

end

------------------------------------------------------------------------------

local signs = {
  DiagnosticSignError = icons.diagnostics.Error,
  DiagnosticSignWarn = icons.diagnostics.Warning,
  DiagnosticSignHint = icons.diagnostics.Hint,
  DiagnosticSignInfo = icons.diagnostics.Information,
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, { texthl = name, text = sign, numhl = "", })
end

vim.diagnostic.config({
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
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- handlers["textDocument/hover"] = lsp.with(handlers.hover, { border = "rounded" })
-- handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, { border = "rounded" })

-- handlers.capabilities = require("cmp_nvim_lsp").default_capabilities()

------------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = true, })

local servers = {}

servers.tsserver = {
  filetype = {
    "javascript", "javascriptreact",
    "typescript", "typescriptcommon", "typescriptreact", "typescript.tsx",
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
