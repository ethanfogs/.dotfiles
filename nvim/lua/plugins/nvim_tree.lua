local nvim_tree = require("nvim-tree")
nvim_tree.config = setmetatable({}, { __index = require("nvim-tree.config") })
nvim_tree.config.cb = nvim_tree.config.nvim_tree_callback

local icons = require("plugins.icons")

nvim_tree.config = {
  hijack_directories = { enable = false, },
  hijack_netrw = true,
  -- open_on_setup = true,
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
  -- hijack_cursor = false,
  update_cwd = false,
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open   = icons.ui.ArrowOpen,
          arrow_closed = icons.ui.ArrowClosed,
          default      = icons.documents.Folder or "",
          open         = icons.documents.OpenFolder or "",
          empty        = icons.documents.Folder or "",
          empty_open   = icons.documents.OpenFolder or "",
          symlink      = icons.documents.Symlink or "",
          symlink_open = icons.documents.Symlink or "",
        },
        git = {
          unstaged  = icons.git.unstaged or "",
          staged    = icons.git.staged or "S",
          unmerged  = icons.git.unmerged or "",
          renamed   = icons.git.renamed or "➜",
          untracked = icons.git.untracked or "U",
          deleted   = icons.git.deleted or "",
          ignored   = icons.git.Ignore or "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint    = icons.diagnostics.Hint or "",
      info    = icons.diagnostics.Information or "",
      warning = icons.diagnostics.Warning or "",
      error   = icons.diagnostics.Error or "",
    },
  },
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = false,
  --   ignore_list = {},
  -- },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      -- list = {
      --   { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      --   { key = "h", cb = tree_cb "close_node" },
      --   { key = "v", cb = tree_cb "vsplit" },
      -- },
    },
  },
}

nvim_tree.setup(nvim_tree.config)

vim.keymap.set("n", "<Space>e", nvim_tree.toggle, { noremap = true, })
