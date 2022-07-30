"{ GENERAL HOUSEKEEPING }------------------------------------------------------

let &backup          = v:false
let &swapfile        = v:false
"{ [INDENTATION, TABBING, SPACING]-BEHAVIOR }----------------------------

let &expandtab       = v:true    "convert tabs to spaces
let &tabstop         = 4         "tabs go by intervals of 4 spaces
let &softtabstop     = 4         "tabs go by intervals of 4 spaces
let &shiftwidth      = 4         "1 indent = 4 spaces
let &shiftround      = v:true    " auto align indentation to nearest shiftwidth
"{ [UX, BACKEND] }-------------------------------------------------------

let &autoread        = v:true    "changes to a file are shown in real-time
let &clipboard       = 'unnamed'
let &undofile        = v:true
let &undodir         = $HOME . '/.local/state/' . v:progname . '/undo'

if(v:progname == "vim")
    let &viminfofile = $HOME . '/.local/share/vim/viminfo'
else
    let &shadafile = stdpath('data') . '/shada'
endif

"{ [FILE, PATTERN]-SEARCH BEHAVIOR }-------------------------------------

let &path = ".,**"

let &ignorecase      = v:true
let &smartcase       = v:true
let &fileignorecase  = v:true

let &smartindent     = v:true
let &smarttab        = v:false
"{ VISUAL-UI }-----------------------------------------------------------

let &incsearch       = v:true
let &number          = v:true
let &showtabline     = 2
let &colorcolumn     = 79
let &cursorline      = v:true
let &scroll          = 5
let &scrolloff       = 7
let &showmode        = v:false
let &splitbelow      = v:true
let &splitright      = v:true
let &wildmenu        = v:true
let &wrap            = v:false

if has('termguicolors')
    " not in nvim-exclusive block bc some later versions of vim have this opt
    let &termguicolors = v:true
endif

if (v:progname == "vim") | finish | endif

" NVIM-EXCLUSIVE VIM-OPTS
