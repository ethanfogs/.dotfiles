vim.cmd('source $HOME/.vim/vimrc')

require("plugin.icons")
require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")
require("plugin.treesitter")
require("plugin.cmp")
require("plugin.autopairs")
require("plugin.comment")
require("plugin.nvim-tree")
require("plugin.statuslines")
require("plugin.indentline")
require("plugin.toggleterm")

function echo(i) print((type(i) == "table") and vim.inspect(i) or i) end

-------------------------------------------------------------------------------

local favColorSchemes = { 'focuspoint', 'materialbox', 'solarized8_high', }
vim.cmd('colorscheme ' .. favColorSchemes[math.random(#favColorSchemes)])
