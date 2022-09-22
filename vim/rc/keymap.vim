" [OP-PENDING,NORMAL,VISUAL]-MODE ============================================

noremap H 0
noremap L $
noremap S %
noremap U <Cmd>redo<CR>
noremap Q <C-v>

" `s` keymap prefix does nothing
noremap s <Nop>

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

"[NORMAL]-MODE ===============================================================

nnoremap Y y$

" move (back|for)wards between cursor positions
nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

" keymap prefix alias for window keymaps
nmap <Space> <C-w>

nnoremap <Space>w <Cmd>write<CR>
nnoremap <Space>/ <Cmd>let @/=""<CR>
nnoremap <Space>t <Cmd>split\|terminal<CR>i
nnoremap <Space>e <Cmd>Lexplore<CR>

" tabs
nnoremap <Tab>n     <Cmd>tabnew<CR>
nnoremap <Tab>j     <Cmd>tabprevious<CR>
nnoremap <Tab>k     <Cmd>tabnext<CR>
nnoremap <Tab><Tab> <Cmd>tabprevious<CR>
nnoremap <Tab>q     <Cmd>tabclose<CR>
nnoremap <Tab>t     <Cmd>tabnew\|terminal<CR>

" [OP-PENDING,VISUAL]-MODE ===================================================

" `<Space>` cancels op-pending state
onoremap <nowait> <Space> <Esc>
vnoremap <nowait> <Space> <Esc>

" vim-motion aliases
onoremap ic i{|vnoremap ic i{
onoremap ac a{|vnoremap ac a{
onoremap ia i<|vnoremap ia i<
onoremap aa a<|vnoremap aa a<
onoremap iq i"|vnoremap iq i"
onoremap aq a"|vnoremap aq a"

" [INSERT]-MODE ==============================================================

inoremap jj <Esc>

" [COMMAND-LINE]-MODE ========================================================

" using `<C-c>` instead of `<Esc>` - `<Esc>` executes line before exiting cmd-mode
cnoremap jj <C-c>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" [TERMINAL]-MODE ============================================================

tnoremap <Esc> <C-BSlash><C-n>
tmap jj <Esc>
