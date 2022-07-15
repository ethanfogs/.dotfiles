let Scratch = {}
let Scratch.dir = $HOME . "/.local/share/" . v:progname . "/scratch"

call system('mkdir -p ' . Scratch.dir)

let Scratch.ftype2fextn = {
    \ "markdown":         "md",
    \ "javascript":       "js",
    \ "javascriptreact":  "jsx",
    \ "rust":             "rs",
    \ "typescript":       "ts",
    \ "typescriptcommon": "tsc",
    \ "typescriptreact":  "tsx",
\}

function! Scratch.tempname() dict
    return self.dir . "/" . strftime('%m-%d-%y_%H-%M-%S')
endfunction

function! Scratch.new(fname="", ftype=input("FILETYPE: ", "", "filetype")) dict
    let l:fname = empty(a:fname) ? self.tempname() : a:fname
    let l:ftype = has_key(self.ftype2fextn, a:ftype) ? self.ftype2fextn[a:ftype] : a:ftype
    let l:full_fname = l:fname . (empty(l:ftype) ? '' : '.' . l:ftype)

    new `=l:full_fname`
endfunction
