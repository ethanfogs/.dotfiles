vim.cmd('source $HOME/.vim/rc/opt.vim')

if (vim.fn.exists('*nvim_treesitter#foldexpr') == 1) then
  vim.o.foldmethod = "expr"
  vim.o.foldexpr   = "nvim_treesitter#foldexpr()"
end
