function echo(i)
  print((type(i) == "table") and vim.inspect(i) or i)
end
