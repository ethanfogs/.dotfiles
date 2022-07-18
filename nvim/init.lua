require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.plugin")
require("rc.funcs")

-------------------------------------------------------------------------------

require("plugin.icons")

require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")

require("plugin.cmp")

require("plugin.treesitter")

require("plugin.nvim-tree")
require("plugin.lualine")
require("plugin.bufferline")

require("plugin.toggleterm")

require("plugin.scratchbuf")

-------------------------------------------------------------------------------

local favColorSchemes = { 'focuspoint', 'materialbox', 'solarized8_high', }

vim.cmd('colorscheme ' .. favColorSchemes[math.random(#favColorSchemes)])
