if (not pcall(require, "toggleterm")) then return end

local toggleterm = setmetatable({}, { __index = require("toggleterm") })

toggleterm.setup({
  size = 20,
  open_mapping = "<C-BSlash>",
  start_in_insert = true,
  direction = "float",
  autochdir = true,
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 10,
  },
})

vim.o.hidden = true -- required for persisting terminal sessions
