local lualine = require("lualine")

------------------------------------------------------------------------------

local set_hl = vim.api.nvim_set_hl
set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#303030" })
set_hl(0, "SLBranchName", { fg = "#D4D4D4", bg = "#303030", bold = false })
set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
set_hl(0, "SLProgress", { fg = "#D4D4D4", bg = "#303030" })
set_hl(0, "SLSeparator", { fg = "#808080", bg = "#252525" })

------------------------------------------------------------------------------

local mode_color = {
  n = "#569cd6",
  i = "#6a9955",
  v = "#c586c0",
  [""] = "#c586c0",
  V = "#c586c0",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#4EC9B0",
  no = "#569cd6",
  s = "#ce9178",
  S = "#ce9178",
  [""] = "#ce9178",
  ic = "#dcdcaa",
  R = "#d16969",
  Rv = "#d16969",
  cv = "#569cd6",
  ce = "#569cd6",
  r = "#d16969",
  rm = "#4EC9B0",
  ["r?"] = "#4EC9B0",
  ["!"] = "#4EC9B0",
  t = "#D7BA7D",
}

local mode = {
  function() return "▊" end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { right = 1 },
  padding = 0,
}

local hide_in_width = function() return vim.fn.winwidth(0) > 80 end

------------------------------------------------------------------------------

local icons = require("plugin.icons")

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = {
    error = icons.diagnostics.Error .. " ",
    warn = icons.diagnostics.Warning .. " "
  },
  colored = false,
  update_in_insert = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { -- changes diff symbols
    added = icons.git.Add .. " ",
    modified = icons.git.Mod .. " ",
    removed = icons.git.Remove .. " "
  },
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

-- local mode = { "mode", }

local filetype = {
  "filetype",
  icons_enabled = true,
  -- icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  colored = false,
}

local progress = {
  "progress",
  fmt = function(str)
    print(vim.fn.expand(str))
    if (str == "1%") then return "TOP" end
    if (str == "100%") then return "BOT" end
    return str
  end,
  -- padding = 0,
}

--[[
local progress = function() --cool function for progress bars
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  -- return chars[index]
  return "%#SLProgress#" .. chars[index] .. "%*"
end
--]]

local current_signature = function()
  if (pcall(require, "lsp_signature")) then
    return "%#SLSeparator#" .. require("lsp_signature").status_line(30) .. "%*"
  end
end


local spaces = {
  function() return "spaces: " .. vim.bo.shiftwidth end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
  "location",
  color = function() return { fg = "#252525", bg = mode_color[vim.fn.mode()] } end,
}

lualine.config = {
  options = {
    globalstatus = false,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = '', right = '' },
    --disabled_filetypes = { "dashboard", },
    always_divide_middle = true,
  },
  sections = {
    --lualine_a = { mode, branch },
    lualine_a = { 'mode' },
    --lualine_b = { diagnostics },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    --lualine_c = { { current_signature, cond = hide_in_width } },
    lualine_c = { 'filename' },
    ---- lualine_x = { diff, spaces, "encoding", filetype },
    --lualine_x = { diff, spaces, filetype },
    lualine_x = { 'encodings', 'fileformat', 'filetype' },
    --lualine_y = { progress },
    lualine_y = { 'progress' },
    --lualine_z = { location },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    --lualine_c = {},
    lualine_c = { "filename" },
    --lualine_x = { "location" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

-- lualine.after = "base16-vim"

lualine.setup(lualine.config)
