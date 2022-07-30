local ts = require('telescope')

ts.setup({
    defaults = {
        sorting_strategy = 'ascending',
        winblend = 7,
        dynamic_preview_title = true,
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.95,
            width = 0.95,
            preview_width = 0.60,
        },
        mappings = {
            n = {
                ["<Esc>"]   = "close",
                ["q"]       = "close",
                ["<C-c>"]   = "close",
                ["<Space>"] = "toggle_selection",
                ["ZZ"]      = "close",
            },
            i = {
                ["<C-a>"] = "toggle_all",
                ["<C-k>"] = "move_selection_previous",
                ["<C-j>"] = "move_selection_next",
                ["<Esc>"] = "close",
                ["<C-c>"] = "close",
                ['jj']    = { "<Esc>", type = "command" }
            }
        }
    }
})

-- telescope keymaps set $HOME/.config/nvim/rc/keymap.vim
