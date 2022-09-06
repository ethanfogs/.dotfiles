pcall(require, "rc.plugin")
pcall(require, "rc.opt")
pcall(require, "rc.keymap")
pcall(require, "rc.autocmd")
pcall(require, "rc.funcs")

-------------------------------------------------------------------------------

pcall(require, "plugin.icons")
pcall(require, "plugin.lsp") -- this sources lua/plugin/lsp/init.lua
pcall(require, "plugin.telescope")
pcall(require, "plugin.treesitter")
pcall(require, "plugin.cmp")
pcall(require, "plugin.autopairs")
pcall(require, "plugin.comment")
pcall(require, "plugin.nvim-tree")
pcall(require, "plugin.statuslines")
pcall(require, "plugin.indentline")
pcall(require, "plugin.toggleterm")
pcall(require, "plugin.scratchbuf")

-------------------------------------------------------------------------------

local favColorSchemes = {
  "focuspoint",
  "materialbox",
  "solarized8_high",
}

vim.cmd("colorscheme " .. favColorSchemes[math.random(#favColorSchemes)])
