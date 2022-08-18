"`SET KEYMAP` WRAPPER ========================================================
let s:keymap = { 'default_opts': ['noremap', 'silent'] }

function s:keymap.set(mode, lhs, rhs, ...) dict abort
  let opts = a:0 ? (type(a:1) == type('') ? [a:1] : a:1) : self.default_opts
  let opts = opts + (count(opts, 'defaults') ? self.default_opts : [])

  let remap_cmd = count(opts, 'noremap') ? 'noremap' : 'map'
  let remap_cmd = (a:mode == "!") ? remap_cmd . '!' :  a:mode . remap_cmd

  let rhs = (count(opts, 'command') ? join(['<Cmd>', a:rhs, '<CR>'], '') : a:rhs)
  call filter(opts, {_,opt -> count(['noremap','command','defaults'], opt) == 0})
  let opts = join(map(uniq(opts), {_,opt -> join(['<', opt, '>'], '')}), '')

  execute (join([remap_cmd, opts, a:lhs, rhs]))
endfunction

"NORMAL-MODE ==================================================================
call s:keymap.set('n', 'Y', 'yg$')
call s:keymap.set('n', 'U', '<C-r>')

call s:keymap.set('n', '<BS>', '<C-o>')
call s:keymap.set('n', '<S-BS>', '<C-i>')

call s:keymap.set('', '<Space>', '<C-w>')
call s:keymap.set('n', '<Space>w', 'write', ['defaults', 'command',])

let s:term_cmd = (&runtimepath =~ ".*/toggleterm") ? 'ToggleTerm' : 'terminal'
call s:keymap.set('n', '<Space>t', s:term_cmd, ['defaults', 'command',])
call s:keymap.set('n', '<Space>T', 'vsplit\|terminal', ['defaults', 'command',])

"[NVO]-MODE ==================================================================
call s:keymap.set('', 's', '<Nop>')
call s:keymap.set('', 'H',  'g0')
call s:keymap.set('', 'L',  'g$')
call s:keymap.set('', 'S',  '%')
call s:keymap.set('', 'Q',  '<C-v>')
call s:keymap.set('', '-',  '<C-w>2+')
call s:keymap.set('', '_',  '<C-w>2-')
call s:keymap.set('', '!!', '@:')

"[NVO]-MODE::SCROLLING ALIASES -----------------------------------------------
call s:keymap.set('', '<C-k>',    '5<C-y>')
call s:keymap.set('', '<C-j>',    '5<C-e>')

"[NVO]-MODE::WINDOW-RESIZING ALIASES -----------------------------------------
call s:keymap.set('', '<Bar>',    '<C-w>4<', [ 'defaults', 'nowait',])
call s:keymap.set('', '<BSlash>', '<C-w>4>', [ 'defaults', 'nowait',])

"[NVO]-MODE::VIM-COMMAND ALIASES ---------------------------------------------
call s:keymap.set('', '<Space>/', 'let @/=""', ['defaults', 'command',])

"[NVO]-MODE::FOLDING-OPERATION ALIASES ---------------------------------------
call s:keymap.set('', ',', 'z')
call s:keymap.set('', ',,', 'za')
call s:keymap.set('', '<Space>,', 'zA')

call s:keymap.set('', '<Space>', '<C-w>') "`<Space>` => cancels op-pending state
call s:keymap.set('v', '<Space>', '<C-[>') "`<Space>` => cancels op-pending state

"[NVO]-MODE:LEADER-KEY::<Tab> //(tab nav) ------------------------------------
call s:keymap.set('', '<Tab>n', 'tabnew',      ['defaults', 'command',])
call s:keymap.set('', '<Tab>j', 'tabprevious', ['defaults', 'command',])
call s:keymap.set('', '<Tab>k', 'tabnext',     ['defaults', 'command',])
call s:keymap.set('', '<Tab>x', 'tabclose',    ['defaults', 'command',])

"OP-PENDING-MODE::MOTION ALIASES (`i` => `in`, `a` => `around`) ==============
call s:keymap.set('o', 'ic', 'i{')
call s:keymap.set('o', 'ac', 'a{')
call s:keymap.set('o', 'ia', 'i<')
call s:keymap.set('o', 'aa', 'a<')
call s:keymap.set('o', 'iq', 'i"')
call s:keymap.set('o', 'aq', 'a"')

"[IC]-MODE ===================================================================
call s:keymap.set('!', 'jj', '<C-c>')

"TERMINAL-MODE ===============================================================
call s:keymap.set('t', '<Esc>', '<C-BSlash><C-n>', ['noremap',])
call s:keymap.set('t', 'jj',    '<C-BSlash><C-n>', ['noremap',])

"PLUGIN:FILE-BROWSER =========================================================
if (&runtimepath =~ ".*/nvim-tree")
  let s:file_browser = 'NvimTreeToggle'
elseif(&runtimepath =~ ".*/nerdtree")
  let s:file_browser = 'NERDTreeToggleVCS'
else
  let s:file_browser = 'Lexplore'
endif

call s:keymap.set('', '<Space>e',   s:file_browser, ['defaults', 'command',])

"PLUGIN:GIT ==================================================================
if(&runtimepath =~ ".*fugitive.*")
  call s:keymap.set('', 'gs', 'Git', ['defaults', 'command',])
endif
