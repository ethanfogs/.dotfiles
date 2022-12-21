if not pcall(require, "lsp-zero") then return end

local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.set_preferences({
  set_lsp_keymaps = false,
})

local cmp = require("cmp")
cmp.select  = { behavior = cmp.SelectBehavior.Select, select = true, }

local mapping = setmetatable({}, { __index = cmp.mapping })
mapping.select_prev_item = function() cmp.select_prev_item(cmp.select) end
mapping.select_next_item = function() cmp.select_next_item(cmp.select) end

local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ["<C-h>"]   = cmp.mapping(mapping.complete(), { "i", "c", }),
  ["<CR>"]    = mapping.confirm({ select = true, }),

  ["<C-p>"]   = mapping.select_prev_item,
  ["<C-n>"]   = mapping.select_next_item,

  ["<C-k>"]   = mapping.select_prev_item,
  ["<C-j>"]   = mapping.select_next_item,

  ["<Up>"]    = mapping.select_prev_item,
  ["<Down>"]  = mapping.select_next_item,

  ["<Left>"]  = mapping.select_prev_item,
  ["<Right>"] = mapping.select_next_item,

  ["<S-Tab>"] = mapping.select_prev_item,
  ["<Tab>"]   = mapping.select_next_item,
})

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp_zero.nvim_workspace('', true)

lsp_zero.on_attach(function(client, bufnr)

  local mapping = {
    n = {
      K  = vim.lsp.buf.hover,
      gd = vim.lsp.buf.definition,
      gD = vim.lsp.buf.declaration,
      gi = vim.lsp.buf.implementation,
      gr = vim.lsp.buf.references,
      gR = vim.lsp.buf.rename,
      gS = vim.lsp.buf.signature_help,
      gh = vim.diagnostic.goto_prev,
      gl = vim.diagnostic.goto_next,
      go = vim.diagnostic.open_float,
    },
  }

  for mode, mappings in pairs(mapping) do
    for lhs, rhs in pairs(mappings) do
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, })
    end
  end

end)

lsp_zero.setup()
