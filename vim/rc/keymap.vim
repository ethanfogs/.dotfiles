let keymap = { 'default_opts': [ 'noremap', 'silent', ] }

function keymap.set(mode, lhs, rhs, opts=self['default_opts']) dict
    let l:opts = (type(a:opts) == v:t_dict)
                \ ? a:opts->filter('v:val != v:false')->keys()
                \ : a:opts

    let l:opts = count(l:opts, 'defaults')
                \ ? l:opts + self.default_opts
                \ : l:opts

    let l:cmd = count(l:opts, 'noremap') ? 'noremap' : 'map'
    let l:cmd = (a:mode == "!") ? l:cmd . "!" : a:mode . l:cmd

    if count(l:opts, 'cmd')
        let l:opts[index(l:opts, 'cmd')] = 'command'
    endif

    let l:rhs = count(l:opts, 'command') ? '<Cmd>' . a:rhs . '<CR>' : a:rhs

    for l:opt in ['defaults', 'noremap', 'command']
        silent! call remove(l:opts, l:opt)
    endfor

    let l:cmd = len(l:opts)
                \ ? l:cmd .' '. keys(l:opts)->map('"<". v:val .">"')->join()
                \ : l:cmd

    execute([l:cmd, a:lhs, l:rhs]->join(' '))
endfunction

"NORMAL-MODE -----------------------------------------------------------------
call keymap.set('n', 'Y', 'yg$')
call keymap.set('n', 'V', 'vg$')
call keymap.set('n', 'U', '<C-r>')

call keymap.set('', '<Space>', '<C-w>')
call keymap.set('n', '<Space>t', exists(":ToggleTerm") ? 'ToggleTerm' : 'term', ['defaults', 'command'])
call keymap.set('n', '<Space>T', 'vsplit\|terminal', ['defaults', 'command'])

call keymap.set('n', '<Space>w', 'write', ['defaults', 'command', ])
" call keymap.set('', '<Space>m', 'make', ['defaults', 'command', ])

"[NVO]-MODE ------------------------------------------------------------------
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

"[NVO]-MODE:LEADER-KEY::<Tab> //(tab nav)
call keymap.set('', '<Tab>n', 'tabnew',      ['defaults', 'command'])
call keymap.set('', '<Tab>j', 'tabprevious', ['defaults', 'command'])
call keymap.set('', '<Tab>k', 'tabnext',     ['defaults', 'command'])
call keymap.set('', '<Tab>x', 'tabclose',    ['defaults', 'command'])

"OP-PENDING-MODE::MOTION ALIASES (`i` => `in`, `a` => `around`)
call keymap.set('o', 'ic', 'i{')
call keymap.set('o', 'ac', 'a{')
call keymap.set('o', 'ia', 'i<')
call keymap.set('o', 'aa', 'a<')
call keymap.set('o', 'iq', 'i"')
call keymap.set('o', 'aq', 'a"')

"[IC]-MODE ------------------------------------------------------------------- 
call keymap.set('!', 'jj', '<C-c>')
call keymap.set('!', '<',  '<><Left>')
call keymap.set('!', '<>', '<>')

"TERMINAL-MODE ---------------------------------------------------------------
call keymap.set('t', '<Esc>', '<C-BSlash><C-n>')
call keymap.set('t', 'jj',    '<C-BSlash><C-n>')

"PLUGIN:FILE-BROWSER ---------------------------------------------------------

if (exists('NvimTreeToggle'))
    let s:file_browser = 'NvimTreeToggle'
elseif(exists('NERDTreeToggleVCS'))
    let s:file_browser = 'NERDTreeToggleVCS'
else
    let s:file_browser = 'Lexplore'
endif

call keymap.set('', '<Space>e',   s:file_browser, ['defaults', 'command'])

"PLUGIN:GIT ------------------------------------------------------------------

call keymap.set('', 'gs', 'Git', [ 'defaults', 'command' ])
