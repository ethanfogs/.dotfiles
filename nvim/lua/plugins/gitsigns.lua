local M = {}

M.config = {}

M.config.signs = {
  add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
}

M.config.signcolumn = true -- Toggle with `:Gitsigns toggle_signs`
M.config.numhl = false -- Toggle with `:Gitsigns toggle_numhl`
M.config.linehl = false -- Toggle with `:Gitsigns toggle_linehl`
M.config.word_diff = false -- Toggle with `:Gitsigns toggle_word_diff`
M.config.watch_gitdir = {
  interval = 1000,
  follow_files = true,
}

M.config.attach_to_untracked = true
M.config.current_line_blame = false -- Toggle with `:Gitsigns toggle_current_line_blame`
M.config.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
  delay = 1000,
  ignore_whitespace = false,
}

M.config.current_line_blame_formatter_opts = {
  relative_time = false
}

M.config.sign_priority = 6
M.config.update_debounce = 100
M.config.status_formatter = nil -- Use default
M.config.max_file_length = 40000
M.config.preview_config = {
  -- Options passed to nvim_open_win
  border = "rounded",
  style = "minimal",
  relative = "cursor",
  row = 0,
  col = 1,
}

M.config.yadm = {
  enable = false,
}

require("gitsigns").setup(M.config)
