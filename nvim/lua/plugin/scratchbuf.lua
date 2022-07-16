ScratchBuf = {
    dir = os.getenv('HOME') ..'/.local/share/'.. vim.v.progname ..'/scratchbuf'
}

os.execute('mkdir -p ' .. ScratchBuf.dir)

ScratchBuf.ftype2fextn = {
    markdown        = 'md',
    javascript      = 'js',
    javascriptreact = 'jsx',
    rust            = 'rs',
    typescript      = 'ts',
    typescriptreact = 'tsx',
}

function ScratchBuf:tempname() return self.dir .. '/' .. os.time() end

function ScratchBuf:new(fname, ftype)
    fname = ((fname ~= nil) and fname or os.time())
    ftype = ((ftype ~= nil) and ftype or vim.fn.input('FILETYPE: ', '', 'filetype'))
    ftype = (self.ftype2fextn[ftype] ~= nil) and self.ftype2fextn[ftype] or ftype
    vim.cmd('new ' .. self.dir .. '/' .. fname .. ((#ftype > 0) and '.' .. ftype or ''))
end
