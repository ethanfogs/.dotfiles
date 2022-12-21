vim.cmd.source("~/.vim/rc/autocmd.vim")

-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("on_yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end
})

-------------------------------------------------------------------------------
