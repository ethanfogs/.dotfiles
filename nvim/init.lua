vim.cmd('source ~/.vim/vimrc')

-------------------------------------------------------------------------------

local plugin_configs = {
  "plugin.bufferline",
  "plugin.cmp",
  "plugin.dashboard",
  "plugin.icons",
  "plugin.illuminate",
  "plugin.indentline",
  "plugin.lsp",
  "plugin.lualine",
  "plugin.telescope",
  "plugin.treesitter",
  "plugin.web_devicons",
}

for _, file in pairs(plugin_configs) do
  if (not pcall(require, file)) then print("{init.lua} [import failed]", file) end
end

-------------------------------------------------------------------------------

function _G.echo(input) print(vim.inspect(input)) end
