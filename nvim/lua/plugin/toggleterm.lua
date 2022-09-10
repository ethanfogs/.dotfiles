local toggleterm = require("toggleterm")

toggleterm.config = {
  size = 20,
  open_mapping = "<C-\\>",
  start_in_insert = true,
  insert_mappings = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 10,
  },
}

toggleterm.setup(toggleterm.config)

vim.o.hidden = true -- required for persisting terminal sessions
vim.api.nvim_set_keymap("", "<Space>t", "<Cmd>ToggleTerm<CR>", { noremap = true })
