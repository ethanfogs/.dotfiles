require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.abbrev")
require("rc.plugin")

-------------------------------------------------------------------------------

require("plugin.lspconfig")
require("plugin.telescope")
require("plugin.nvim-cmp")

-------------------------------------------------------------------------------

vim.cmd('colorscheme atom')
