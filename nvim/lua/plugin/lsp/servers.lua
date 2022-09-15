local lsp_servers = {}

lsp_servers.tsserver = {
  filetype = {
    "typescript", "typescriptcommon", "typescriptreact", "typescript.tsx",
    "javascript", "javascriptreact",
  },
}

lsp_servers.bashls = {
  filetype = {
    "bash", "sh", "zsh",
  },
}

lsp_servers.sumneko_lua = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")]     = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
          [vim.fn.stdpath("config") .. "/lua"]   = true,
          [vim.fn.getcwd()]                      = true,
        },
      },
      telemetry = { enable = false, },
    },
  },
}

lsp_servers.jsonls = {
  filetype = { "json", "jsonc" },
  settings = (pcall(require, "schemastore")) and require("schemastore").json.schemas() or {},
  init_options = {
    provideFormatter = false,
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$", 0) })
        end,
      },
    },
  },
}

return lsp_servers
