if not pcall(require, "dashboard") then return end

local db = setmetatable({}, { __index = require("dashboard") })

------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "FileType", }, {
  group = vim.api.nvim_create_augroup("dashboard_filetype", { clear = true }),
  pattern = { "dashboard" },
  callback = function() vim.o.foldenable = false end,
})

------------------------------------------------------------------------------

-- local home = os.getenv('HOME')
-- local deps, pkg_manager, preview_command, import_status
-- if (vim.fn.has("mac") == 1) then
--   preview_command = 'cat | lolcat -F 0.3'
--   deps = { "lolcat" }
--   pkg_manager = "brew"
-- elseif (vim.fn.has("Linux") == 1) then
--   preview_command = "ueberzug"
--   deps = { "ueberzug" }
--   pkg_manager = "pip"
-- end
--
-- for i,dep in pairs(deps) do
--   if(vim.fn.executable(dep) == 1) then deps[i] = nil end
-- end
--
-- if(#deps > 0 and vim.fn.executable(pkg_manager) == 1) then
--   for _,dep in pairs(deps) do os.execute(pkg_manager .. " install " dep) end
-- else
--   import_status = false
-- end
--
-- db.preview_command = preview_command
--
-- ------------------------------------------------------------------------------
--
-- if (vim.fn.filereadable(home .. '/.config/nvim/static/neovim.cat')) then
--   db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
-- end
-- db.preview_file_height = 11
-- db.preview_file_width = 70

------------------------------------------------------------------------------

db.custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

db.header_pad = 22.5

------------------------------------------------------------------------------

db.custom_center = { { desc = ' ', } }

------------------------------------------------------------------------------

db.custom_footer = {}

------------------------------------------------------------------------------
