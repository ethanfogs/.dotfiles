-- { GENERAL HOUSEKEEPING }------------------------------------------------------

vim.o.backup     = false
vim.o.swapfile   = false
vim.o.lazyredraw = true
-- { [INDENTATION, TABBING, SPACING]-BEHAVIOR }----------------------------

vim.o.expandtab   = true      -- convert tabs to spaces
vim.o.tabstop     = 4         -- tabs go by intervals of 4 spaces
vim.o.softtabstop = 4         -- tabs go by intervals of 4 spaces
vim.o.shiftwidth  = 4         -- 1 indent = 4 spaces
vim.o.shiftround  = true      -- auto align indentation to nearest shiftwidth
-- { [UX, BACKEND] }-------------------------------------------------------

vim.o.autoread   = true
vim.o.clipboard  = "unnamed"
vim.o.updatetime = 200
vim.o.timeoutlen = 500
vim.o.undofile   = true
vim.o.undodir    = vim.fn.stdpath('data')  .. "/undo"
-- { [FILE, PATTERN]-SEARCH BEHAVIOR }-------------------------------------

vim.o.path        = ".,**"
vim.o.wildignore  = "node_modules/,package-*.json,*cargo/,rustup/,luarocks/,gtk-*/,ssh/"
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.smartindent = true
vim.o.smarttab    = false
vim.o.incsearch   = true
-- { VISUAL-UI }-----------------------------------------------------------

vim.o.termguicolors = true
vim.o.number        = true
vim.o.showtabline   = 2
vim.o.showmode      = false
vim.o.colorcolumn   = '79'
vim.o.cursorline    = true
vim.o.scroll        = 5
vim.o.wrap          = false
vim.o.scrolloff     = 7
vim.o.splitbelow    = true
vim.o.splitright    = true

vim.o.inccommand = "split"   -- preview buffer for `:substitute`
