if (not pcall(require, "nvim-tree")) then return end

local nvim_tree  = setmetatable({}, { __index = require("nvim-tree") })
nvim_tree.config = setmetatable({}, { __index = require("nvim-tree.config") })

local _, icons = pcall(require, "plugin.icons")

require("nvim-tree").setup({
  hijack_directories = { enable = false, },
  hijack_netrw = true,
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
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
})

vim.keymap.set("n", "<Space>e", nvim_tree.toggle, { noremap = true, silent = true, })
