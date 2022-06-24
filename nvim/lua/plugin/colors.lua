-- vim.cmd([[ source $XDG_CONFIG_HOME/vim/after/plugin/Colors.vim ]])

local Colors = {}
Colors.current = vim.fn.execute('colorscheme')
Colors.__files = vim.fn.globpath(vim.o.runtimepath, 'colors/**', false, true)

Colors.all = vim.fn.map(Colors.__files, 'fnamemodify(v:val, ":t:r")')

Colors.favorite = {
    'atom', 'ayu', 'default', 'focuspoint', 'happy_hacking', 'hybrid_material',
    'molokai', 'oceanic_material', 'solarized8_flat', 'solarized8_high'
}

Colors.set = function(arg, group)
    local group = group == nil and 'favorite' or group

    local arg = arg
    if type(arg) == 'number' then

        local indexes = {}
        for i,color in ipairs(Colors[group]) do
            indexes[color] = i
        end
        local curr_cs_idx = indexes[Colors.current]
        local new_cs_idx = (curr_cs_idx + arg) % Colors[group]

    end
    vim.cmd('colorscheme ' .. arg)
end

-------------------------------------------------------------------------------

local Hoes = {}
function Hoes:ShouldIFuck()
    local should_fuck = math.floor((math.random() * 100) % 2) == 0 and true or false
    local _funcref = should_fuck and pcall(os.execute, 'open ~/doc/ig/edit_020.mp4') or pcall(print, 'BET GET BACK TO WORK, LIL BWOA!')
    pcall(funcref)
end
