local lsp_signature = require("lsp_signature")

local config = {
  debug = false,
  log_path = "debug_log_file_path",
  verbose = false,
  bind = true,
  doc_lines = 0,
  floating_window = false,
  floating_window_above_cur_line = false,
  fix_pos = false,
  hint_enable = true,
  hint_scheme = "Comment",
  use_lspsaga = false,
  hi_parameter = "LspSignatureActiveParameter",
  max_height = 12,
  max_width = 120,
  handler_opts = { border = "rounded", }, -- double, rounded, single, shadow, none
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = "",
  transparency = nil,
  shadow_blend = 36,
  shadow_guibg = "Black",
  timer_interval = 200,
  toggle_key = nil,
}

local import_status, icons = pcall(require, "plugin.icons")
if(import_status) then
  config.hint_prefix = icons.misc.Squirrel .. " "
end

lsp_signature.setup(config)
lsp_signature.on_attach(config)
