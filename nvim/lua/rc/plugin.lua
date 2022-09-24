local packer = {}
packer.repo  = "wbthomason/packer.nvim"
packer.dir   = vim.fn.stdpath("data") .. "/site/pack/packer"
packer.start = packer.dir .. "/start/packer.nvim"

if (vim.fn.isdirectory(packer.dir) == 0) then
	os.execute("git clone --depth 1 https://github.com/" ..
		packer.repo .. " " .. packer.start .. " &")
	packer.sync = 1
end

vim.cmd("packadd packer.nvim")

------------------------------------------------------------------------------

packer = vim.tbl_deep_extend("force", packer, require("packer"))

packer.startup(function(use)
	use { packer.repo }

	use { "tpope/vim-fugitive" }
	use { "tpope/vim-rhubarb" }
	use { "tpope/vim-surround" }
	use { "tpope/vim-repeat" }

	use { "preservim/nerdtree", } -- { 'on': 'NERDTreeToggle'
	use { "Xuyuanp/nerdtree-git-plugin" }
	use { "tiagofumo/vim-nerdtree-syntax-highlight" }
	use { "scrooloose/nerdtree-project-plugin" }
	-- use { "PhilRunninger/nerdtree-buffer-ops" }
	-- use { "PhilRunninger/nerdtree-visual-selection" }

	use { "jiangmiao/auto-pairs" }

	use { "RRethy/vim-illuminate" }
	use { "airblade/vim-gitgutter" }
	use { "chrisbra/Colorizer" }

	use { "nvim-lua/plenary.nvim" }
	use { "nvim-lua/popup.nvim" }

	use { "neovim/nvim-lspconfig" }
	use { "onsails/lspkind-nvim" } --  lsp pictograms
	use { "ray-x/lsp_signature.nvim" }
	use { "williamboman/nvim-lsp-installer" }
	use { "folke/lsp-colors.nvim" } --  colorscheme support for lsp buffers
	use { "nvim-pack/nvim-spectre" }

	use { "nvim-treesitter/nvim-treesitter" } --, { 'do': 'TSUpdate' }
	use { "nvim-treesitter/nvim-treesitter-context" }
	use { "nvim-treesitter/playground" }

	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-cmdline" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lua" }
	use { "hrsh7th/cmp-path" }
	use { "L3MON4D3/LuaSnip" }
	use { "saadparwaiz1/cmp_luasnip" }

	use { "nvim-telescope/telescope.nvim" }
	use { "nvim-telescope/telescope-arecibo.nvim" } --  web-search queries
	use { "nvim-telescope/telescope-cheat.nvim" } --  cheatsheet
	use { "nvim-telescope/telescope-file-browser.nvim" }
	use { "nvim-telescope/telescope-frecency.nvim" }
	use { "nvim-telescope/telescope-fzf-writer.nvim" }
	use { "nvim-telescope/telescope-fzy-native.nvim" } -- ,  { 'do': 'make' }
	use { "nvim-telescope/telescope-github.nvim" }
	use { "nvim-telescope/telescope-hop.nvim" }
	use { "nvim-telescope/telescope-live-grep-args.nvim" }
	use { "nvim-telescope/telescope-node-modules.nvim" }
	use { "nvim-telescope/telescope-project.nvim" }
	use { "nvim-telescope/telescope-smart-history.nvim" }
	use { "nvim-telescope/telescope-snippets.nvim" }
	use { "nvim-telescope/telescope-symbols.nvim" }
	use { "nvim-telescope/telescope-ui-select.nvim" }
	use { "nvim-telescope/telescope-vimspector.nvim" }
	use { "nvim-telescope/telescope-media-files.nvim" }

	use { "mfussenegger/nvim-dap" }
	use { "rcarriga/nvim-dap-ui" }
	use { "nvim-telescope/telescope-dap.nvim" }
	use { "theHamsta/nvim-dap-virtual-text" }
	use { "jbyuki/one-small-step-for-vimkind" } --  debug adapter for lua
	use { "leoluz/nvim-dap-go" }

	use { "akinsho/toggleterm.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "kyazdani42/nvim-web-devicons" }
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "glepnir/dashboard-nvim" }
	use { "nvim-lualine/lualine.nvim" }
	use { "akinsho/bufferline.nvim" }
	use { "RRethy/nvim-base16" }
end)

function packer.open_in_github(repo)
	local repo = string.gsub((repo or vim.fn.expand("<cWORD>")), "'\"", "")

	if (string.match(repo, "[aA-zZ0-9.]+/[aA-zZ0-9.-_]+") == nil) then return end
	local api_query = vim.fn.system("curl https://api.github.com/repos/" .. repo)

	if (string.match(api_query, "Not Found") == nil) then
		os.execute("open https://github.com/" .. repo .. " &")
	end
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("sync_packer", { clear = true }),
	buffer = 0,
	command = "source <afile> | PackerCompile | PackerInstall"
})

if (packer.sync) then
	vim.cmd("PackerInstall")
end

return packer
