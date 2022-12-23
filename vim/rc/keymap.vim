"[OP-PENDING,NORMAL,VISUAL]-MODE ---------------------------------------------

noremap H 0
noremap L $
noremap S %

noremap Q <C-v>

noremap s <Nop>

noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>

noremap -        <Cmd>resize +2<CR>
noremap _        <Cmd>resize -2<CR>
noremap <Bslash> <Cmd>vertical resize +4<CR>
noremap <Bar>    <Cmd>vertical resize -4<CR>

noremap !! <Cmd>execute histget('cmd', -1)<CR>

noremap <nowait> # <Cmd>set relativenumber!<CR>
noremap <nowait> ? <Cmd>set hlsearch!<CR>

noremap zz za|noremap <Space>z zA
noremap ,, za|noremap <Space>, zA

"[NORMAL]-MODE ---------------------------------------------------------------

nnoremap Y y$
nnoremap U <C-r>

nnoremap <BS> <C-o>

nnoremap n nzz
nnoremap N Nzz

nmap <Space> <C-w>

nnoremap <Space>/ <Cmd>let @/=""<CR>
nnoremap <Space>T <Cmd>vsplit\|terminal<CR>
nnoremap <Space>e <Cmd>Lexplore<CR>
nnoremap <Space>w <Cmd>write<CR>

noremap <Tab><Tab> <Cmd>tabprevious<CR>
noremap <Tab>j <Cmd>tabprevious<CR>
noremap <Tab>k <Cmd>tabnext<CR>
noremap <Tab>n <Cmd>tabnew<CR>
noremap <Tab>x <Cmd>tabclose<CR>
noremap <Tab>t <Cmd>tabnew\|terminal<CR>
noremap <Tab>s <Cmd>tab split<CR>

"[OP-PENDING,VISUAL]-MODE ---------------------------------------------

onoremap <nowait> <Space> <C-[>
vnoremap <nowait> <Space> <C-[>

onoremap ic i{|vnoremap ic i{
onoremap ac a{|vnoremap ac a{
onoremap ia i<|vnoremap ia i<
onoremap aa a<|vnoremap aa a<
onoremap iq i"|vnoremap iq i"
onoremap aq a"|vnoremap aq a"

"[INSERT]-MODE -------------------------------------------------------------------

inoremap jj <Esc>

"[COMMAND-LINE]-MODE -------------------------------------------------------------------

cnoremap jj <C-c>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"[TERMINAL]-MODE -------------------------------------------------------------------

tnoremap <Esc> <C-BSlash><C-n>
tmap jj <Esc>
