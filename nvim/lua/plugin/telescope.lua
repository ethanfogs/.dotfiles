local telescope = require("telescope")
telescope.builtin = require("telescope.builtin")

telescope.config = {}

telescope.config.defaults = {
  entry_prefix = "",
  selection_caret = "",
  sorting_strategy = "ascending",
  file_ignore_patterns = { "node_modules/", },
  winblend = 7,
  dynamic_preview_title = true,
  layout_strategy = 'horizontal',
  layout_config = {
    height = 0.95, width = 0.95, preview_width = 0.60,
    scroll_speed = 10
  },
}

telescope.config.defaults.mappings = {
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

telescope.setup(telescope.config)

------------------------------------------------------------------------------

telescope.keymaps = {
  ["a"] = telescope.builtin.autocommands,
  ["b"] = telescope.builtin.buffers,
  ["B"] = telescope.builtin.builtin,
  ["d"] = telescope.builtin.lsp_definitions,
  ["D"] = telescope.builtin.lsp_document_symbols,
  ["F"] = telescope.builtin.git_files,
  ["h"] = telescope.builtin.help_tags,
  ["H"] = telescope.builtin.highlights,
  ["g"] = telescope.builtin.git_status,
  ["G"] = telescope.builtin.grep_string,
  ["i"] = telescope.builtin.lsp_implementations,
  ["I"] = telescope.builtin.lsp_incoming_calls,
  ["j"] = telescope.builtin.jumplist,
  ["k"] = telescope.builtin.keymaps,
  ["l"] = telescope.builtin.live_grep,
  ["L"] = telescope.builtin.loclist,
  ["m"] = telescope.builtin.man_pages,
  ["o"] = telescope.builtin.old_files,
  ["O"] = telescope.builtin.lsp_outgoing_calls,
  ["q"] = telescope.builtin.quickfix,
  ["Q"] = telescope.builtin.quickfixhistory,
  ["r"] = telescope.builtin.lsp_references,
  ["R"] = telescope.builtin.reloader,
  ["s"] = telescope.builtin.git_stash,
  ["S"] = telescope.builtin.spell_suggest,
  ["t"] = telescope.builtin.treesitter,
  ["w"] = telescope.builtin.lsp_dynamic_workspace_symbols,
  [";"] = telescope.builtin.commands,
  ["?"] = telescope.builtin.builtin,
  ["'"] = telescope.builtin.registers,
  ["/"] = telescope.builtin.search_history,
  ["<Space>"] = telescope.builtin.resume,
}

telescope.keymaps.f = function()
  local args = { follow = true, hidden = true, }
  if (string.match(vim.fn.getcwd(), "nvim") ~= nil) then
    args["search_dirs"] = { ".", "~/.vim" }
  end
  telescope.builtin.find_files(args)
end

telescope.keymaps.c = function()
  telescope.builtin.colorscheme({ enable_preview = true })
end

------------------------------------------------------------------------------

telescope.keymaps.leader_key = "s"

for lhs, rhs in pairs(telescope.keymaps) do
  vim.keymap.set("n", "s" .. lhs, rhs, { noremap = true, silent = true })
end
