local import_status, web_devicons = pcall(require, 'nvim-web-devicons')
if (not import_status) then
  print("[import failed] nvim-web-devicons")
  return
end

web_devicons.set_icon({
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
  [".gitlab-ci.yml"] = {
    color = "#e24329",
    cterm_color = "166",
    icon = "",
    name = "GitlabCI",
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
