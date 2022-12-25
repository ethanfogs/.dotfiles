local M = {}

M.documents = {
  File       = "",
  Files      = "",
  Folder     = "",
  OpenFolder = "",
  Symlink    = "",
}

M.diagnostics = {
  Error       = "",
  Hint        = "",
  Information = "",
  Question    = "",
  Warning     = "",
}

M.misc = {
  Robot    = "ﮧ",
  Squirrel = "",
  Tag      = "",
  Watch    = "",
}

M.git = {
  Add       = "",
  Deleted   = "",
  Diff      = "",
  Ignore    = "",
  Ignored   = "◌",
  Mod       = "",
  Remove    = "",
  Rename    = "",
  Renamed   = "➜",
  Repo      = "",
  Staged    = "S",
  Unmerged  = "",
  Unstaged  = "",
  Untracked = "U",
}

M.type = {
  Array   = "",
  Boolean = "蘒",
  Number  = "",
  Object  = "",
  String  = "",
}

M.kind = {
  Class         = "",
  Color         = "",
  Constant      = "",
  Constructor   = "",
  Enum          = "",
  EnumMember    = "",
  Event         = "",
  Field         = "",
  File          = "",
  Folder        = "",
  Function      = "",
  Interface     = "",
  Keyword       = "",
  Method        = "",
  Module        = "",
  Operator      = "",
  Property      = "",
  Reference     = "",
  Snippet       = "",
  Struct        = "",
  Text          = "",
  TypeParameter = "",
  Unit          = "",
  Value         = "",
  Variable      = "",
}

M.ui = {
  ArrowClosed       = "",
  ArrowOpen         = "",
  BigCircle         = "",
  BigUnfilledCircle = "",
  BookMark          = "",
  Bug               = "",
  Calendar          = "",
  Check             = "",
  ChevronRight      = "",
  Circle            = "",
  Close             = "",
  CloudDownload     = "",
  Code              = "",
  Comment           = "",
  Dashboard         = "",
  Fire              = "",
  Gear              = "",
  History           = "",
  Lightbulb         = "",
  List              = "",
  Lock              = "",
  NewFile           = "",
  Note              = "",
  Package           = "",
  Pencil            = "",
  Project           = "",
  Search            = "",
  SignIn            = "",
  SignOut           = "",
  Table             = "",
  Telescope         = "",
}

return M
