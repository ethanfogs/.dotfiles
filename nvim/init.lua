local rc_files = {
  "rc.opt",
  "rc.keymap",
  "rc.autocmd",
  "rc.funcs",
  "rc.plugin",
}

-------------------------------------------------------------------------------

local plugin_configs = {
  "plugin.icons",
  "plugin.web_devicons",
  "plugin.gitsigns",
  "plugin.lsp",
  "plugin.telescope",
  "plugin.treesitter",
  "plugin.cmp",
  "plugin.autopairs",
  "plugin.comment",
  "plugin.nvim-tree",
  "plugin.statuslines",
  "plugin.indentline",
  "plugin.toggleterm",
  "plugin.scratchbuf",
}

for _, file in pairs(vim.tbl_flatten({ rc_files, plugin_configs })) do
  local import_status = pcall(require, file)
  if (not import_status) then print("{init.lua} [import failed]", file) end
end

-------------------------------------------------------------------------------

local favColorSchemes = {
  "focuspoint",
  "materialbox",
  "solarized8_high",
}

vim.cmd("colorscheme " .. favColorSchemes[math.random(#favColorSchemes)])
