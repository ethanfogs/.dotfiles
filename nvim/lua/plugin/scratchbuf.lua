scratch_buf = {
    dir = os.getenv('HOME') .. '/.local/share/' .. vim.v.progname .. '/scratchbuf'
}

vim.fn.mkdir(scratch_buf.dir, 'p')

scratch_buf.ftype2fextn = {
    markdown        = 'md',
    javascript      = 'js',
    javascriptreact = 'jsx',
    python          = 'py',
    rust            = 'rs',
    typescript      = 'ts',
    typescriptreact = 'tsx',
}

function scratch_buf:tempname() return self.dir .. '/' .. os.time() end

function scratch_buf:new(fname, ftype)
    fname = ((fname ~= nil) and fname or os.time())
    ftype = ((ftype ~= nil) and ftype or vim.fn.input('FILETYPE: ', '', 'filetype'))
    ftype = (self.ftype2fextn[ftype] ~= nil) and self.ftype2fextn[ftype] or ftype
    vim.cmd('new ' .. self.dir .. '/' .. fname .. ((#ftype > 0) and '.' .. ftype or ''))
end

vim.api.nvim_create_user_command("ScratchBuf", "lua scratch_buf:new()", {})
