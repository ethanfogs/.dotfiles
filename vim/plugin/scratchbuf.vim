let scratch_buf = {
  \ 'dir': $HOME . '/.cache/' . v:progname . '/scratchbuf'
\}

call mkdir(scratch_buf.dir, 'p')

let scratch_buf.ftype2fextn = {
  \ 'markdown':        'md',
  \ 'javascript':      'js',
  \ 'javascriptreact': 'jsx',
  \ 'python':          'py',
  \ 'rust':            'rs',
  \ 'typescript':      'ts',
  \ 'typescriptreact': 'tsx',
\}

function scratch_buf.new(...) dict
  let fname = get(a:, 1, strftime('%m-%d-%y_%H-%M-%S'))
  let ftype = get(a:, 2, input('FILETYPE: ', '', 'filetype'))
  let ftype = has_key(self.ftype2fextn, ftype) ? self.ftype2fextn[ftype] : ftype
  call execute('new ' . self.dir . '/' . fname . (empty(ftype) ? '' : '.' . ftype))
endfunction

command! -nargs=* ScratchBuf call scratch_buf.new(<f-args>)
