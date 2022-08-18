local indent_blankline = require('indent_blankline')

-- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = { "help", "dashboard", "NvimTree", }
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

-- vim.o.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

-- vim.cmd([[
--   highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
--   highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
--   highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
--   highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
--   highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
--   highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine
-- ]])

-- indent_blankline.setup {
--   show_current_context = true,
--   show_current_context_start = true,
-- }
