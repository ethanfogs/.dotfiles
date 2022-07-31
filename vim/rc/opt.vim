"{ GENERAL HOUSEKEEPING }------------------------------------------------------

let &backup   = v:false
let &swapfile = v:false
"{ [INDENTATION, TABBING, SPACING]-BEHAVIOR }---------------------------------

let &expandtab   = v:true    "convert tabs to spaces
let &tabstop     = 4         "tabs go by intervals of 4 spaces
let &vartabstop  = 4
let &softtabstop = 4

let &shiftwidth  = 4         "1 indent = 4 spaces
let &shiftround  = v:true    " auto align indentation to nearest shiftwidth

let &smartindent = v:true
let &smarttab    = v:false

"{ [UX, BACKEND] }------------------------------------------------------------

let &autoread  = v:true    "changes to a file are shown in real-time
let &clipboard = 'unnamed'
let &undofile  = v:true
let &undodir   = $HOME . '/.local/state/' . v:progname . '/undo'

"&viminfofile refers to &shadafile in newer vim variants (nvim)
let &viminfofile = $HOME . '/.local/share/' . v:progname . '/' .
                                        \ (has('shada') ? 'shada' : 'viminfo')

"{ [FILE, PATTERN]-SEARCH BEHAVIOR }------------------------------------------

let &path           = ".,**"
let &ignorecase     = v:true
let &smartcase      = v:true
let &fileignorecase = v:true

"{ VISUAL-UI }-----------------------------------------------------------------

let &incsearch   = v:true
let &number      = v:true
let &showtabline = 2
let &colorcolumn = 79
let &cursorline  = v:true
let &scroll      = 5
let &scrolloff   = 7
let &showmode    = v:false

let &equalalways = v:true
let &eadirection = 'ver'
let &splitbelow  = v:true
let &splitright  = v:true

let &wrap       = v:false
let &foldmethod = 'indent'

let &wildmenu    = v:true
let &wildmode    = 'longest:full,full'
let &wildoptions = 'pum'

if has('termguicolors')
    "not in nvim-exclusive block bc some later versions of vim have this opt
    let &termguicolors = v:true
endif
