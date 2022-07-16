require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.plugin")
require("rc.funcs")

-------------------------------------------------------------------------------

require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")
require("plugin.treesitter")
require("plugin.treesitter-context")

require("plugin.cmp")
require("plugin.luasnip")

require("plugin.icons")
require("plugin.nvim-webdev-icons")
require("plugin.nvim-tree")
require("plugin.lualine")
require("plugin.toggleterm")

require("plugin.scratchbuf")

-------------------------------------------------------------------------------

local favColorSchemes = {
    'atom', 'ayu', 'default', 'focuspoint', 'materialbox', 'molokai',
    'molokayo', 'OceanicNext', 'solarized8_flat', 'solarized8_high',
}

vim.cmd('colorscheme ' .. favColorSchemes[math.random(#favColorSchemes)])
