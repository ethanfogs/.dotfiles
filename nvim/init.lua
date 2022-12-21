require("rc.autocmd")
require("rc.keymap")
require("rc.opt")
require("rc.plugin")

function _G.echo(...) local args = ...; print(vim.inspect(args)) end
