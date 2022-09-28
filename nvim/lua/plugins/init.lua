local function ensure_installed()
  local install_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if (vim.fn.isdirectory(install_dir) == 1) then return false end
  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_dir
  })
  vim.cmd('packadd packer.nvim')
  return true
end

------------------------------------------------------------------------------

local bootstrap = ensure_installed()

------------------------------------------------------------------------------

require("packer").init({
  autoremove = true,
  auto_clean = true,
  auto_reload_compiled = true,
  compile_on_sync = true,
  ensure_dependencies = true,
  display = {
    non_interactive = true,
    show_all_info = false,
    open_fn = function()
      require("packer.util").float({ border = "rounded" })
    end
  },
  preview_updates = false,
})

------------------------------------------------------------------------------

require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  use {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  }

  use { -- GIT
    { "tpope/vim-fugitive",
      config = function()
        vim.api.nvim_set_keymap("n", "gs", "<Cmd>Git<CR>", { noremap = true })
      end
    },
    "tpope/vim-rhubarb"
  }

  use {
    { "neovim/nvim-lspconfig",
      config = function() require("plugins.lsp") end,
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",
    "folke/lsp-colors.nvim",
    "nvim-pack/nvim-spectre",
  }

  use { -- TREESITTER
    { "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function() require("plugins.treesitter") end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
  }

  use { -- DEGUGGING
    { "mfussenegger/nvim-dap",
      config = function() require("plugins.dap") end,
    },
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "awto/effectfuljs", -- javascript debug adapter
    "jbyuki/one-small-step-for-vimkind", -- lua debug adapter
    "leoluz/nvim-dap-go",
  }

  use { -- (AUTO-)COMPLETION \ CODE-SNIPPETS
    { "hrsh7th/nvim-cmp",
      config = function() require("plugins.cmp") end,
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    { "rcarriga/cmp-dap",
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          enabled = function()
            return vim.api.nvim_buf_get_option(0, "buftype")
                ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
          end
        })

        cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })
      end,
    },
  }

  use { "jose-elias-alvarez/null-ls.nvim", -- CODE (AUTO-)FORMATTING
    config = function() require("plugins.null_ls") end,
  }

  use { -- TELESCOPE
    { "nvim-telescope/telescope.nvim",
      config = function() require("plugins.telescope") end,
    },
    "nvim-telescope/telescope-file-browser.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', },
    "nvim-telescope/telescope-fzy-native.nvim",
    -- "nvim-telescope/telescope-project.nvim",
    -- "nvim-telescope/telescope-smart-history.nvim",
    -- { "nvim-telescope/telescope-snippets.nvim", requires = "norcalli/snippets.nvim" },
    -- "nvim-telescope/telescope-ui-select.nvim",
    -- "nvim-telescope/telescope-vimspector.nvim",
    "nvim-telescope/telescope-packer.nvim",
    "nvim-telescope/telescope-dap.nvim",
    -- { "nvim-telescope/telescope-frecency.nvim", -- TODO: fix path error
    --   requires = "tami5/sqlite.lua",
    --   config = function()
    --     vim.g.sqlite_clib_path = vim.fn.glob("$HOME/.local/*/opt/sqlite/lib/*.*.dylib")
    --   end
    --   requires = "kkharji/sqlite.lua",
    -- },
    -- { "nvim-telescope/telescope-arecibo.nvim", -- TODO: fix luarocks installation issue
    --   rocks = { "openssl", "lua-http-parser" },
    -- },
  }

  if (vim.fn.has("linux") == 1) then
    use { "nvim-telescope/telescope-media-files.nvim" }
  end

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = "<C-\\>",
        start_in_insert = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "curved",
          winblend = 10,
        },
      })

      vim.o.hidden = true -- required for persisting terminal sessions
      vim.keymap.set("n", "<Space>t", require("toggleterm").toggle_all, {})
    end,
  }

  use { "kyazdani42/nvim-tree.lua",
    config = function() require("plugins.nvim_tree") end,
  }

  use { -- TEXT-EDITING
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
    config = function() require("plugins.web_devicons") end
  }

  use { "lewis6991/gitsigns.nvim",
    config = function() require("plugins.gitsigns") end
  }

  use { "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins.indentline") end
  }

  use { "nvim-lualine/lualine.nvim",
    config = function() require("plugins.lualine") end
  }

  use { "akinsho/bufferline.nvim",
    config = function() require("plugins.bufferline") end
  }

  use { "glepnir/dashboard-nvim",
    config = function() require("plugins.dashboard") end
  }

  use { "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }

  use "euclio/vim-markdown-composer"
  use "rhysd/vim-grammarous"

  use { "RRethy/nvim-base16",
    config = function()
      local colorschemes = {
        "base16-material",
        -- "base16-onedark",
        "base16-solarflare",
        "base16-solarized-dark",
        "base16-da-one-black",
      }

      -- `math.random` returns last index, using `os.time % #` as a workaround
      local random_index = os.time() % #colorschemes
      vim.cmd('colorscheme ' .. colorschemes[(random_index == 0) and 1 or random_index])
    end
  }

  if (bootstrap == true) then require("packer").sync() end
end)

------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("packer_sync_on_write", { clear = true }),
  pattern = "*/plugins/init.lua",
  command = "source <afile> | PackerCompile",
})
