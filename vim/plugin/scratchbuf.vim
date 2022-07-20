let ScratchBuf = {}
let ScratchBuf.dir = $HOME . '/.local/share/' . v:progname . '/scratchbuf'

call mkdir(ScratchBuf.dir, 'p')

let ScratchBuf.ftype2fextn = #{
    \ markdown: 'md',
    \ javascript: 'js',
    \ javascriptreact: 'jsx',
    \ python: 'py',
    \ rust: 'rs',
    \ typescript: 'ts',
    \ typescriptreact: 'tsx',
\}

function ScratchBuf.new(fname=strftime('%m-%d-%y_%H-%M-%S'), ftype=input('FILETYPE: ', '', 'filetype')) dict
    let l:ftype = empty(a:ftype) ? input('FILETYPE: ', '', 'filetype') : a:ftype
    let l:ftype = has_key(self.ftype2fextn, l:ftype) ? self.ftype2fextn[l:ftype] : l:ftype
    call execute('new ' . self.dir . '/' . a:fname . (empty(l:ftype) ? '' : '.' . l:ftype))
endfunction
