-- LUALINE (STATUS-LINE) -----------------------------------------------------

local lualine = require("lualine")
local set_hl = vim.api.nvim_set_hl

------------------------------------------------------------------------------

set_hl(0, "SLGitIcon",    { fg = "#E8AB53", bg = "#303030" })
set_hl(0, "SLBranchName", { fg = "#D4D4D4", bg = "#303030", bold = false })
set_hl(0, "SLProgress",   { fg = "#D7BA7D", bg = "#252525" })
set_hl(0, "SLProgress",   { fg = "#D4D4D4", bg = "#303030" })
set_hl(0, "SLSeparator",  { fg = "#808080", bg = "#252525" })

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
    -- mode component
    function() return "▊" end,
    color = function()
      -- auto change color according to neovims mode
      return { fg = mode_color[vim.fn.mode()] }
    end,
    -- padding = { right = 1 },
    padding = 0,
}

local hide_in_width = function() return vim.fn.winwidth(0) > 80 end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = {
        error = icons.diagnostics.Error .. " ",
        warn = icons.diagnostics.Warning .. " "
    },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
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
        if (str == "1%")   then return "TOP" end
        if (str == "100%") then return "BOT" end
        return str
     end,
    -- padding = 0,
}

local current_signature = function()
    if pcall(require, "lsp_signature") then return end
    local sig = require("lsp_signature").status_line(30)
    return "%#SLSeparator#" .. sig.hint .. "%*"
end


local progress = function() --cool function for progress bars
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    -- return chars[index]
    return "%#SLProgress#" .. chars[index] .. "%*"
end

local spaces = {
    function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    padding = 0,
    separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
    "location",
    color = function()
      return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
    end,
}

lualine.setup({
    options = {
        globalstatus = false,
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        --disabled_filetypes = { "alpha", "dashboard" },
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
})

-- BUFFER-LINE ----------------------------------------------------------------

require("bufferline").setup({
    options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = "│",
        -- indicator_icon = "▎",
        buffer_close_icon = "",
        -- buffer_close_icon = '',
        modified_icon = "●",
        close_icon = "",
        -- close_icon = '',
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        --   -- remove extension from markdown files for example
        --   if buf.name:match('%.md') then
        --     return vim.fn.fnamemodify(buf.name, ':t:r')
        --   end
        -- end,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false, -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   return "("..count..")"
        -- end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        -- end,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
    },
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "#ff0000" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        -- buffer_selected = {
        --   guifg = {attribute='fg',highlight='#ff0000'},
        --   guibg = {attribute='bg',highlight='#0000ff'},
        --   gui = 'none'
        --   },
        buffer_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        -- close_button_selected = {
        --   guifg = {attribute='fg',highlight='TabLineSel'},
        --   guibg ={attribute='bg',highlight='TabLineSel'}
        --   },
        tab_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        tab = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        tab_close = {
            -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        duplicate_selected = {
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "TabLineSel" },
            gui = "italic",
        },
        duplicate_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic",
        },
        duplicate = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic",
        },
        modified = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        modified_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        modified_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },

        separator = {
            guifg = { attribute = "bg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        -- separator_visible = {
        --   guifg = {attribute='bg',highlight='TabLine'},
        --   guibg = {attribute='bg',highlight='TabLine'}
        --   },
        indicator_selected = {
            guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
    },
})
