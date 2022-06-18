let ScratchBuf = {}

function ScratchBuf.__new__(fname='', ftype=&filetype) dict
    let l:fname = tempname() .'_'. (empty(a:fname) ? 'NVIM_SCRATCH' : a:fname)
    let l:ftype = empty(a:ftype) ? input('FILETYPE: ', '', 'filetype') : a:ftype
    let l:fullpath = l:fname . (empty(l:ftype) ? '' : '.' . l:ftype)
    
    echo 'NEW BUFFER: ' . l:fullpath
    "execute('new ' . l:fullpath)
endfunction

call ScratchBuf.__new__()

"nnoremap <expr> <Space>N ScratchBuf.__new__()<>
