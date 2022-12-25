if (not pcall(require, "telescope")) then return end

local builtin = setmetatable({}, { __index = require("telescope.builtin") })

local actions = setmetatable({}, { __index = require("telescope.actions") })
actions.state = setmetatable({}, { __index = require("telescope.actions.state") })

--- DEFAULT OPTS -------------------------------------------------------------

local config = {}

config.defaults = {
  cache_picker = {
    num_pickers = -1, -- unlimited
  },
  sorting_strategy = "ascending",
  winblend = 7,
  dynamic_preview_title = true,
  layout_config = {
    horizontal = {
      height = 0.95,
      width = 0.95,
      scroll_speed = 10,
      preview_width = 0.60,
    },
  },
  preview = {
    check_mime_type = true,
  },
}

config.defaults.mappings = {
  n = {
    ["q"]          = actions.close,
    ["ZZ"]         = actions.close,
    ["<Esc>"]      = actions.close,
    ["<C-c>"]      = actions.close,
    ["<C-]>"]      = actions.close,
    ["<C-BSlash>"] = actions.close,
    ["<C-k>"]      = actions.preview_scrolling_up,
    ["<C-j>"]      = actions.preview_scrolling_down,
    ["<Tab>"]      = actions.toggle_selection,
    ["<Space>"]    = actions.toggle_selection,
    ["<C-a>"]      = actions.toggle_all,
  },
  i = {
    ["<C-a>"] = actions.toggle_all,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-u>"] = actions.preview_scrolling_up,
    ["<C-d>"] = actions.preview_scrolling_down,
    ["<C-c>"] = actions.close,
    ["<C-]>"] = actions.close,
    ["<Esc>"] = actions.close,
    ["jj"]    = { "<Esc>", type = "command" },
  },
}

config.pickers = {}

config.pickers.find_files = {
  follow = true,
  -- hidden = true,
}

config.pickers.buffers = {
  mappings = {
    n = {
      ["<C-d>"] = actions.delete_buffer,
    },
    i = {
      ["<C-d>"] = actions.delete_buffer,
    },
  }
}

config.pickers.colorscheme = {
  enable_preview = true,
  layout_strategy = "center",
}

require("telescope").setup(config)

--- KEYMAPS ------------------------------------------------------------------

-- function builtin.find_files()
--   require("telescope.builtin").find_files({ follow = true, })
-- end

function builtin.colorsheme()
  require("telescope.builtin")
    .colorscheme(require("telescope.themes").get_dropdown())
end

local keymap = {}
function keymap.set(lhs, rhs, opts)
  require("vim.keymap").set("n", lhs, rhs, opts or { noremap = true, })
end

keymap.set("ss", builtin.resume)
keymap.set("s ", builtin.builtin)
-- keymap.set("s ", builtin.pickers)
-- keymap.set("", builtin.reloader)

keymap.set("sm", builtin.man_pages)

keymap.set("<C-f>", builtin.find_files)
keymap.set("sf", builtin.find_files)
keymap.set("sb", builtin.buffers)
keymap.set("so", builtin.oldfiles)

keymap.set("sl", builtin.live_grep)
keymap.set("sG", builtin.grep_string)
keymap.set("s/", builtin.current_buffer_fuzzy_find)

keymap.set("sgb", builtin.git_branches)
keymap.set("sgc", builtin.git_commits)
keymap.set("sgf", builtin.git_files)
keymap.set("sgg", builtin.git_status)
keymap.set("<C-g>", builtin.git_status)
keymap.set("sgG", builtin.git_bcommits)
keymap.set("sgS", builtin.git_stash)

keymap.set("sdd", builtin.diagnostics)
keymap.set("st", builtin.treesitter)
keymap.set("sdf", builtin.lsp_definitions)
keymap.set("sdi", builtin.lsp_implementations)
keymap.set("sdr", builtin.lsp_references)
keymap.set("sds", builtin.lsp_document_symbols)
keymap.set("sdw", builtin.lsp_dynamic_workspace_symbols)
-- keymap.set("sdi", builtin.lsp_incoming_calls)
-- keymap.set("sdo", builtin.lsp_outcoming_calls)
keymap.set("sdt", builtin.lsp_type_definitions)
keymap.set("sdw", builtin.lsp_workspace_symbols)

keymap.set("sc",  builtin.colorsheme)
keymap.set("sv?", builtin.search_history)
keymap.set("sv:", builtin.command_history)
keymap.set("svh", builtin.help_tags)
keymap.set("svk", builtin.keymaps)
keymap.set("svt", builtin.tags)
keymap.set("svs", builtin.spell_suggest)

--- EXTENSIONS ----------------------------------------------------------------

local extensions = setmetatable({}, { __index = require("telescope").extensions })

if (extensions.file_browser ~= nil) then
  keymap.set("se", extensions.file_browser.file_browser)
end

if (pcall(require("telescope").load_extension, "project")) then
  keymap.set("sp", extensions.project.project)
end

-- TODO: Figure out why these plugins aren't being loaded in.
require("telescope").load_extension("fzf")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("packer")
