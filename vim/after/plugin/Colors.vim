let Colors = {}

let Colors.all = flatten(globpath(&runtimepath, 'colors', 0, 1)
                    \ ->copy()->map('readdir(v:val)'))
                    \ ->map('fnamemodify(v:val, ":r")')
                    \ ->sort()->uniq()

let Colors.current = trim(execute('colorscheme'))

function Colors.set(arg=0, group='favorite') dict
    if a:arg == 0 | return | endif

    let l:curr_cs_idx = index(self[a:group], self.current)
    let l:new_cs_idx = (l:curr_cs_idx + a:arg) % len(self[a:group])

    execute('silent colorscheme ' . self[a:group][l:new_cs_idx])
    let self.current = self[a:group][l:new_cs_idx]
    echomsg 'NEW COLORSCHEME: ' . self.current
endfunction

function Colors.next(group='favorite') dict
    call self.set(1, a:group)
endfunction

function Colors.previous(group='favorite') dict
    call self.set(-1, a:group)
endfunction

"------------------------------------------------------------------------------

"command! -complete=customlist,Colors.favorite -nargs=+ ColorsSet

"------------------------------------------------------------------------------

"noremap <buffer><nowait><silent> <Home> <Cmd>call Colors.set(-1)<CR>
"noremap <buffer><nowait><silent> <End> <Cmd>call Colors.set(+1)<CR>

"------------------------------------------------------------------------------

function Colors.addToList(list, item) dict      "a:list == (light|dark|preffered)
    "&& count(self[a:list], a:item) >= 1
    if (count(self[a:list], a:item) == 0)
        call add(self[a:list], a:item)
    endif
endfunction

let Colors.favorite = [ 'atom', 'ayu', 'default', 'focuspoint', 'happy_hacking', 'hybrid_material', 'molokai', 'oceanic_material', 'solarized8_flat', 'solarized8_high', ]
let Colors.dark  = [ '256_noir', 'OceanicNext', 'abstract', 'afterglow', 'alduin', 'anderson', 'angr', 'apprentice', 'archery', 'atom', 'ayu', 'blue', 'carbonized-dark', 'challenger_deep', 'darkblue', 'deep-space', 'default', 'desert', 'deus', 'dogrun', 'elflord', 'evening', 'flattened_dark', 'focuspoint', 'fogbell', 'fogbell_lite', 'gotham', 'gotham256', 'gruvbox', 'happy_hacking', 'hybrid', 'hybrid_material', 'hybrid_reverse', 'iceberg', 'industry', 'jellybeans', 'koehler', 'lucius', 'materialbox', 'meta5', 'minimalist', 'molokai', 'molokayo', 'mountaineer', 'mountaineer-grey', 'murphy', 'nord', 'oceanic_material', 'one', 'one-dark', 'onedark', 'onehalfdark', 'orange-moon', 'orbital', 'pablo', 'paramount', 'parsec', 'pink-moon', 'purify', 'rdark-terminal2', 'ron', 'scheakur', 'seoul256', 'seoul256-light', 'sierra', 'slate', 'snow', 'solarized8', 'solarized8_flat', 'solarized8_high', 'solarized8_low', 'sonokai', 'space-vim-dark', 'spacecamp', 'spacecamp_lite', 'stellarized', 'sunbather', 'tender', 'termschool', 'torte', 'twilight256', 'two-firewatch', 'wombat256mod', 'yellow-moon', ]
let Colors.light = [ 'OceanicNextLight', 'PaperColor', 'carbonized-light', 'delek', 'flattened_light', 'fogbell_light', 'github', 'lightning', 'lucid', 'morning', 'mountaineer-light', 'onehalflight', 'peachpuff', 'pyte', 'rakr', 'shine', 'seoul256-light', 'zellner']

" vim: filetype=vim:foldmethod=indent:
