local telescope   = setmetatable({}, { __index = require("telescope") })
telescope.actions = setmetatable({}, { __index = require("telescope.actions") })
telescope.builtin = setmetatable({}, { __index = require("telescope.builtin") })
telescope.themes  = setmetatable({}, { __index = require("telescope.themes") })

local config = {}

--- DEFAULT OPTS -------------------------------------------------------------

config.defaults = {
  entry_prefix = "",
  selection_caret = "",
  path_display = {},
  sorting_strategy = "ascending",
  winblend = 7,
  dynamic_preview_title = true,
  layout_strategy = "horizontal",
  layout_config = {
    height = 0.95,
    width = 0.95,
    scroll_speed = 10,
    preview_width = 0.60,
  },
  history = {
    path = vim.fn.stdpath('cache') .. '/telescope/history'
  },
  preview = {
    check_mime_type = true,
    timeout = 100,
    -- hook
  },
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
  telescope.builtin.find_files({ follow = true })
end

function builtin.colorsheme()
  telescope.builtin.colorscheme({ enable_preview = true })
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

config.extensions = {}

------------------------------------------------------------------------------

config.extensions.file_browser = require("telescope").extensions.file_browser

keymaps.e = config.extensions.file_browser.file_browser

local file_browser = config.extensions.file_browser.actions
config.extensions.file_browser = {
  mappings = {
    n = {
      C = file_browser.change_cwd,
      D = file_browser.remove,
      M = file_browser.move,
      n = file_browser.create,
      R = file_browser.rename,
      S = file_browser.create,
      ["~"] = file_browser.goto_home_dir,
      ["."] = file_browser.toggle_hidden,
      -- ["<BS>"] = file_browser.actions.move,
    },
    i = {
      ["<C-a>"] = file_browser.toggle_hidden,
      ["<C-d>"] = file_browser.remove,
      ["<C-h>"] = file_browser.goto_home_dir,
      ["<C-m>"] = file_browser.move,
      ["<C-r>"] = file_browser.rename,
      ["<C-y>"] = file_browser.copy,
    }
  }
}

------------------------------------------------------------------------------

keymaps.p = telescope.extensions.project.project

config.extensions.project = {
  vim.fn.fnamemodify(string.match(vim.env.MYVIMRC, "(.*)/nvim"), ":~"),
  vim.fn.fnamemodify(string.match(vim.env.MYVIMRC, "(.*/nvim)"), ":~"),
  base_dirs = {
    { path = vim.fn.fnamemodify(string.match(vim.env.MYVIMRC, "(.*)/nvim"), ":~") },
  },
}

-- config.extensions.frecency = {
--   -- db_root = vim.fn.stdpath("cache") .. "/nvim/db",
--   db_root = vim.fn.glob("$HOME/.local/*/opt/sqlite/lib/*.*.dylib"),
--   workspaces = {
--     ["config"] = string.gsub(vim.fn.stdpath("config"), "/nvim/.*", ""),
--     ["data"]   = string.gsub(vim.fn.stdpath("data"), "/nvim/.*", "")
--   }
-- }


-- pcall(require("telescope").load_extension, "file_browser")
-- pcall(require("telescope").load_extension, "frecency")
-- pcall(require("telescope").load_extension, "packer")
-- pcall(require("telescope").load_extension, "project")
-- pcall(require("telescope").load_extension, "ui-select")
-- pcall(require("telescope").load_extension, "vimspector")
-- pcall(require("telescope").load_extension, "snippets")

--- SETUP --------------------------------------------------------------------

local leader_key = "s"
for lhs, rhs in pairs(keymaps) do
  vim.keymap.set("n", leader_key .. lhs, rhs, { noremap = true, })
end

telescope.setup(config)
