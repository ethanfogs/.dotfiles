require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.plugin")

-------------------------------------------------------------------------------

require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")
require("plugin.treesitter")
require("plugin.treesitter-context")

require("plugin.cmp")

require("plugin.luasnip")

--require("plugin.indentline")
--require("plugin.bufferline")
require("plugin.lualine")
--require("plugin.winbar")
require("plugin.toggleterm")

require("plugin.icons")
require("plugin.nvim-webdev-icons")
-- require("plugin.gitsigns")

require('plugin.startify')

require("plugin.nvim-tree")
--require("plugin.spectre")
--require("plugin.whichkey")

-------------------------------------------------------------------------------

vim.cmd('colorscheme solarized8_flat')
