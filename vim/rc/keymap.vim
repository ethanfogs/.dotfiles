"[OP-PENDING,NORMAL,VISUAL]-MODE ----------------------------------------------

noremap H 0
noremap L $
noremap S %

noremap Q <C-v>

noremap s <Nop>

noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>

noremap <nowait> - <Cmd>resize +2<CR>
noremap <nowait> _ <Cmd>resize -2<CR>
noremap <nowait> + <Cmd>vertical resize +4<CR>
noremap <nowait> = <Cmd>vertical resize -4<CR>

noremap !! <Cmd>execute histget('cmd', -1)<CR>

noremap <nowait> # <Cmd>set relativenumber!<CR>
noremap <nowait> ? <Cmd>set hlsearch!<CR>

noremap zz za|noremap <Space>z zA
noremap ,, za|noremap <Space>, zA

noremap <Left> b
noremap <Right> w

"[NORMAL]-MODE ----------------------------------------------------------------

nnoremap Y y$
nnoremap U <C-r>

nnoremap <BS> <C-^>

nnoremap n nzz
nnoremap N Nzz

nmap <Space> <C-w>

nnoremap <Space>/ <Cmd>let @/=""<CR>
nnoremap <Space>T <Cmd>vsplit\|terminal<CR>
nnoremap <Space>e <Cmd>Lexplore<CR>
nnoremap <Space>w <Cmd>write<CR>

nnoremap <Tab><Tab> <Cmd>tabprevious<CR>
nnoremap <Tab>j <Cmd>tabprevious<CR>
nnoremap <Tab>k <Cmd>tabnext<CR>
nnoremap <Tab>n <Cmd>tabnew<CR>
nnoremap <Tab>x <Cmd>tabclose<CR>
nnoremap <Tab>t <Cmd>tabnew\|terminal<CR>
nnoremap <Tab>s <Cmd>tab split<CR>

nnoremap gr :%s/<C-r>=expand('<cword>')<CR>

"[OP-PENDING,VISUAL]-MODE -----------------------------------------------------

onoremap <nowait> <Space> <C-[>
vnoremap <nowait> <Space> <C-[>

onoremap ia i<|vnoremap ia i<
onoremap aa a<|vnoremap aa a<

onoremap ic i{|vnoremap ic i{
onoremap ac a{|vnoremap ac a{

onoremap iq i"|vnoremap iq i"
onoremap aq a"|vnoremap aq a"

"[INSERT]-MODE ----------------------------------------------------------------

inoremap jj <Esc>

"[COMMAND-LINE]-MODE ----------------------------------------------------------

cnoremap jj <C-c>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"[TERMINAL]-MODE --------------------------------------------------------------

tnoremap <Esc> <C-BSlash><C-n>
tmap jj <Esc>
