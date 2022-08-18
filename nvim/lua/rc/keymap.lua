vim.cmd('source $HOME/.vim/rc/keymap.vim')

-- PLUGIN:TELESCOPE ------------------------------------------------------------

local telescope_keymaps = {
  ['a'] = 'autocommands()',
  ['b'] = 'buffers()',
  ['B'] = 'builtin()',
  ['c'] = 'colorscheme({ enable_preview = true})',
  ['d'] = 'lsp_definitions()',
  ['D'] = 'lsp_document_symbols()',
  ['f'] = 'find_files()',
  ['F'] = 'git_files()',
  ['h'] = 'help_tags()',
  ['H'] = 'highlights()',
  ['g'] = 'git_status()',
  ['G'] = 'grep_string()',
  ['i'] = 'lsp_implementations()',
  ['I'] = 'lsp_incoming_calls()',
  ['j'] = 'jumplist()',
  ['k'] = 'keymaps()',
  ['l'] = 'live_grep()',
  ['L'] = 'loclist()',
  ['m'] = 'man_pages()',
  ['o'] = 'old_files()',
  ['O'] = 'lsp_outgoing_calls()',
  ['q'] = 'quickfix()',
  ['Q'] = 'quickfixhistory()',
  ['r'] = 'lsp_references()',
  ['R'] = 'reloader()',
  ['s'] = 'git_stash()',
  ['S'] = 'spell_suggest()',
  ['t'] = 'treesitter()',
  ['w'] = 'lsp_dynamic_workspace_symbols()',
  [';'] = 'commands()',
  ['?'] = 'builtin()',
  ["'"] = 'registers()',
  ["/"] = 'search_history()',
  ["<Space>"] = 'resume()',
}

for lhs, rhs in pairs(telescope_keymaps) do
  local rhs = "<Cmd>lua require('telescope.builtin')." .. rhs .. "<CR>"
  vim.api.nvim_set_keymap('n', 's' .. lhs, rhs, { noremap = true, silent = true })
end
