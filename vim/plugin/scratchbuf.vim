let ScratchBuf = {}
let ScratchBuf.dir = $HOME . '/.cache/' . v:progname . '/scratchbuf'

call mkdir(ScratchBuf.dir, 'p')

let ScratchBuf.ftype2fextn = #{
    \ markdown:        'md',
    \ javascript:      'js',
    \ javascriptreact: 'jsx',
    \ python:          'py',
    \ rust:            'rs',
    \ typescript:      'ts',
    \ typescriptreact: 'tsx',
\}

function ScratchBuf.new(fname=strftime('%m-%d-%y_%H-%M-%S'), ftype=input('FILETYPE: ', '', 'filetype')) dict
    let l:ftype = has_key(self.ftype2fextn, a:ftype) ? self.ftype2fextn[a:ftype] : a:ftype
    call execute('new ' . self.dir . '/' . a:fname . (empty(l:ftype) ? '' : '.' . l:ftype))
endfunction

command! -nargs=* ScratchBuf call ScratchBuf.new(<f-args>)
