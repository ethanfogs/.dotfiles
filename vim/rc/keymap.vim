"NORMAL-MODE ==================================================================
noremap Y yg$
noremap U <C-r>

nnoremap <BS> <C-o>
nnoremap <S-BS> <C-i>
noremap s <Nop>
noremap H g0
noremap L g$
noremap S %
noremap Q <C-v>
noremap !! @:

noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>

noremap -        <Cmd>resize +2<CR>
noremap _        <Cmd>resize -2<CR>
noremap <Bslash> <Cmd>vertical resize +4<CR>
noremap <Bar>    <Cmd>vertical resize -4<CR>

nmap , z
noremap ,, za
nnoremap ,<Space> zA

noremap !! <Cmd>execute histget('cmd', -1)<CR>

noremap <nowait> # <Cmd>set relativenumber!<CR>
noremap <nowait> ? <Cmd>set hlsearch!<CR>

"[NORMAL]-MODE ===============================================================

nnoremap Y y$
nnoremap <BS> <C-^>

nnoremap n nzz
nnoremap N Nzz

noremap <Space>/ <Cmd>let @/=""<CR>
noremap <Space>T <Cmd>vsplit\|terminal<CR>

noremap <Tab>n <Cmd>tabnew<CR>
noremap <Tab>j <Cmd>tabprevious<CR>
noremap <Tab>k <Cmd>tabnext<CR>
noremap <Tab>x <Cmd>tabclose<CR>

"[NVO]-MODE ==================================================================
nnoremap <Space>w <Cmd>write<CR>
nnoremap <Space>/ <Cmd>let @/=""<CR>
nnoremap <Space>T <Cmd>split\|terminal<CR>i
nnoremap <Space>e <Cmd>Lexplore<CR>

map <Space> <C-w>
noremap <Space>w <Cmd>write<CR>

noremap , z
noremap ,, za
noremap <Space>, zA

onoremap <nowait> <Space> <C-[>
vnoremap <nowait> <Space> <C-[>

onoremap ic i{|vnoremap ic i{
onoremap ac a{|vnoremap ac a{
onoremap ia i<|vnoremap ia i<
onoremap aa a<|vnoremap aa a<
onoremap iq i"|vnoremap iq i"
onoremap aq a"|vnoremap aq a"

"[IC]-MODE ===================================================================
noremap! jj <C-c>

nnoremap <silent><Space>t <Cmd>vsplit\|terminal<CR>
tnoremap <Esc> <C-BSlash><C-n>
tnoremap jj <C-BSlash><C-n>

noremap <Space>e <Cmd>Lexplore<CR>
