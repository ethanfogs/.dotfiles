local colorschemes = {
  "base16-material",
  "base16-onedark",
  "base16-solarflare",
  "base16-solarized-dark",
  "base16-da-one-black",
  -- "base16-ashes"
}

-- `math.random()` returns last index, using `os.time() % #` as a temp workaround
vim.cmd.colorscheme(colorschemes[os.time() % #colorschemes + 1])
