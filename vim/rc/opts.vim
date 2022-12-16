"{ GENERAL HOUSEKEEPING }-----------------------------------------------------

let &compatible = 0

syntax on
filetype on

let &synmaxcol = 500
let &lazyredraw = 0

let &backup   = 0
let &swapfile = 0

"{ [INDENTATION, TABBING, SPACING]-BEHAVIOR }---------------------------------

let &shiftwidth  = 2    "1 indent = 2 spaces
let &shiftround  = 1    "auto align indentation to nearest shiftwidth
let &smartindent = 1
let &smarttab    = 0

let &expandtab   = 1    "convert tabs to spaces
let &tabstop     = 2    "tabs go by intervals of 2 spaces
let &softtabstop = 2
if(exists('&vartabstop'))
  let &vartabstop  = 2
  let &varsofttabstop  = 2
endif

"{ [UX, BACKEND] }------------------------------------------------------------

let &autoread = 1   "changes to a file are shown in real-time

if(has('clipboard'))
  let &clipboard = 'unnamed'
endif

let s:VIM_CACHE_HOME = $HOME . '/.cache/' . v:progname

let &undofile = 1
let &undodir  = s:VIM_CACHE_HOME . '/undo'

if(has('shada'))
  let &shadafile   = s:VIM_CACHE_HOME . '/shada'
elseif(has('viminfo'))
  let &viminfofile = s:VIM_CACHE_HOME . '/viminfo'
endif

"{ [FILE, PATTERN]-SEARCH BEHAVIOR }------------------------------------------

let &path           .= (&path =~ fnameescape('.,**')) ? '' : '.,**'
let &ignorecase     = 1
let &smartcase      = 1
let &fileignorecase = 0

"{ VISUAL-UI }----------------------------------------------------------------

let &incsearch   = 1
let &number      = 1
let &showtabline = 2
let &colorcolumn = 79
let &cursorline  = 1
let &scroll      = 5
let &scrolloff   = 7
let &showmode    = 0

let &splitbelow  = 1
let &splitright  = 1

let &wrap        = 0

let &wildmenu    = 1
let &wildmode    = 'longest:full,full'
let &wildoptions = 'pum'

let &foldmethod = 'indent'

if exists('&mouse')
  let &mouse = ''
endif
