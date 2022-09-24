local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- telescope.symbols = require("telescope")

telescope.config = {}

--- DEFAULT OPTS -------------------------------------------------------------

telescope.config.defaults = {
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

--- CUSTOM FUNCTIONS ---------------------------------------------------------

local custom_fn = {}
function custom_fn.find_files()
  local args = { follow = true, hidden = true, }
  if (string.match(vim.fn.getcwd(), "nvim$") ~= nil) then
    args["search_dirs"] = { ".", "../vim" }
  end
  builtin.find_files(args)
end

function custom_fn.colorscheme()
  builtin.colorscheme({ enable_preview = true })
end

--- MAPPINGS (keymaps used when inside a telescope prompt) -------------------

telescope.config.mappings = {
  n = {
    ["q"]       = "close",
    ["ZZ"]      = "close",
    ["<Esc>"]   = "close",
    ["<C-c>"]   = "close",
    ["<C-k>"]   = "preview_scrolling_up",
    ["<C-j>"]   = "preview_scrolling_down",
    ["<Tab>"]   = "toggle_selection",
    ["<C-]>"]   = "close",
    ["<C-\\>"]  = "close",
    ["<Space>"] = "toggle_selection",
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

--- KEYMAPS (keymaps used to invoke a telescope prompt) ----------------------

telescope.config.keymaps = {
  a = builtin.autocommands,
  b = builtin.buffers,
  B = builtin.builtin,
  c = custom_fn.colorscheme,
  d = builtin.lsp_definitions,
  D = builtin.lsp_document_symbols,
  f = custom_fn.find_files,
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
  ["/"] = builtin.current_buffer_fuzzy_find,
  ["?"] = builtin.builtin,
  ["'"] = builtin.registers,
  ["<Space>"] = builtin.resume,
}

--- EXTENSIONS ---------------------------------------------------------------

telescope.config.extensions = {
  "file_browser",
}

for _, extension in pairs(telescope.config.extensions) do
  if (pcall(require, "plugin.telescope." .. extension)) then
    for k, v in pairs(require("plugin.telescope." .. extension)) do
      telescope.config[k] = vim.tbl_deep_extend("force", telescope.config[k], v)
    end
  else
    print("[" .. vim.fn.expand('<sfile>') .. "] " .. "failed to load " .. extension)
  end
end

--- SETUP --------------------------------------------------------------------

local leader_key = "s"
for lhs, rhs in pairs(telescope.config.keymaps) do
  vim.keymap.set("n", leader_key .. lhs, rhs, { noremap = true })
end

telescope.config.defaults.mappings = telescope.config.mappings
telescope.setup(telescope.config)
