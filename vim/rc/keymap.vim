"GLOBAL `SET KEYMAP` WRAPPER ---------------------------------------------------
let keymap = { 'default_opts': [ 'noremap', 'silent', ] }

function keymap.set(mode, lhs, rhs, opts=self[ 'default_opts' ]) dict
    let l:opts = count(a:opts, 'defaults')
                \ ? a:opts + self.default_opts
                \ : a:opts

    let l:cmd = count(l:opts, 'noremap') ? 'noremap' : 'map'
    let l:cmd = (a:mode == "!") ? l:cmd . "!" : a:mode . l:cmd

    let l:rhs = a:rhs
    if(count(l:opts, 'lua'))
        let l:rhs = 'lua ' . l:rhs
        "add `command` to l:opts so the lua command can be wrapped in <Cmd><CR>
        if !count(l:opts, 'command') | call add(l:opts, 'command') | endif
    endif

    let l:rhs = count(l:opts, 'command') ? '<Cmd>' . l:rhs . '<CR>' : l:rhs

    for l:opt in ['defaults', 'noremap', 'command', 'lua']
        silent! call remove(l:opts, l:opt)
    endfor

    let l:cmd = len(l:opts) > 0
                \ ? l:cmd .' '. keys(l:opts)->map('"<". v:val .">"')->join()
                \ : l:cmd

    execute([l:cmd, a:lhs, l:rhs]->join(' '))
endfunction

"NORMAL-MODE -------------------------------------------------------------------
call keymap.set('n', 'Y', 'yg$')
call keymap.set('n', 'V', 'vg$')
call keymap.set('n', 'U', '<C-r>')

call keymap.set('', '<Space>', '<C-w>')

call keymap.set('n', '<BS>', '<C-o>')
call keymap.set('n', '<S-BS>', '<C-i>')

call keymap.set('n', '<Space>t', (&runtimepath =~ ".*toggleterm") ? 'ToggleTerm' : 'term', ['defaults', 'command'])
call keymap.set('n', '<Space>T', 'vsplit\|terminal', ['defaults', 'command'])
call keymap.set('n', '<Space>w', 'write', ['defaults', 'command', ])
call keymap.set('', '<Space>m', 'if (!empty(&l:makeprg)) \| make \| endif', ['defaults', 'command', ])

"[NVO]-MODE ---------------------------------------------------------------------
call keymap.set('', 'H',  'g0')
call keymap.set('', 'L',  'g$')
call keymap.set('', 'S',  '%')
call keymap.set('', 'Q',  '<C-v>')
call keymap.set('', '-',  '<C-w>2+')
call keymap.set('', '_',  '<C-w>2-')
call keymap.set('', '!!', '@:')

"[NVO]-MODE::SCROLLING ALIASES
call keymap.set('', '<C-k>',    '5<C-y>')
call keymap.set('', '<C-j>',    '5<C-e>')

"[NVO]-MODE::WINDOW-RESIZING ALIASES
call keymap.set('', '<Bar>',    '<C-w>4<', [ 'defaults', 'nowait'])
call keymap.set('', '<BSlash>', '<C-w>4>', [ 'defaults', 'nowait'])

"[NVO]-MODE::VIM-COMMAND ALIASES
call keymap.set('', '<Space>;', '@:')
call keymap.set('', '<Space>/', 'let @/=""', ['defaults', 'command'])

"[NVO]-MODE::FOLDING-OPERATION ALIASES
call keymap.set('', ',', 'z')
call keymap.set('', ',,', 'za')
call keymap.set('', '<Space>,', 'zA')

call keymap.set('', '<Space>', '<C-w>') "`<Space>` => cancels op-pending state
call keymap.set('v', '<Space>', '<C-[>') "`<Space>` => cancels op-pending state

"[NVO]-MODE:LEADER-KEY::<Tab> //(tab nav)
call keymap.set('', '<Tab>n', 'tabnew',      ['defaults', 'command'])
call keymap.set('', '<Tab>j', 'tabprevious', ['defaults', 'command'])
call keymap.set('', '<Tab>k', 'tabnext',     ['defaults', 'command'])
call keymap.set('', '<Tab>x', 'tabclose',    ['defaults', 'command'])

"OP-PENDING-MODE::MOTION ALIASES (`i` => `in`, `a` => `around`) -----------------
call keymap.set('o', 'ic', 'i{')
call keymap.set('o', 'ac', 'a{')
call keymap.set('o', 'ia', 'i<')
call keymap.set('o', 'aa', 'a<')
call keymap.set('o', 'iq', 'i"')
call keymap.set('o', 'aq', 'a"')

"[IC]-MODE ----------------------------------------------------------------------
call keymap.set('!', 'jj', '<C-c>')
call keymap.set('!', '<',  '<><Left>')
call keymap.set('!', '<>', '<>')

"TERMINAL-MODE ------------------------------------------------------------------
call keymap.set('t', '<Esc>', '<C-BSlash><C-n>')
call keymap.set('t', 'jj',    '<C-BSlash><C-n>', [ 'noremap' ])

"PLUGIN:FILE-BROWSER -----------------------------------------------------------

if (&runtimepath =~ ".*/nvim-tree")
    let s:file_browser = 'NvimTreeToggle'
elseif(&runtimepath =~ ".*/nerdtree")
    let s:file_browser = 'NERDTreeToggleVCS'
else
    let s:file_browser = 'Lexplore'
endif

call keymap.set('', '<Space>e',   s:file_browser, ['defaults', 'command'])

"PLUGIN:GIT ---------------------------------------------------------------------

call keymap.set('', 'gs', 'Git', [ 'defaults', 'command' ])

"NVIM-EXCLUSIVE KEYMAPS --------------------------------------------------------

if (v:progname == 'vim') | finish | endif

lua << EOF

local set_keymap = vim.api.nvim_set_keymap

-- PLUGIN:TELESCOPE ------------------------------------------------------------
telescope         = require('telescope')
telescope.builtin = require('telescope.builtin')
telescope.utils   = require('telescope.utils')
telescope.actions = require('telescope.actions')

set_keymap('', 's', '<Nop>', {}) -- to prevent invoking substitution operations
telescope.keymaps = {
    ['a'] = 'autocommands()',
    ['b'] = 'buffers()',
    ['B'] = 'builtin()',
    ['c'] = 'colorscheme({ enable_preview = true})',
    ['d'] = 'lsp_definitions()',
    ['D'] = 'lsp_document_symbols()',
    ['f'] = 'find_files()',
    ['F'] = 'git_files()',
    ['h'] = 'help_tags()',
    ['H'] = 'highlights()',
    ['g'] = 'git_status()',
    ['G'] = 'grep_string()',
    ['i'] = 'lsp_implementations()',
    ['I'] = 'lsp_incoming_calls()',
    ['j'] = 'jumplist()',
    ['k'] = 'keymaps()',
    ['l'] = 'live_grep()',
    ['L'] = 'loclist()',
    ['m'] = 'man_pages()',
    ['o'] = 'old_files()',
    ['O'] = 'lsp_outgoing_calls()',
    ['q'] = 'quickfix()',
    ['Q'] = 'quickfixhistory()',
    ['r'] = 'lsp_references()',
    ['R'] = 'reloader()',
    ['s'] = 'git_stash()',
    ['S'] = 'spell_suggest()',
    ['t'] = 'treesitter()',
    ['w'] = 'lsp_dynamic_workspace_symbols()',
    [';'] = 'commands()',
    ['?'] = 'builtin()',
    ["'"] = 'registers()',
    ["/"] = 'search_history()',
    ["<Space>"] = 'resume()',
}

for lhs, rhs in pairs(telescope.keymaps) do
    local rhs = "<Cmd>lua require('telescope.builtin')." .. rhs .. "<CR>"
    set_keymap('n', 's' .. lhs, rhs, { noremap = true, silent = true })
end
EOF
