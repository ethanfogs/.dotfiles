local telescope = require('telescope')
local actions   = require('telescope.actions')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    winblend = 7,
    dynamic_preview_title = true,
    layout_strategy = 'horizontal',
    layout_config = {
      height = 0.95, width = 0.95, preview_width = 0.60,
      scroll_speed = 10
    },
    mappings = {
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
        ['<C-]>'] = "close",
        ['jj']    = { "<Esc>", type = "command" },
      }
    },
    pickers = {

    }
  }
})
