lua << EOF
local status_ok, telescope = pcall(require, 'telescope')
if not (status_ok) then
    return
end
    
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local themes  = require('telescope.themes')

------------------------------------------------------------------------------

telescope.setup({
    ['defaults'] = {
        ['sorting_strategy'] = 'ascending',
        ['selection_strategy'] = 'follow',
        ['dynamic_preview_title'] = true, 
        ['file_ignore_patterns'] = {
            '.cargo/', '.rustup/', 'node_modules/', '.git/',
            '.*.session','.*.history','.cache/', '.DS_Store',
            '*.log', '*.jar', '*.spec/*', '*.app/*'
        }, 
        ['mappings'] = {
            ['n'] = {
                ['<Tab>'] = actions.toggle_selection,
                ['<Space>'] = actions.toggle_selection,
            },
            ['i'] = {
                ['<Space>'] = actions.toggle_selection,
                ['<C-a>'] = actions.toggle_all,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<esc>'] = actions.close,
                ['<C-c>'] = actions.close,
                --['jj'] = { '<esc>' },
            }
        }
    }
}) --{ UTIL FUNCTIONS }-----------------------------------------------------------

function tele_find_files()
    local find_files_opts = {
        hidden = true, follow = true,
        layout_config = { prompt_position = "bottom" },
    }

    local is_in_config_dir = not (string.match(vim.fn['getcwd'](), 'config') == nil)

    if (is_in_config_dir) then
        find_files_opts['search_dirs'] = { "~/.config" }
    end
    builtin.find_files(opts)
end

function tele_current_buffer_fuzzy_find()
    builtin.current_buffer_fuzzy_find({ skip_empty_lines = true })
end

function tele_colorscheme()
    builtin.colorscheme({ enable_preview = true })
end

tele_live_grep    = builtin.live_grep
tele_buffers      = builtin.buffers
tele_quickfix     = builtin.quickfix
tele_oldfiles     = builtin.oldfiles
tele_man_pages    = builtin.man_pages
tele_vim_opts     = builtin.vim_options
tele_help_tags    = builtin.help_tags
tele_commands     = builtin.commands
tele_command_hist = builtin.command_history
tele_search_hist  = builtin.search_history
tele_registers    = builtin.registers

------------------------------------------------------------------------------

set_keymap = vim.api.nvim_set_keymap
keymap_opts = { ['noremap'] = true, ['silent'] = true }

set_keymap('n', "<C-f>", '<Cmd>lua tele_find_files()<CR>', keymap_opts)
set_keymap('n', ",f", '<Cmd>lua tele_find_files()<CR>', keymap_opts)
set_keymap('n', ",l", '<Cmd>lua tele_live_grep()<CR>', keymap_opts)
set_keymap('n', ",q", '<Cmd>lua tele_quickfix()<CR>', keymap_opts)
set_keymap('n', ",c", '<Cmd>lua tele_colorscheme()<CR>', keymap_opts)
set_keymap('n', ",b", '<Cmd>lua tele_buffers()<CR>', keymap_opts)
set_keymap('n', ",o", '<Cmd>lua tele_vim_opts()<CR>', keymap_opts)
set_keymap('n', ",h", '<Cmd>lua tele_help_tags()<CR>', keymap_opts)
set_keymap('n', ",m", '<Cmd>lua tele_man_pages()<CR>', keymap_opts)
set_keymap('n', ",v", '<Cmd>lua tele_commands()<CR>', keymap_opts)
set_keymap('n', ",/", '<Cmd>lua tele_current_buffer_fuzzy_find()<CR>', keymap_opts)
set_keymap('n', ",;", '<Cmd>lua tele_command_hist()<CR>', keymap_opts)
set_keymap('n', ",?", '<Cmd>lua tele_search_hist()<CR>', keymap_opts)
set_keymap('n', ",r", '<Cmd>lua tele_registers()<CR>', keymap_opts)
set_keymap('n', ",'", '<Cmd>lua tele_oldfiles()<CR>', keymap_opts)
EOF
