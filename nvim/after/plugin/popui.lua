if (not pcall(require, "popui.ui-overrider")) then return end

local ui = {
  input  = setmetatable({}, { __index = require("popui.input-overrider") }),
  select = setmetatable({}, { __index = require("popui.ui-overrider") }),
}

vim.ui.input  = ui.input
vim.ui.select = ui.select

-- vim.g.popui_border_style = "rounded" -- "double" | "rounded" | "sharp" (Default: "double")
