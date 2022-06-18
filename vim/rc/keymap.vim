"[NORMAL,VISUAL,SELECT]-MODE
noremap H 0
noremap L $
noremap S %
noremap Q <C-v>
noremap n <Cmd>silent! normal! nzz<CR>
noremap N <Cmd>silent! normal! Nzz<CR>
noremap , za
noremap ? <Cmd>set hlsearch!<CR>
noremap # <Cmd>set relativenumber!<CR>
noremap ^ <C-^>
noremap - <C-w>2+
noremap _ <C-w>2-
noremap !! @:
noremap <BS> <C-o>
noremap <S-BS> <C-i>
noremap <C-BS> ^
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>
noremap <silent><C-b> <Cmd>NERDTreeToggleVCS<CR>
nnoremap <C-z> <C-w>v

"NORMAL-MODE:BASEKEYS
nnoremap U <C-r>
nnoremap Y y$
nnoremap V V$

noremap <nowait><Bar> <C-w>4<
noremap <nowait><BSlash> <C-w>4>

noremap <C-Up> <C-w>3+
noremap <C-Down> <C-w>3-
noremap <C-Right> <C-w>4>
noremap <C-Left> <C-w>4<

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"NORMAL-MODE:LEADER-KEY::<Space> //(buf nav)
noremap <Space> <C-w>
noremap <Space>t <Cmd>split\|terminal<CR>i
noremap <Space>w <Cmd>write<CR>
noremap <Space>; @:
noremap <Space>/ <Cmd>let @/=''<CR>
noremap <Space>, zA
noremap <Space>b <Cmd>NERDTreeToggleVCS<CR>
noremap <Space>m <Cmd>make<CR>

"NORMAL-MODE:LEADER-KEY::<Tab> //(tab nav)
noremap <Tab>n <Cmd>tabnew<CR>
noremap <Tab>c <Cmd>tabnew<CR>

noremap <Tab>j <Cmd>tabprevious<CR>
noremap <Tab>k <Cmd>tabnext<CR>
    noremap <Tab><Tab> <Cmd>tabnext<CR>
    noremap <S-Tab> <Cmd>tabprevious<CR>

noremap <Tab>t <Cmd>tabnew\|terminal<CR>i
noremap <Tab>x <Cmd>tabclose<CR>

"NORMAL-MODE:LEADER-KEY::q //(quickfix nav)
noremap qh <Cmd>cprevious<CR>
noremap ql <Cmd>cnext<CR>
noremap qo <Cmd>copen<CR>
noremap qw <Cmd>cwindow<CR>
noremap qx <Cmd>cclose<CR>

"GIT-PLUGIN KEYMAPS
noremap gs <Cmd>Git<CR>
noremap gb <Cmd>Git branch<CR>
noremap gc <Cmd>Git commit<CR>
noremap gd <Cmd>Git commit<CR>

"VISUAL-MODE
vnoremap <Space> <C-[>

"OPERATOR-PENDING-MODE //`<Space>` TO CANCEL OP-PENDING STATE
onoremap <Space> <C-[>

"[INSERT,CMDLINE]-MODE
noremap! jj <C-c>
noremap! () ()<Left>|noremap! )( ()<Left>
noremap! <> <><Left>|noremap! >< <><Left>
noremap! [] []<Left>|noremap! ][ []<Left>
noremap! {} {}<Left>|noremap! }{ {}<Left>
noremap! '' ''<Left>|noremap! "" ""<Left>

"INSERT-MODE
inoremap ** **<Left>
inoremap <C-f> <C-x><C-f>
inoremap <C-v> <C-x><C-v>
inoremap <C-n> <C-x><C-n>
inoremap <C-p> <C-x><C-p>

"TERMINAL-MODE
tnoremap <Esc> <C-BSlash><C-n>
tnoremap jj <C-BSlash><C-n>
tnoremap <C-x> <C-BSlash><C-n>i<C-c><C-d><>:bd!<CR>