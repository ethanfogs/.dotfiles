local dap = require("dap")
-- dap.ui = require("dapui")

------------------------------------------------------------------------------

dap.custom_fn = {}

dap.custom_fn.launch = function(port)
  if (pcall(require, "osv")) then
    require("osv").launch({ port = port or 8086 })
  end
end

------------------------------------------------------------------------------

dap.keymaps = {
  ["<Space>"] = dap.continue,
  si = dap.step_into,
  so = dap.step_over,
  sO = dap.step_out,
}

for lhs, rhs in pairs(dap.keymaps) do
  vim.keymap.set("n", lhs, rhs, { noremap = true })
end

------------------------------------------------------------------------------

dap.configurations = {}

dap.configurations.lua = {
  type = "nlua",
  request = "attach",
  name = "Attach to running neovim instance",
}

dap.adapters.nlua = function(callback, config)
  callback({
    type = "server",
    host = config.host or "127.0.0.1",
    port = config.port or 8086,
  })
end

------------------------------------------------------------------------------
