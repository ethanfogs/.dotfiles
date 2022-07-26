local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NORMAL-MODE:BASEKEYS
set_keymap("n", "U", "<C-r>", opts)
set_keymap("n", "Y", "y$", opts)
set_keymap("n", "V", "V$", opts)

-- [NORMAL,VISUAL,SELECT]-MODE
set_keymap("", "H", "0", opts)
set_keymap("", "L", "$", opts)
set_keymap("", "S", "%", opts)
set_keymap("", "Q", "<C-v>", opts)
set_keymap("", "n", "<Cmd>silent! normal! nzz<CR>", opts)
set_keymap("", "N", "<Cmd>silent! normal! Nzz<CR>", opts)
set_keymap("", ",", "za", { noremap = true, nowait = true })
set_keymap("", "^", "<C-^>", opts)
set_keymap("", "-", "<C-w>2+", opts)
set_keymap("", "_", "<C-w>2-", opts)
set_keymap("", "!!", "@:", opts)
set_keymap("", "<BS>", "<C-o>", opts)
set_keymap("", "<S-BS>", "<C-i>", opts)
set_keymap("", "<Bar>", "<C-w>4<", { noremap = true, nowait = true })
set_keymap("", "<BSlash>", "<C-w>4>", { noremap = true, nowait = true })
set_keymap("", "<C-j>", "5<C-e>", opts)
set_keymap("", "<C-k>", "5<C-y>", opts)

-- NORMAL-MODE:LEADER-KEY::<Space> //(buf nav)
set_keymap("", "<Space>", "<C-w>", opts)
set_keymap("", "<Space>t", "<Cmd>ToggleTerm<CR>", opts)
set_keymap("", "<Space>T", "<Cmd>vert split|terminal<CR>i", opts)
set_keymap("", "<Space>V", "<Cmd>vertical new<CR>", opts)
set_keymap("", "<Space>w", "<Cmd>write<CR>", opts)
set_keymap("", "<Space>/", "<Cmd>let @/=''<CR>", opts)
set_keymap("", "<Space>,", "zA", opts)

-- NORMAL-MODE:LEADER-KEY::<Tab> //(tab nav)
set_keymap("", "<Tab>n", "<Cmd>tabnew<CR>", opts)
set_keymap("", "<Tab>c", "<Cmd>tabnew<CR>", opts)
set_keymap("", "<Tab>j", "<Cmd>tabprevious<CR>", opts)
set_keymap("", "<Tab>k", "<Cmd>tabnext<CR>", opts)
set_keymap("", "<Tab><Tab>", "<Cmd>tabnext<CR>", opts)
set_keymap("", "<S-Tab>", "<Cmd>tabprevious<CR>", opts)
set_keymap("", "<Tab>x", "<Cmd>tabclose<CR>", opts)

-- VISUAL-MODE
set_keymap("v", "<Space>", "<C-[>", opts)

-- OPERATOR-PENDING-MODE //`<Space>` TO CANCEL OP-PENDING STATE
set_keymap("o", "<Space>", "<C-[>", opts)
set_keymap("o", "iq", 'i"', opts)
set_keymap("o", "aq", 'a"', opts)
set_keymap("o", "ic", 'i{', opts)
set_keymap("o", "ac", 'a{', opts)

-- [INSERT,CMDLINE]-MODE
set_keymap("!", "jj", "<C-c>", opts)

-- TERMINAL-MODE
set_keymap("t", "<Esc><Esc>", "<C-BSlash><C-n>", opts)
set_keymap("t", "jj", "<C-BSlash><C-n>", opts)

-- GIT-PLUGIN KEYMAPS
set_keymap("", "gs", "<Cmd>G<CR>", opts)

-- NVIM-TREE (File Browser) PLUGIN KEYMAPS
set_keymap("", "<Space>e", "<Cmd>NvimTreeToggle<CR>", opts)
