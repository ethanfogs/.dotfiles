source $HOME/.vim/rc/opt.vim
source $HOME/.vim/rc/keymap.vim
source $HOME/.vim/rc/autocmd.vim
source $HOME/.vim/rc/plugin.vim

if (v:progname == 'vim')
    colorscheme industry
    finish
endif

lua << EOF

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

-------------------------------------------------------------------------------

local favColorSchemes = { 'focuspoint', 'materialbox', 'solarized8_high', }
vim.cmd('colorscheme ' .. favColorSchemes[math.random(#favColorSchemes)])

EOF
