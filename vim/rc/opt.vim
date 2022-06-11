"{ GENERAL HOUSEKEEPING }------------------------------------------------------

let &lazyredraw      = v:true
let &backup          = v:false
let &swapfile        = v:false
"{ [INDENTATION, TABBING, SPACING]-BEHAVIOR }----------------------------

let &expandtab       = v:true    "convert tabs to spaces
let &tabstop         = 4         "tabs go by intervals of 4 spaces
let &softtabstop     = 4         "tabs go by intervals of 4 spaces
let &shiftwidth      = 4         "1 indent = 4 spaces
"{ [UX, BACKEND] }-------------------------------------------------------

let &autoread        = v:true    "changes to a file are shown in real-time
let &clipboard       = 'unnamed'
let &hidden          = v:false
let &undodir         = $XDG_DATA_HOME . '/' . v:progname .'/undo'
let &undofile        = v:true
let &updatetime      = 2000
let &timeoutlen      = 2000
"{ [FILE, PATTERN]-SEARCH BEHAVIOR }-------------------------------------

let &path            .= '**,'
let &suffixes        = '/'
let &ignorecase      = v:true
let &fileignorecase  = v:true
let &wildignore      = '*sh_history*,*sh_sessions*,.zcompdump,' .
                    \ 'node_modules/,package-lock.json,' .
                    \ '.CFUserTextEncoding,.DS_Store,.git/,Public/,Music/'
let &smartcase       = v:true
let &smartindent     = v:true
let &smarttab        = v:false
"{ VISUAL-UI }-----------------------------------------------------------

let &termguicolors   = v:true
let &number          = v:true
let &showtabline     = 2
let &colorcolumn     = 79
let &cursorline      = v:true
let &scroll          = 5
let &wrap            = v:false
let &scrolloff       = 7
"let &winwidth        = 84
let &showmode        = v:false
let &signcolumn      = 'no'
let &equalalways     = v:true
let &splitbelow      = v:true
let &splitright      = v:true

"{ NERDTREE CONFIG }----------------------------------------------------------

let NERDTreeShowHidden = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHijackNetrw = 1

let NERDTreeIgnore = readfile($HOME . '/.gitignore')
                        \ ->filter('v:val !~ "#.*" && !empty(v:val)')

"{ NEOVIM SPECIFIC GLOBAL OPTS }----------------------------------------------

if v:progname != 'nvim' | finish | end

let &inccommand = 'split'   "preview buffer for `:substitute`
let &laststatus = 2 "0: never, 1: when 2+ bufs, 2: always, 3: global (nvim only)
"let &laststatus = 3         "SINGLE GLOBAL statusline vs one for each window
