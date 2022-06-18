local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- [NORMAL,VISUAL,SELECT]-MODE
set_keymap("", "H",      "0", opts)
set_keymap("", "L",      "$", opts)
set_keymap("", "S",      "%", opts)
set_keymap("", "Q",      "<C-v>", opts)
set_keymap("", "n",      "<Cmd>silent! normal! nzz<CR>", opts)
set_keymap("", "N",      "<Cmd>silent! normal! Nzz<CR>", opts)
set_keymap("", ",",      "za", opts)
set_keymap("", "?",      "<Cmd>set hlsearch!<CR>", opts)
set_keymap("", "#",      "<Cmd>set relativenumber!<CR>", opts)
set_keymap("", "^",      "<C-^>", opts)
set_keymap("", "-",      "<C-w>2+", opts)
set_keymap("", "_",      "<C-w>2-", opts)
set_keymap("", "!!",     "@:", opts)
set_keymap("", "<BS>",   "<C-o>", opts)
set_keymap("", "<S-BS>", "<C-i>", opts)
set_keymap("", "<C-BS>", "^", opts)
set_keymap("", "<C-k>",  "5<C-y>", opts)
set_keymap("", "<C-j>",  "5<C-e>", opts)
set_keymap("", "<C-z>",  "<C-w>v", opts)
set_keymap("", "<Bar>", "<C-w>4<", { noremap = true, nowait = true })
set_keymap("", "<BSlash>", "<C-w>4<", { noremap = true, nowait = true })

set_keymap("", "<C-b>",  "<Cmd>NERDTreeToggleVCS<CR>", {
	noremap = true, silent = true
})

set_keymap("", "<C-Up>", "<C-w>3+", opts)
set_keymap("", "<C-Down>", "<C-w>3-", opts)
set_keymap("", "<C-Right>", "<C-w>4>", opts)
set_keymap("", "<C-Left>", "<C-w>4<", opts)

-- NORMAL-MODE:BASEKEYS
set_keymap("n", "U", "<C-r>", opts)
set_keymap("n", "Y", "y$", opts)
set_keymap("n", "V", "V$", opts)

set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

-- NORMAL-MODE:LEADER-KEY::<Space> //(buf nav)
set_keymap("", "<Space>", "<C-w>", opts)
set_keymap("", "<Space>t", "<Cmd>split|terminal<CR>i", opts)
set_keymap("", "<Space>w", "<Cmd>write<CR>", opts)
set_keymap("", "<Space>;", "@:", opts)
set_keymap("", "<Space>/", "<Cmd>let @/=''<CR>", opts)
set_keymap("", "<Space>,", "zA", opts)
set_keymap("", "<Space>b", "<Cmd>NERDTreeToggleVCS<CR>", opts)
set_keymap("", "<Space>m", "<Cmd>make<CR>", opts)

-- NORMAL-MODE:LEADER-KEY::<Tab> //(tab nav)
set_keymap("", "<Tab>n", "<Cmd>tabnew<CR>", opts)
set_keymap("", "<Tab>c", "<Cmd>tabnew<CR>", opts)

set_keymap("", "<Tab>j", "<Cmd>tabprevious<CR>", opts)
set_keymap("", "<Tab>k", "<Cmd>tabnext<CR>", opts)
set_keymap("", "<Tab><Tab>", "<Cmd>tabnext<CR>", opts)
set_keymap("", "<S-Tab>", "<Cmd>tabprevious<CR>", opts)

set_keymap("", "<Tab>t", "<Cmd>tabnew|terminal<CR>i", opts)
set_keymap("", "<Tab>x", "<Cmd>tabclose<CR>", opts)

-- NORMAL-MODE:LEADER-KEY::q //(quickfix nav)
set_keymap("", "qh", "<Cmd>cprevious<CR>", opts)
set_keymap("", "ql", "<Cmd>cnext<CR>", opts)
set_keymap("", "qo", "<Cmd>copen<CR>", opts)
set_keymap("", "qw", "<Cmd>cwindow<CR>", opts)
set_keymap("", "qx", "<Cmd>cclose<CR>", opts)

-- GIT-PLUGIN KEYMAPS
set_keymap("", "gs", "<Cmd>Git<CR>", opts)
set_keymap("", "gb <Cmd>Git", "branch<CR>", opts)
set_keymap("", "gc <Cmd>Git", "commit<CR>", opts)
set_keymap("", "gd <Cmd>Git", "commit<CR>", opts)

-- VISUAL-MODE
set_keymap("v", "<Space>", "<C-[>", opts)

-- OPERATOR-PENDING-MODE //`<Space>` TO CANCEL OP-PENDING STATE
set_keymap("o", "<Space>", "<C-[>", opts)

-- [INSERT,CMDLINE]-MODE
set_keymap("!", "jj", "<C-c>", opts)
set_keymap("!", "()", "()<Left>", opts)
set_keymap("!", ")(", "()<Left>", opts)
set_keymap("!", "<>", "<><Left>", opts)
set_keymap("!", "><", "<><Left>", opts)
set_keymap("!", "[]", "[]<Left>", opts)
set_keymap("!", "][", "[]<Left>", opts)
set_keymap("!", "{}", "{}<Left>", opts)
set_keymap("!", "}{", "{}<Left>", opts)
set_keymap("!", "''", "''<Left>", opts)
set_keymap("!", '""', '""<Left>', opts)

-- INSERT-MODE
set_keymap("i", "**", "**<Left>", opts)
set_keymap("i", "<C-f>", "<C-x><C-f>", opts)
set_keymap("i", "<C-v>", "<C-x><C-v>", opts)
set_keymap("i", "<C-n>", "<C-x><C-n>", opts)
set_keymap("i", "<C-p>", "<C-x><C-p>", opts)

-- TERMINAL-MODE
set_keymap("t", "<Esc>", "<C-BSlash><C-n>", opts)
set_keymap("t", "jj", "<C-BSlash><C-n>", opts)
