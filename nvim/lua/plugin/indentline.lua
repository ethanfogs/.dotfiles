local indent_blankline = require('indent_blankline')

vim.g.indent_blankline_filetype_exclude = {
  -- "",
  "nofile",
  -- "dashboard",
  "help",
  "terminal",
  -- "toggleterm",
  "TelescopePrompt",
}

vim.g.indent_blankline_buftype_exclude = vim.g.indent_blankline_filetype_exclude

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

-- vim.o.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

local set_hl = vim.api.nvim_set_hl
set_hl(0, "IndentBlanklineIndent1", { fg = "#E06C75", nocombine = true, })
set_hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B", nocombine = true, })
set_hl(0, "IndentBlanklineIndent3", { fg = "#98C379", nocombine = true, })
set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2", nocombine = true, })
set_hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF", nocombine = true, })
set_hl(0, "IndentBlanklineIndent6", { fg = "#C678DD", nocombine = true, })

indent_blankline.config = {
  show_current_context = true,
  show_current_context_start = true,
}

indent_blankline.setup(indent_blankline.config)
