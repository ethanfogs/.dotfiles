vim.cmd('source $HOME/.vim/rc/autocmd.vim')

local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

create_augroup("FormatOnWrite", { clear = true })
create_autocmd({ "BufWritePre" }, {
  group = "FormatOnWrite",
  pattern = "*",
  callback = vim.lsp.buf.formatting_sync
})
