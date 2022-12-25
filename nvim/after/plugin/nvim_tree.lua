if (not pcall(require, "nvim-tree")) then return end

local nvim_tree  = setmetatable({}, { __index = require("nvim-tree") })
nvim_tree.config = setmetatable({}, { __index = require("nvim-tree.config") })

-------------------------------------------------------------------------------

vim.keymap.set("n", "<Space>e", nvim_tree.toggle, { noremap = true, })

-------------------------------------------------------------------------------

local config = {}

config.hijack_directories = { enable = false, }
config.hijack_netrw = true
-- config.update_cwd = false,
-- auto_resize = true,

config.filters = {
  custom = { ".git" },
}

config.git = {
  enable = true,
  ignore = true,
  timeout = 500,
}

config.view = {
  side = "left",
  width = 30,
  hide_root_folder = false,
}

config.view.mappings = {
  custom_only = false,
  list = {
    { key = "<CR>",  action = "split" },
    { key = "<Tab>", action = "tabnew" },
    { key = "K",     action = "toggle_file_info" },
    { key = "m",     action = "rename" },
    { key = "o",     action = "split" },
    { key = "v",     action = "vsplit" },
  },
}

config.renderer = {
  add_trailing = false,
  group_empty = false,
  highlight_git = false,
  highlight_opened_files = "none",
}

local has_icons, icons = pcall(require("plugin.icons"))

if has_icons then

  config.diagnostics = {
    enable = true,
    icons = {
      hint    = icons.diagnostics.Hint,
      info    = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error   = icons.diagnostics.Error,
    },
  }

  config.renderer.icons = {
    webdev_colors = true,
    git_placement = "before",
    padding = " ",
    symlink_arrow = " ➛ ",
  }

  config.renderer.icons.show = {
    file = true,
    folder = true,
    folder_arrow = true,
    git = true,
  }

  config.renderer.icons.glyphs = {
    default = "",
    symlink = "",
    folder = {
      default      = "",
      open         = icons.documents.OpenFolder,
      empty        = icons.documents.Folder,
    },
    git = {
      unstaged  = icons.git.Unstaged,
      staged    = icons.git.Staged,
      unmerged  = icons.git.Unmerged,
      renamed   = icons.git.Renamed,
      untracked = icons.git.Untracked,
      deleted   = icons.git.Deleted,
      ignored   = icons.git.Ignored,
    },
  }

  config.renderer.icons.glyphs.folder = {
    arrow_open   = icons.ui.ArrowOpen,
    arrow_closed = icons.ui.ArrowClosed,
    default      = icons.documents.Folder,
    open         = icons.documents.OpenFolder,
    empty        = icons.documents.Folder,
    empty_open   = icons.documents.OpenFolder,
    symlink      = icons.documents.Symlink,
    symlink_open = icons.documents.Symlink,
  }

  config.renderer.icons.glyphs.git = {
    unstaged  = icons.git.unstaged,
    staged    = icons.git.staged,
    unmerged  = icons.git.unmerged,
    renamed   = icons.git.renamed,
    untracked = icons.git.untracked,
    deleted   = icons.git.deleted,
    ignored   = icons.git.Ignore,
  }

end

require("nvim-tree").setup(config)
