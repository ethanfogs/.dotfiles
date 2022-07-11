"[NORMAL,VISUAL,SELECT]-MODE
noremap H 0
noremap L $
noremap S %
noremap Q <C-v>
noremap n <Cmd>silent! normal! nzz<CR>
noremap N <Cmd>silent! normal! Nzz<CR>
noremap , za
noremap ^ <C-^>
noremap - <C-w>2+
noremap _ <C-w>2-
noremap !! @:
noremap <BS> <C-o>
noremap <S-BS> <C-i>
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>
noremap <nowait><Bar> <C-w>4<
noremap <nowait><BSlash> <C-w>4>

"NORMAL-MODE:BASEKEYS
nnoremap U <C-r>
nnoremap Y y$
nnoremap V V$

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
noremap <Tab>x <Cmd>tabclose<CR>

"GIT-PLUGIN KEYMAPS
"noremap gs <Cmd>Git<CR>
"noremap gb <Cmd>Git branch<CR>
"noremap gc <Cmd>Git commit<CR>
"noremap gd <Cmd>Git commit<CR>

"VISUAL-MODE
vnoremap <Space> <C-[>

"OPERATOR-PENDING-MODE
onoremap <Space> <C-[>
noremap iq i"
noremap aq a"

"[INSERT,CMDLINE]-MODE
noremap! jj <C-c>
noremap! () ()<Left>|noremap! )( ()<Left>
noremap! <> <><Left>|noremap! >< <><Left>
noremap! [] []<Left>|noremap! ][ []<Left>
noremap! {} {}<Left>|noremap! }{ {}<Left>
noremap! '' ''<Left>|noremap! "" ""<Left>

"TERMINAL-MODE
tnoremap <Esc> <C-BSlash><C-n>
tnoremap jj <C-BSlash><C-n>

"FILE-BROWSER PLUGIN KEYMAPS
noremap <Space>e <Cmd>Lexplore<CR>
