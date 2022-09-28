vim.cmd("source $HOME/.vim/vimrc")

require("plugins")

-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("on_yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end
})

-------------------------------------------------------------------------------

function _G.echo(input) print(vim.inspect(input)) end
