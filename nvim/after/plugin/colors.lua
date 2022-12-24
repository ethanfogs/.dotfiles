local colorschemes = {
  "base16-material",
  "base16-solarflare",
  "base16-ashes",
  "base16-ayu-dark",
  "base16-solarized-dark",
}

-- `math.random()` returns last index, using `os.time() % #` as a temp workaround
vim.cmd.colorscheme(colorschemes[os.time() % #colorschemes + 1])
