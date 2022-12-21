if not pcall(require, "nvim-web-devicons") then return end

require('nvim-web-devicons').set_icon({
  sh = {
    color = "#1DC123",
    cterm_color = "59",
    icon = "",
    name = "Sh",
  },
  [".gitattributes"] = {
    color = "#e24329",
    cterm_color = "59",
    icon = "",
    name = "GitAttributes",
  },
  [".gitconfig"] = {
    color = "#e24329",
    cterm_color = "59",
    icon = "",
    name = "GitConfig",
  },
  [".gitignore"] = {
    color = "#e24329",
    cterm_color = "59",
    icon = "",
    name = "GitIgnore",
  },
  [".gitmodules"] = {
    color = "#e24329",
    cterm_color = "59",
    icon = "",
    name = "GitModules",
  },
  ["diff"] = {
    color = "#e24329",
    cterm_color = "59",
    icon = "",
    name = "Diff",
  },
})
