local packer_home = vim.fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
if (vim.fn.isdirectory(packer_home) == 0) then
    local packer_gh = "https://github.com/wbthomason/packer.nvim"
    vim.fn.system('git clone --quiet --depth 1 ' .. packer_gh .. ' ' .. packer_home)
end

--vim.cmd('packadd packer.nvim')

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    use "williamboman/nvim-lsp-installer"
    use "folke/lsp-colors.nvim"

    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-context"
    use "nvim-treesitter/playground"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-path"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-telescope/telescope-symbols.nvim"
    use "nvim-telescope/telescope.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"

    use "akinsho/toggleterm.nvim"
    use "windwp/nvim-autopairs"
    use "tpope/vim-surround"
    use "RRethy/vim-illuminate"

    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    use "kyazdani42/nvim-tree.lua"

    use "jose-elias-alvarez/null-ls.nvim"
    use "lukas-reineke/indent-blankline.nvim"

    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"

    use "nvim-pack/nvim-spectre"

    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"

    use "rafi/awesome-vim-colorschemes"
end)
