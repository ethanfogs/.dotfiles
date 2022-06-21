require("rc.opt")
require("rc.keymap")
require("rc.autocmd")
require("rc.plugin")

-------------------------------------------------------------------------------

require("plugin.colors")

require("plugin.lsp") -- this sources lua/plugin/lsp/init.lua
require("plugin.telescope")
--require("plugin.treesitter")
--require("plugin.treesitter-context")

--require("plugin.cmp")
--require("plugin.nvim-cmp")

--require("plugin.luasnip")

--require("plugin.indentline")
--require("plugin.bufferline")
--require("plugin.lualine")
--require("plugin.winbar")
--require("plugin.toggleterm")

--require("plugin.nvim-webdev-icons")
--require("plugin.icons")

--require("plugin.nvim-tree")
--require("plugin.spectre")
--require("plugin.whichkey")

-------------------------------------------------------------------------------

-- local augroups_to_rm = { 'matchparen', 'zip', 'gzip', 'tar', }
-- for _, augroup_to_rm in ipairs(augroups_to_rm) do
--     pcall(vim.api.nvim_del_augroup_by_name, augroup_to_rm)
-- end

-------------------------------------------------------------------------------

local randomIdx = (math.floor(math.random() * 100) % #vim.g.Colors.favorite) + 1

vim.cmd('colorscheme ' .. vim.g.Colors.favorite[randomIdx])
