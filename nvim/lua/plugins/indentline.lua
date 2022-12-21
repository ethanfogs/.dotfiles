local indent_blankline = require('indent_blankline')

vim.g.indent_blankline_filetype_exclude = {
  "dashboard",
  "help",
  "toggleterm",
  "TelescopePrompt",
}

vim.g.indent_blankline_buftype_exclude = {
  "nofile",
  "terminal",
}

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

-- vim.o.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

local function set_indentline_hl(nr, fg)
  vim.api.nvim_set_hl(0, "IndentBlanklineIndent" .. nr, { fg = fg, nocombine = true })
end

set_indentline_hl(1, "#E06C75")
set_indentline_hl(2, "#E5C07B")
set_indentline_hl(3, "#98C379")
set_indentline_hl(4, "#56B6C2")
set_indentline_hl(5, "#61AFEF")
set_indentline_hl(6, "#C678DD")

indent_blankline.config = {
  show_current_context = true,
  show_current_context_start = true,
}

indent_blankline.setup(indent_blankline.config)
