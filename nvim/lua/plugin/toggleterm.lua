vim.o.hidden = true -- required for persisting terminal sessions

require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	start_in_insert = true,
	insert_mappings = true,
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 10,
	},
})
