vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("packer_sync_on_write", { clear = true }),
  pattern = "packer.lua",
  command = "source <afile> | PackerCompile",
})

------------------------------------------------------------------------------

require("packer").init({
  autoremove = true,
  display = { non_interactive = true, },
  -- display =  {
  --   compact = true,
  --   open_fn = function() require("packer.util").float({ border = "rounded" }) end,
  -- },
})

------------------------------------------------------------------------------

local bootstrap = (function()
  if (vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/pack") == 1) then
    return false
  end

  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim",
  })

  vim.cmd("packadd packer.nvim")

  return true
end)()

------------------------------------------------------------------------------

return require("packer").startup(function(use)

  use { "wbthomason/packer.nvim", }

  use {
    { "nvim-lua/plenary.nvim", },
    { "nvim-lua/popup.nvim", },
  }

  use { "hood/popui.nvim", }

  use { "tpope/vim-fugitive", } -- git

  use {
    { "neovim/nvim-lspconfig", },
    { "VonHeikemen/lsp-zero.nvim", },
    { "williamboman/mason.nvim", },
    { "williamboman/mason-lspconfig.nvim", },
    { "folke/lsp-colors.nvim", },
    { "j-hui/fidget.nvim", config = function() require("fidget").setup() end, },
    -- { "ray-x/lsp_signature.nvim", config = function () require("lsp_signature").setup() end, },
    { "onsails/lspkind-nvim", config = function() require("lspkind").init() end, },
    { "nvim-pack/nvim-spectre",  config = function () require("spectre").setup() end, },
    -- { "jose-elias-alvarez/null-ls.nvim", }
  }

  use {
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", },
    { "nvim-treesitter/nvim-treesitter-context", },
    -- { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/playground", },
    { "JoosepAlviste/nvim-ts-context-commentstring", },
  }

  use {
    { "hrsh7th/nvim-cmp", },
    { "hrsh7th/cmp-buffer", },
    { "hrsh7th/cmp-cmdline", },
    { "hrsh7th/cmp-nvim-lsp", },
    { "hrsh7th/cmp-nvim-lua", },
    { "hrsh7th/cmp-path", },
  }

  use {
    { "saadparwaiz1/cmp_luasnip", },
    { "L3MON4D3/LuaSnip", },
    { "rafamadriz/friendly-snippets", },
  }

  use {
    { "nvim-telescope/telescope.nvim", },
    { "nvim-telescope/telescope-file-browser.nvim", },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', },
    { "nvim-telescope/telescope-fzy-native.nvim", },
    { "nvim-telescope/telescope-packer.nvim", },
    { "nvim-telescope/telescope-project.nvim", },
    { "nvim-telescope/telescope-symbols.nvim", },
    -- { "nvim-telescope/telescope-smart-history.nvim", },
  }

  -- if (vim.fn.has("linux") == 1) then
  --   use { "nvim-telescope/telescope-media-files.nvim" }
  -- else
  --   use { "edluffy/hologram.nvim", }
  -- end

  -- use { -- degug adapters
  --   { "mfussenegger/nvim-dap", },
  --   { "rcarriga/nvim-dap-ui", },
  --   { "leoluz/nvim-dap-go", },
  --   { "theHamsta/nvim-dap-virtual-text", },
  --   { "rcarriga/cmp-dap", },
  --   { "nvim-telescope/telescope-dap.nvim", },
  --   { "jbyuki/one-small-step-for-vimkind", }, -- nvim lua debug adapter
  -- }

  use { "RRethy/nvim-base16", }

  use { "RRethy/vim-illuminate", }

  use { "lukas-reineke/indent-blankline.nvim", }

  -- use { "gelguy/wilder.nvim", } -- extended wildmenu

  -- use { "euclio/vim-markdown-composer", } -- markdown previewer

  -- use { "ellisonleao/glow.nvim", } -- markdown previewer

  -- use { "rhysd/vim-grammarous", }

  use { "kyazdani42/nvim-web-devicons", }

  use { "lewis6991/gitsigns.nvim", }

  use { "nvim-lualine/lualine.nvim", }

  -- use { "bennypowers/nvim-regexplainer", 
  --   requires = { "MunifTanjim/nui.nvim", },
  --   config = function() require("regexplainer").setup() end,
  -- }

  -- use { "akinsho/bufferline.nvim", }

  use { "akinsho/toggleterm.nvim", }

  -- use { "sindrets/diffview.nvim", }

  use { "kyazdani42/nvim-tree.lua", }

  use { "glepnir/dashboard-nvim", } -- TODO: finish configuration

  -- use { "RishabhRD/nvim-cheat.sh", requires = { "RishabhRD/popfix", }, }

  -- use { "folke/neodev.nvim", } -- signature-help\docs\completion for nvim lua api

  -- use { "rest-nvim/rest.nvim", } -- nvim rest api client

  -- use { "folke/which-key.nvim", } -- TODO: setup configuration

  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end, }

  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end, }

  use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end, }

  use { "kylechui/nvim-surround", config = function() require("nvim-surround").setup() end, }

  if (bootstrap == true) then require("packer").sync() end

end)
