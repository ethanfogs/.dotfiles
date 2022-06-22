local import_status, telescope = pcall(require, 'telescope')
if not (import_status) then
    return
end
    
builtin = require('telescope.builtin')
actions = require('telescope.actions')
themes  = require('telescope.themes')

------------------------------------------------------------------------------

telescope.setup({
    ['defaults'] = {
        ['sorting_strategy'] = 'ascending',
        ['selection_strategy'] = 'follow',
        ['dynamic_preview_title'] = true, 
        ['file_ignore_patterns'] = vim.fn.split(vim.o.wildignore, ','),
        ['mappings'] = {
            ['n'] = {
                ['<Home>'] = actions.toggle_selection,
                ['<End>'] = actions.toggle_selection,
            },
            ['i'] = {
                ['<Space>'] = actions.toggle_selection,
                ['<C-a>'] = actions.toggle_all,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<Esc>'] = actions.close,
                ['<C-c>'] = actions.close,
                --['jj'] = { '<esc>' },
            }
        }
    }
}) 

--{ UTIL FUNCTIONS }-----------------------------------------------------------

set_keymap = vim.api.nvim_set_keymap
keymap_opts = { noremap = true, silent = true }

set_keymap('n', "sb", '<Cmd>lua builtin.buffers()<CR>', keymap_opts)
set_keymap('n', "sc", '<Cmd>lua builtin.colorscheme()<CR>', keymap_opts)
set_keymap('n', "sf", '<Cmd>lua builtin.find_files()<CR>', keymap_opts)
set_keymap('n', "sh", '<Cmd>lua builtin.help_tags()<CR>', keymap_opts)
set_keymap('n', "sl", '<Cmd>lua builtin.live_grep()<CR>', keymap_opts)
set_keymap('n', "sm", '<Cmd>lua builtin.man_pages()<CR>', keymap_opts)
set_keymap('n', "so", '<Cmd>lua builtin.vim_opts()<CR>', keymap_opts)
set_keymap('n', "sq", '<Cmd>lua builtin.quickfix()<CR>', keymap_opts)
set_keymap('n', "sr", '<Cmd>lua builtin.registers()<CR>', keymap_opts)
set_keymap('n', "sv", '<Cmd>lua builtin.commands()<CR>', keymap_opts)
set_keymap('n', "s,", '<Cmd>lua builtin.oldfiles()<CR>', keymap_opts)
set_keymap('n', "s/", '<Cmd>lua builtin.current_buffer_fuzzy_find()<CR>', keymap_opts)
set_keymap('n', "s;", '<Cmd>lua builtin.command_hist()<CR>', keymap_opts)
set_keymap('n', "s?", '<Cmd>lua builtin.search_hist()<CR>', keymap_opts)
