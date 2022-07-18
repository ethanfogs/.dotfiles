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
let &hidden          = v:false
let &undofile        = v:true
let &undodir         = $XDG_DATA_HOME . '/' . v:progname .'/undo'
let &viminfofile     = $XDG_DATA_HOME . '/' . v:progname . '/viminfo'
let &updatetime      = 500
let &timeoutlen      = 500
"{ [FILE, PATTERN]-SEARCH BEHAVIOR }-------------------------------------

let &path            = ".,**"
let &ignorecase      = v:true
let &fileignorecase  = v:true
let &smartcase       = v:true
let &smartindent     = v:true
let &smarttab        = v:false
let &incsearch       = v:true
"{ VISUAL-UI }-----------------------------------------------------------

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
