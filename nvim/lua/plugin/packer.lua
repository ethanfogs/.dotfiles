vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("packer_sync_on_write", { clear = true }),
  pattern = "packer.lua",
  command = "source <afile> | PackerCompile",
})

------------------------------------------------------------------------------

local bootstrap = (function()

  local root_dir = vim.fn.stdpath("data") .. "/site/pack"

  if (vim.fn.isdirectory(root_dir) == 1) then return false end

  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    root_dir .. "/packer/start/packer.nvim"
  })

  vim.cmd("packadd packer.nvim")

  return true

end)()

------------------------------------------------------------------------------

require("packer").init({
  autoremove = true,
  display = {
    non_interactive = true,
  },
  -- display = {
  --   compact = true,
  --   open_fn = function() require("packer.util").float({ border = "rounded" }) end
  -- }
})

------------------------------------------------------------------------------

require("packer").startup(function(use)
  use { "wbthomason/packer.nvim", }

  use {
    { "nvim-lua/plenary.nvim", },
    { "nvim-lua/popup.nvim", },
  }

  use { -- GIT
    { "tpope/vim-fugitive",
      config = function() require("plugin.fugitive") end
    },
    { "tpope/vim-rhubarb", },
  }

  use {
    { "neovim/nvim-lspconfig",
      config = function() require("plugin.lsp") end,
    },
    { "williamboman/mason.nvim", },
    { "williamboman/mason-lspconfig.nvim", },
    { "onsails/lspkind-nvim", },
    { "ray-x/lsp_signature.nvim", },
    { "folke/lsp-colors.nvim", },
    { "nvim-pack/nvim-spectre", },
  }

  use { -- TREESITTER
    { "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function() require("plugin.treesitter") end,
    },
    { "nvim-treesitter/nvim-treesitter-context", },
    { "JoosepAlviste/nvim-ts-context-commentstring", },
    { "nvim-treesitter/playground", },
  }

  use { -- DEGUGGING
    { "mfussenegger/nvim-dap",
      config = function() require("plugin.dap") end,
    },
    { "rcarriga/nvim-dap-ui", },
    { "theHamsta/nvim-dap-virtual-text", },
    -- { "awto/effectfuljs", }, -- javascript debug adapter
    -- { "jbyuki/one-small-step-for-vimkind", }, -- lua debug adapter
    -- { "leoluz/nvim-dap-go", },
  }

  use { -- (AUTO-)COMPLETION \ CODE-SNIPPETS
    { "hrsh7th/nvim-cmp",
      config = function() require("plugin.cmp") end,
    },
    { "hrsh7th/cmp-buffer", },
    { "hrsh7th/cmp-cmdline", },
    { "hrsh7th/cmp-nvim-lsp", },
    { "hrsh7th/cmp-nvim-lua", },
    { "hrsh7th/cmp-path", },
    { "L3MON4D3/LuaSnip", },
    { "saadparwaiz1/cmp_luasnip", },
    -- { "rcarriga/cmp-dap",
    --   config = function()
    --     local cmp = require("cmp")
    --     cmp.setup({
    --       enabled = function()
    --         return vim.api.nvim_buf_get_option(0, "buftype")
    --             ~= "prompt"
    --             or require("cmp_dap").is_dap_buffer()
    --       end
    --     })
    --
    --     cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    --       sources = {
    --         { name = "dap" },
    --       },
    --     })
    --   end,
    -- },
  }

  use { "jose-elias-alvarez/null-ls.nvim", -- CODE (AUTO-)FORMATTING
    config = function() require("plugin.null_ls") end,
  }

  use {
    { "nvim-telescope/telescope.nvim",
      config = function() require("plugin.telescope") end,
    },
    -- { "nvim-telescope/telescope-arecibo.nvim", -- TODO: fix luarocks installation issue
    --   rocks = { "openssl", "lua-http-parser" },
    -- },
    -- { "nvim-telescope/telescope-dap.nvim", },
    { "nvim-telescope/telescope-file-browser.nvim", },
    -- { "nvim-telescope/telescope-frecency.nvim", -- TODO: fix path error
    --   config = function()
    --     vim.g.sqlite_clib_path = vim.fn.glob("$HOME/.local/*/opt/sqlite/lib/*.*.dylib")
    --   end,
    --   requires = "kkharji/sqlite.lua",
    -- },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', },
    { "nvim-telescope/telescope-fzy-native.nvim", },
    { "nvim-telescope/telescope-packer.nvim", },
    -- { "nvim-telescope/telescope-project.nvim", },
    -- { "nvim-telescope/telescope-smart-history.nvim", },
    -- { "nvim-telescope/telescope-snippets.nvim", requires = "norcalli/snippets.nvim" },
    -- { "nvim-telescope/telescope-ui-select.nvim", },
    -- { "nvim-telescope/telescope-vimspector.nvim", },
  }

  if (vim.fn.has("linux") == 1) then
    use { "nvim-telescope/telescope-media-files.nvim" }
  end

  use {
    "akinsho/toggleterm.nvim",
    config = function() require("plugin.toggleterm") end,
  }

  use { "kyazdani42/nvim-tree.lua",
    config = function() require("plugin.nvim_tree") end,
  }

  use {
    "tpope/vim-surround",
    "tpope/vim-repeat",
  }

  use { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end,
  }

  use { "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  }

  use { "kyazdani42/nvim-web-devicons",
    config = function() require("plugin.web_devicons") end
  }

  use { "lewis6991/gitsigns.nvim",
    config = function() require("plugin.gitsigns") end
  }

  use { "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugin.indentline") end
  }

  use { "nvim-lualine/lualine.nvim",
    config = function() require("plugin.lualine") end
  }

  -- use { "akinsho/bufferline.nvim",
  --   config = function() require("plugin.bufferline") end
  -- }

  use { "glepnir/dashboard-nvim",
    config = function() require("plugin.dashboard") end
  }

  use { "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }

  use { "euclio/vim-markdown-composer", }

  use { "rhysd/vim-grammarous", }

  use { "edluffy/hologram.nvim", }

  use { "hood/popui.nvim", }

  use { "RRethy/nvim-base16",
    config = function()
      local colorschemes = {
        "base16-material",
        "base16-onedark",
        "base16-solarflare",
        "base16-solarized-dark",
        "base16-da-one-black",
        -- "base16-ashes"
      }

      -- `math.random()` returns last index, using `os.time() % #` as a temporary workaround
      vim.cmd.colorscheme(colorschemes[os.time() % #colorschemes + 1])
    end
  }

  if (bootstrap == true) then require("packer").sync() end
end)

------------------------------------------------------------------------------
