if (not pcall(require, "telescope")) then return end

local telescope = require("telescope")

--- DEFAULT OPTS -------------------------------------------------------------

local config = {}

config.defaults = {
  entry_prefix = "",
  selection_caret = "",
  sorting_strategy = "ascending",
  winblend = 7,
  -- dynamic_preview_title = true,
  -- layout_config = {
  --   horizontal = {
  --     height = 0.95,
  --     width = 0.95,
  --     scroll_speed = 10,
  --     preview_width = 0.60,
  --   },
  -- },
  -- preview = {
  --   check_mime_type = true,
  -- },
}

--- MAPPINGS (keymaps used when inside a telescope prompt) -------------------

local actions = setmetatable({}, { __index = require("telescope.actions") })

config.defaults.mappings = {
  n = {
    q           = actions.close,
    ZZ          = actions.close,
    ["<Esc>"]   = actions.close,
    ["<C-c>"]   = actions.close,
    ["<C-k>"]   = actions.preview_scrolling_up,
    ["<C-j>"]   = actions.preview_scrolling_down,
    ["<Tab>"]   = actions.toggle_selection,
    ["<C-]>"]   = actions.close,
    ["<C-\\>"]  = actions.close,
    ["<Space>"] = actions.toggle_selection,
  },
  i = {
    ["<C-a>"] = actions.toggle_all,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-j>"] = actions.move_selection_next,
    ["<Esc>"] = actions.close,
    ["<C-c>"] = actions.close,
    ["<C-]>"] = actions.close,
    jj        = { "<Esc>", type = "command" },
  },
}

--- KEYMAPS (keymaps used to invoke a telescope prompt) ----------------------

local builtin = setmetatable({}, { __index = require("telescope.builtin") })

function builtin.find_files()
  require("telescope.builtin").find_files({ follow = true })
end

function builtin.colorsheme()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end

local keymaps = {
  a = builtin.autocommands,
  b = builtin.buffers,
  B = builtin.builtin,
  c = builtin.colorsheme,
  d = builtin.lsp_definitions,
  D = builtin.lsp_document_symbols,
  f = builtin.find_files,
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

local extensions = require("telescope").extensions

if (telescope.extensions.file_browser ~= nil) then
  local file_browser = extensions.file_browser.actions
  keymaps.e = extensions.file_browser.file_browser
end

if (pcall(telescope.load_extension, "packer")) then
  keymaps.p = telescope.extensions.packer.packer
end

------------------------------------------------------------------------------

local leader_key = "s"
for lhs, rhs in pairs(keymaps) do
  vim.keymap.set("n", leader_key .. lhs, rhs, { noremap = true, silent = true, })
end


require("telescope").setup(config)
