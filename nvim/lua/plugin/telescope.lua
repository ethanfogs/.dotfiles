telescope = require('telescope')

builtin = require('telescope.builtin')
actions = require('telescope.actions')
themes  = require('telescope.themes')

------------------------------------------------------------------------------

telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        selection_strategy = 'follow',
        winblend = 7,
        dynamic_preview_title = true,
        file_ignore_patterns = vim.fn.readfile(os.getenv("HOME") .. "/.config/git/ignore"),
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.95,
            width = 0.95,
            preview_width = 0.60,
        },
        mappings = {
            n = {
                ["<Esc>"] = actions.close,
                q = actions.close,
                ["<C-c>"] = actions.close,
                ["<Space>"] = actions.toggle_selection,
            },
            i = {
                ["<C-a>"] = actions.toggle_all,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<Esc>"] = actions.close,
                ["<C-c>"] = actions.close,
                --['jj'] = { '<esc>' },
            }
        }
    }
})

-- TELESCOPE KEYMAPS SET @ $XDG_CONFIG_HOME/nvim/lua/rc/keymaps.lua
