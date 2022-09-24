local rc_files = {
  "rc.opt",
  "rc.keymap",
  "rc.autocmd",
  "rc.funcs",
  "rc.plugin",
}

-------------------------------------------------------------------------------

require("rc.plugin")

local plugin_configs = {
  "plugin.icons",
  "plugin.web_devicons",
  "plugin.gitsigns",
  "plugin.lsp",
  "plugin.telescope",
  "plugin.toggleterm",
  "plugin.treesitter",
  "plugin.cmp",
  "plugin.autopairs",
  "plugin.comment",
  "plugin.nvim-tree",
  "plugin.toggleterm",
  "plugin.lualine",
  "plugin.bufferline",
  "plugin.indentline",
  "plugin.illuminate",
  "plugin.scratchbuf",
}

for _, file in pairs(plugin_configs) do
  if (not pcall(require, file)) then
    print("{" .. vim.fn.expand('%') .. "} [import failed]", file)
  end
end

-------------------------------------------------------------------------------

local colorschemes = {
  "base16-material",
  -- "base16-onedark",
  "base16-solarflare",
  "base16-solarized-dark",
  "base16-da-one-black",
}

vim.cmd('colorscheme ' .. colorschemes[math.random(#colorschemes)])

-------------------------------------------------------------------------------

function _G.echo(input) print(vim.inspect(input)) end
