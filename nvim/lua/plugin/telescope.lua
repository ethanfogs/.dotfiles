local telescope = require("telescope")
-- telescope.symbols = require("telescope")

------------------------------------------------------------------------------

local defaults = {
  entry_prefix = "", selection_caret = "",
  -- path_display = { "smart" },
  path_display = {},
  sorting_strategy = "ascending",
  file_ignore_patterns = { "node_modules/", ".git/", ".cache/" },
  winblend = 7,
  dynamic_preview_title = true,
  layout_strategy = 'horizontal',
  layout_config = {
    height = 0.95, width = 0.95, preview_width = 0.60,
    scroll_speed = 10
  },
}

local mappings = {
  n = {
    ["u"]      = "preview_scrolling_up",
    ["d"]      = "preview_scrolling_down",
    ["q"]      = "close",
    ["ZZ"]     = "close",
    ["<Esc>"]  = "close",
    ["<C-c>"]  = "close",
    ["<Tab>"]  = "toggle_selection",
    ["<C-]>"]  = "close",
    ["<C-\\>"] = "close",
  },
  i = {
    ["<C-a>"] = "toggle_all",
    ["<C-k>"] = "move_selection_previous",
    ["<C-j>"] = "move_selection_next",
    ["<Esc>"] = "close",
    ["<C-c>"] = "close",
    ["<C-]>"] = "close",
    ["jj"]    = { "<Esc>", type = "command" },
  }
}

local builtin = require("telescope.builtin")
local keymaps = {
  a = builtin.autocommands,
  b = builtin.buffers,
  B = builtin.builtin,
  c = function() builtin.colorscheme({ enable_preview = true }) end,
  d = builtin.lsp_definitions,
  D = builtin.lsp_document_symbols,
  F = builtin.git_files,
  h = builtin.help_tags,
  g = builtin.git_status,
  i = builtin.lsp_implementations,
  k = builtin.keymaps,
  l = builtin.live_grep,
  m = builtin.man_pages,
  o = builtin.oldfiles,
  q = builtin.quickfix,
  r = builtin.lsp_references,
  s = builtin.git_stash,
  S = builtin.spell_suggest,
  t = builtin.treesitter,
  w = builtin.lsp_dynamic_workspace_symbols,
  ["/"] = builtin.grep_string,
  ["?"] = builtin.builtin,
  ["'"] = builtin.registers,
  ["<Space>"] = builtin.resume,
}

keymaps.f = function()
  local args = { follow = true, hidden = true, }
  if (string.match(vim.fn.getcwd(), "nvim$") ~= nil) then
    args["search_dirs"] = { ".", "../vim" }
  end
  builtin.find_files(args)
end

if (pcall(telescope.load_extension, "file_browser")) then

  local file_browser = telescope.extensions.file_browser

  keymaps.e = function()
    local args = { hidden = true, follow = true }
    file_browser.file_browser(args)
  end

  file_browser.mappings = {
    n = {
      C = file_browser.actions.change_cwd,
      D = file_browser.actions.remove,
      M = file_browser.actions.move,
      n = file_browser.actions.create,
      R = file_browser.actions.rename,
      S = file_browser.actions.create,
      ["~"] = file_browser.actions.goto_home_dir,
      ["."] = file_browser.actions.toggle_hidden,
    },
    i = {
      ["<C-a>"] = file_browser.actions.toggle_hidden,
      ["<C-d>"] = file_browser.actions.remove,
      ["<C-h>"] = file_browser.actions.goto_home_dir,
      ["<C-m>"] = file_browser.actions.move,
      ["<C-r>"] = file_browser.actions.rename,
      ["<C-y>"] = file_browser.actions.copy,
    }
  }

  for mode, _mappings in pairs(file_browser.mappings) do
    mappings[mode] = vim.tbl_extend("keep", mappings[mode], _mappings)
  end
end

------------------------------------------------------------------------------

telescope.keymap = {
  opts = { noremap = true },
  leader_key = "s",
}

function telescope.keymap:set(lhs, rhs)
  vim.keymap.set("n", self.leader_key .. lhs, rhs, self.opts)
end

for lhs, rhs in pairs(keymaps) do telescope.keymap:set(lhs, rhs) end

------------------------------------------------------------------------------

defaults.mappings = mappings
telescope.config = {
  defaults = defaults,
}

telescope.setup(telescope.config)
--]]
--]]
