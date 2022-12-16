require("rc.autocmds")
require("rc.keymaps")
require("rc.opts")
require("rc.plugins")

------------------------------------------------------------------------------

function echo(...) local args = ...; print(vim.inspect(args)); end
