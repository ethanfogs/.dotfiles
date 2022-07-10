Scratch = {}
Scratch.dir = os.getenv('XDG_DATA_HOME') .. '/scratch'

os.execute('mkdir -p ' .. Scratch.dir)

function Scratch:new(fname, ftype, opts) --opts: [bang, tab, [vert, botright, topleft]]
    local fname = (fname ~= nil) and fname or vim.fn.strftime("%Y%m%d_%H%m%S")
    local fvers = #vim.fn.globpath(self.dir, "*" .. fname .. "**", false, true) + 1

    local ftype = (ftype ~= nil) and ftype or vim.fn.input("FILETYPE: ", "", "filetype")
    local ftype = (ftype2fextn[ftype] == nil) and ftype or ftype2fextn[ftype]

    local full_path = fname .. '_' .. fvers .. ((#ftype > 0) and '.' .. ftype or '')

    local win_cmd = 'new'

    local opts = (opts == nil) and {} or opts
    if (opts.vertical == true) then win_cmd = 'vertical ' .. win_cmd end
    if (opts.botright == true) then win_cmd = 'botright ' .. win_cmd end
    if (opts.topleft  == true) then win_cmd = 'topleft  ' .. win_cmd end
    if (opts.tab      == true) then win_cmd = 'tabnew | ' .. win_cmd end
    if (opts.bang     == true) then win_cmd = win_cmd .. '! '        end

    vim.cmd(win_cmd .. ' ' .. full_path)
end

ftype2fextn = {
    markdown = 'md',
    javascript = 'js',
    javascriptreact = 'jsx',
    python = 'py',
    rust = 'rs',
    typescript = 'ts',
    typescriptcommon = 'tsc',
    typescriptreact = 'tsx',
    viminfo = 'txt',
}

vim.cmd('command! -nargs=* ScratchBuf lua Scratch:new(<f-args>)')
