if (not pcall(require, "dap")) then return end

local dap = require("dap")
local ui = require("dapui")

------------------------------------------------------------------------------

local fn = {}

fn.launch = function(port)
  require("osv").launch({ port = port or 8086 })
end

------------------------------------------------------------------------------

local leader_key = "["

local keymaps = {
  b = dap.toggle_breakpoint,
  i = dap.step_into,
  o = dap.step_over,
  O = dap.step_out,
  ["<Space>"] = dap.continue,
}

for lhs, rhs in pairs(keymaps) do
  vim.keymap.set("n", leader_key .. lhs, rhs, { noremap = true })
end

------------------------------------------------------------------------------

local config = {}

config.lua = {
  type = "nlua",
  request = "attach",
  name = "Attach to running neovim instance",
}

local adapters = {}

adapters.nlua = function(callback, opts)
  callback({
    type = "server",
    host = opts.host or "127.0.0.1",
    port = opts.port or 8086,
  })
end

------------------------------------------------------------------------------

dap.configurations = config
dap.adapters       = adapters
