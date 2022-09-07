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

noremap - <C-w>2+
noremap _ <C-w>2-
noremap <Bar> <C-w>4<
noremap <BSlash> <C-w>4>

noremap <Space>/ <Cmd>let @/=""<CR>
noremap <Space>T <Cmd>vsplit\|terminal<CR>

noremap <Tab>n <Cmd>tabnew<CR>
noremap <Tab>j <Cmd>tabprevious<CR>
noremap <Tab>k <Cmd>tabnext<CR>
noremap <Tab>x <Cmd>tabclose<CR>

"[NVO]-MODE ==================================================================

map <Space> <C-w>
noremap <Space>w <Cmd>write<CR>

noremap , z
noremap ,, za
noremap <Space>, zA

onoremap <nowait> <Space> <Esc>
vnoremap <nowait> <Space> <Esc>

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
