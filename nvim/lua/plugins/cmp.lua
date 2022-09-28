local cmp = require("cmp")

------------------------------------------------------------------------------

local luasnip = require('luasnip')
require('luasnip/loaders/from_vscode').lazy_load()

local icons = require("plugins.icons")

------------------------------------------------------------------------------

local config = {}

------------------------------------------------------------------------------

config.snippet = {
  expand = function(args) luasnip.lsp_expand(args.body) end,
}

------------------------------------------------------------------------------

config.layout = {
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}

------------------------------------------------------------------------------

local mapping = setmetatable({}, { __index = require("cmp").mapping })

function mapping.select_prev_item(fallback)
  if (cmp.visible()) then
    cmp.select_prev_item()
  elseif (luasnip.jumpable(-1)) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

function mapping.select_next_item(fallback)
  if (cmp.visible()) then
    cmp.select_next_item()
  elseif (luasnip.expandable()) then
    luasnip.expand()
  elseif (luasnip.expand_or_jumpable()) then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end

config.mapping = {
  ["<C-K>"]   = cmp.mapping.select_prev_item(),
  ["<C-p>"]   = cmp.mapping.select_prev_item(),
  ["<C-j>"]   = cmp.mapping.select_next_item(),
  ["<C-n>"]   = cmp.mapping.select_next_item(),
  ["<Tab>"]   = mapping.select_next_item,
  ["<Down>"]  = mapping.select_next_item,
  ["<S-Tab>"] = mapping.select_prev_item,
  ["<Up>"]    = mapping.select_prev_item,
  ["<C-h>"]   = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<CR>"]    = cmp.mapping.confirm({ select = true }),
}
config.formatting = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, vim_item)
    vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
    vim_item.menu = ({
      nvim_lsp = "[LSP]",
      path     = "[Path]",
      luasnip  = "[Snippet]",
      buffer   = "[Buffer]",
    })[entry.source.name]
    return vim_item
  end
}

config.sources = {
  -- ORDER DETERMINES PREFERED PRECEDENCE
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "path" },
}

config.confirm_opts = {
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
}

------------------------------------------------------------------------------

local extensions = {}

------------------------------------------------------------------------------

-- extensions.dap = require("cmp_dap")

-- function extensions.dap.enabled()
--   return (vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt") or extensions.dap.is_dap_buffer()
-- end

-- config.setup = {}
-- config.setup.filetype = { "dap-repl", "dapui_watches", "dapui_hover" }

------------------------------------------------------------------------------

cmp.setup(config)
