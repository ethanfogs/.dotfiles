local toggleterm = setmetatable({}, { __index = require("toggleterm") })

toggleterm.setup({
  size = 20,
  open_mapping = "<C-\\>",
  start_in_insert = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 10,
  },
})

vim.o.hidden = true -- required for persisting terminal sessions
vim.keymap.set("n", "<Space>t", toggleterm.toggle_all, { noremap = true, })
