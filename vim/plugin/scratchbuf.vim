" let scratchbuf = {} let scratchbuf = s:
let scratchbuf = {}
let scratchbuf.home = $HOME . '/.cache/' . v:progname . '/scratchbuf'
call mkdir(scratchbuf.home, 'p')

let scratchbuf.buffers = []

" ----------------------------------------------------------------------------

function! scratchbuf.fmt_ftype(ftype=v:null) dict abort

  let l:ftype = get({
    \ 'markdown':         'md',
    \ 'javascript':       'js',
    \ 'javascriptreact':  'jsx',
    \ 'python':           'py',
    \ 'rust':             'rs',
    \ 'typescript':       'ts',
    \ 'typescriptcommon': 'tsc',
    \ 'typescriptreact':  'tsx',
  \}, a:ftype, a:ftype)

  return empty(l:ftype) ? '' : '.' . l:ftype
endfunction 

" ----------------------------------------------------------------------------

let scratchbuf.exec = {}
let scratchbuf.exec.vim = {file -> execute('source ' . file)}
let scratchbuf.exec.lua  = scratchbuf.exec.vim

let scratchbuf.exec.sh   = {file -> execute('!' . (executable(file) ? '' : '. ') . file)}
let scratchbuf.exec.bash = scratchbuf.exec.sh
let scratchbuf.exec.zsh  = scratchbuf.exec.sh

let scratchbuf.exec.js  = {file -> execute('!node ' . file)}

" ----------------------------------------------------------------------------

let scratchbuf.autocmds = {}

" function! s:autocmds.BufWritePost(buf=v:null) dict abort
"   return s:ft.exec[&l:filetype](a:buf)
" endfunction!

" ----------------------------------------------------------------------------

" function! s:autocmds.on_attach() dict abort
"   autocmd! BufWritePost <buffer=0> call self.fn.ftype.exec[&filetype]()
" endfunction!

" ----------------------------------------------------------------------------

function! scratchbuf.new(name=strftime('%m%d%y_%H%M%S'), ftype=input('FILETYPE: ', '', 'filetype')) dict abort
  let l:ftype = self.fmt_ftype(empty(a:ftype) ? fnamemodify(a:name, ':e') : a:ftype)
  let l:fullpath = self.home . '/' . a:name . l:ftype

  silent execute 'new ' . l:fullpath

  " let l:buf_info = getbufinfo(bufnr(l:fullpath))[0]
  " let l:buf_info.windows = map(l:buf_info.windows, 'getwininfo(v:val)')
  " let self.buffers = add(self.buffers, l:buf_info)
  " call setbufvar(bufnr(l:fullpath), 'scratchbuf_nr', bufnr(l:fullpath))
endfunction

" ----------------------------------------------------------------------------

command! -nargs=* ScratchBuf call scratchbuf.new(<f-args>)
