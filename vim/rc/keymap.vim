"NORMAL-MODE ==================================================================
nnoremap Y yg$
nnoremap U <C-r>

nnoremap <BS> <C-o>
nnoremap <S-BS> <C-i>

map <Space> <C-w>
nnoremap <silent> <Space>w <Cmd>write<CR>

if (&runtimepath =~ ".*/toggleterm")
  nnoremap <silent> <Space>t <Cmd>ToggleTerm<CR>
else
  nnoremap <silent><Space>t <Cmd>vsplit\|terminal<CR>
endif

noremap <silent> <Space>T <Cmd>vsplit\|terminal<CR>

"[NVO]-MODE:LEADER-KEY::<Tab> //(tab nav) ------------------------------------
noremap <silent> <Tab>n <Cmd>tabnew<CR>
noremap <silent> <Tab>j <Cmd>tabprevious<CR>
noremap <silent> <Tab>k <Cmd>tabnext<CR>
noremap <silent> <Tab>x <Cmd>tabclose<CR>

"[NVO]-MODE ==================================================================
noremap s <Nop>
noremap H g0
noremap L g$
noremap S %
noremap Q <C-v>
noremap - <C-w>2+
noremap _ <C-w>2-
noremap !! @:

"[NVO]-MODE::SCROLLING ALIASES -----------------------------------------------
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>

"[NVO]-MODE::WINDOW-RESIZING ALIASES -----------------------------------------

noremap <Bar> <C-w>4<
noremap <BSlash> <C-w>4>

"[NVO]-MODE::VIM-COMMAND ALIASES ---------------------------------------------
noremap <silent><Space>/ <Cmd>let @/=""<CR>

"[NVO]-MODE::FOLDING-OPERATION ALIASES ---------------------------------------

map , z
noremap ,, za
noremap <Space>, zA

omap <nowait><Space> <Esc>
vmap <nowait><Space> <Esc>

"OP-PENDING-MODE::MOTION ALIASES (`i` => `in`, `a` => `around`) ==============

onoremap o ic i{| vnoremap o ic i{
onoremap o ac a{| vnoremap o ac a{
onoremap o ia i<| vnoremap o ia i<
onoremap o aa a<| vnoremap o aa a<
onoremap o iq i"| vnoremap o iq i"
onoremap o aq a"| vnoremap o aq a"

"[IC]-MODE ===================================================================
noremap! jj <C-c>

"TERMINAL-MODE ===============================================================
tnoremap <Esc> <C-BSlash><C-n>
tnoremap jj <C-BSlash><C-n>

"PLUGIN:FILE-BROWSER =========================================================
"
if (&runtimepath =~ ".*/nvim-tree")
  noremap <Space>e <Cmd>NvimTreeToggle<CR>
elseif(&runtimepath =~ ".*/nerdtree")
  noremap <Space>e <Cmd>NERDTreeToggleVCS<CR>
else
  noremap <Space>e <Cmd>Lexplore<CR>
endif

"PLUGIN:GIT ==================================================================

if(&runtimepath =~ ".*fugitive.*")
  noremap <silent> gs <Cmd>Git<CR>
endif
