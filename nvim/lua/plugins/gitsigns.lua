local config = {}

config.signs = {
  add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
}

config.signcolumn = true -- Toggle with `:Gitsigns toggle_signs`
config.numhl = false -- Toggle with `:Gitsigns toggle_numhl`
config.linehl = false -- Toggle with `:Gitsigns toggle_linehl`
config.word_diff = false -- Toggle with `:Gitsigns toggle_word_diff`
config.watch_gitdir = {
  interval = 1000,
  follow_files = true,
}

config.attach_to_untracked = true
config.current_line_blame = false -- Toggle with `:Gitsigns toggle_current_line_blame`
config.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
  delay = 1000,
  ignore_whitespace = false,
}

config.current_line_blame_formatter_opts = {
  relative_time = false
}

config.sign_priority = 6
config.update_debounce = 100
config.status_formatter = nil -- Use default
config.max_file_length = 40000
config.preview_config = {
  -- Options passed to nvim_open_win
  border = "rounded",
  style = "minimal",
  relative = "cursor",
  row = 0,
  col = 1,
}

config.yadm = {
  enable = false,
}

require("gitsigns").setup(config)
