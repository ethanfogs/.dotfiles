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

require("gitsigns").setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

icons = {
  kind = {
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
  type = {
    Array = "",
    Boolean = "蘒",
    Number = "",
    Object = "",
    String = "",
  },
  documents = {
    File = "",
    Files = "",
    Folder = "",
    OpenFolder = "",
  },
  git = {
    Add = "",
    Diff = "",
    Ignore = "",
    Mod = "",
    Remove = "",
    Rename = "",
    Repo = "",
  },
  ui = {
    ArrowClosed = "",
    ArrowOpen = "",
    BigCircle = "",
    BigUnfilledCircle = "",
    BookMark = "",
    Bug = "",
    Calendar = "",
    Check = "",
    ChevronRight = "",
    Circle = "",
    Close = "",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    Fire = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Table = "",
    Telescope = "",
  },
  diagnostics = {
    Error = "",
    Hint = "",
    Information = "",
    Question = "",
    Warning = "",
  },
  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
  },
}

return icons
