local file_browser = require("telescope").load_extension("file_browser")

------------------------------------------------------------------------------

local mappings = {
  n = {
    C = file_browser.actions.change_cwd,
    D = file_browser.actions.remove,
    M = file_browser.actions.move,
    n = file_browser.actions.create,
    R = file_browser.actions.rename,
    S = file_browser.actions.create,
    ["~"] = file_browser.actions.goto_home_dir,
    ["."] = file_browser.actions.toggle_hidden,
    -- ["<BS>"] = file_browser.actions.move,
  },
  i = {
    ["<C-a>"] = file_browser.actions.toggle_hidden,
    ["<C-d>"] = file_browser.actions.remove,
    ["<C-h>"] = file_browser.actions.goto_home_dir,
    ["<C-m>"] = file_browser.actions.move,
    ["<C-r>"] = file_browser.actions.rename,
    ["<C-y>"] = file_browser.actions.copy,
  }
}

------------------------------------------------------------------------------

local fn = {}

function fn.file_browser()
  file_browser.file_browser({ hidden = true, follow = true })
end

------------------------------------------------------------------------------

local keymaps = {
  e = vim.deepcopy(fn.file_browser),
}

------------------------------------------------------------------------------

return {
  mappings = mappings,
  keymaps = keymaps,
}
