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

function ts.set_keymap(lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", lhs, "<Cmd>lua require('telescope.builtin')." .. rhs .. "<CR>", opts)
end

ts.set_keymap("sb", "buffers()")
ts.set_keymap("sc", "colorscheme({ enable_preview = true })")
ts.set_keymap("sf", "find_files()")
ts.set_keymap("sh", "help_tags()")
ts.set_keymap("sk", "keymaps()")
ts.set_keymap("sl", "live_grep()")
ts.set_keymap("sm", "man_pages()")
ts.set_keymap("so", "vim_options()")
ts.set_keymap("sq", "quickfix()")
ts.set_keymap("sr", "registers()")
ts.set_keymap("sv", "commands()")
ts.set_keymap("s,", "oldfiles()")
ts.set_keymap("s/", "current_buffer_fuzzy_find()")
ts.set_keymap("s;", "command_hist()")
ts.set_keymap("s?", "builtin()")
