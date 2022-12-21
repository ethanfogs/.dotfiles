if (not pcall(require, "popui.ui-overrider")) then return end

vim.ui.input  = require("popui.input-overrider")
vim.ui.select = require("popui.ui-overrider")

-- vim.g.popui_border_style = "rounded" -- "double" | "rounded" | "sharp" (Default: "double")
