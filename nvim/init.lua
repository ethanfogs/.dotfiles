require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.plugin")

-------------------------------------------------------------------------------

require("plugin.icons")
require("plugin.gitsigns")
require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")
require("plugin.treesitter")
require("plugin.cmp")
require("plugin.autopairs")
require("plugin.comment")
require("plugin.nvim-tree")
require("plugin.lualine")
require("plugin.bufferline")
require("plugin.indentline")
require("plugin.toggleterm")
require("plugin.scratchbuf")

-------------------------------------------------------------------------------

local favColorSchemes = { 'focuspoint', 'materialbox', 'solarized8_high', }
vim.cmd('colorscheme ' .. favColorSchemes[math.random(#favColorSchemes)])
