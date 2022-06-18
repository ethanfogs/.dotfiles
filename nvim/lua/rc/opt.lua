local env = vim.env

-- { GENERAL HOUSEKEEPING }------------------------------------------------------

vim.o.lazyredraw      = true
vim.o.backup          = false
vim.o.swapfile        = false
-- { [INDENTATION, TABBING, SPACING]-BEHAVIOR }----------------------------

vim.o.expandtab       = true      -- convert tabs to spaces
vim.o.tabstop         = 4         -- tabs go by intervals of 4 spaces
vim.o.softtabstop     = 4         -- tabs go by intervals of 4 spaces
vim.o.shiftwidth      = 4         -- 1 indent = 4 spaces
-- { [UX, BACKEND] }-------------------------------------------------------

vim.o.autoread        = true    -- changes to a file are shown in real-time
vim.o.clipboard       = "unnamed"
vim.o.hidden          = false
vim.o.undodir         = vim.env.XDG_DATA_HOME .. "/" .. vim.v.progname .. "/undo"
vim.o.undofile        = true
vim.o.updatetime      = 2000
vim.o.timeoutlen      = 2000
-- { [FILE, PATTERN]-SEARCH BEHAVIOR }-------------------------------------

vim.o.path            = vim.o.path .. ",**,"
vim.o.suffixes        = "/"
vim.o.ignorecase      = true
vim.o.fileignorecase  = true

local function readfile(filepath)
    local file = io.open(filepath)
    local _lines = {}
    local i = 0
    for line in file:lines() do
        i = i + 1
        _lines[i] = line
    end
    io.close(file) 
    return _lines
end
-- vim.o.wildignore      = table.concat(readfile(env.HOME .. '/.gitignore'), ",")
vim.o.smartcase       = true
vim.o.smartindent     = true
vim.o.smarttab        = false

-- { VISUAL-UI }-----------------------------------------------------------

vim.o.termguicolors   = true
vim.o.number          = true
vim.o.showtabline     = 2
vim.o.colorcolumn     = 79
vim.o.cursorline      = true
vim.o.scroll          = 5
vim.o.wrap            = false
vim.o.scrolloff       = 7
-- vim.o.winwidth        = 84
vim.o.showmode        = false
vim.o.signcolumn      = "no"
vim.o.equalalways     = true
vim.o.splitbelow      = true
vim.o.splitright      = true

-- TODO: config tabline
-- set tabline=!%{getcwd()->fnamemodify(":~")}

-- { NERDTREE CONFIG }----------------------------------------------------------

--[[
if pcall(vim.o:get("NERDTreeShowHidden")) then
    vim.o.NERDTreeShowHidden = 1
    vim.o.NERDTreeCaseSensitiveSort = 1
    vim.o.NERDTreeHijackNetrw = 1
    -- if #{vim.o.wildignore} >= 0 then vim.o.NERDTreeIgnore = vim.o.wildignore end
end
-- ]]

-- { NEOVIM SPECIFIC GLOBAL OPTS }----------------------------------------------

if vim.v.progname == "nvim" then
    vim.o.inccommand = "split"   -- preview buffer for `:substitute`
    vim.o.laststatus = 2
end

