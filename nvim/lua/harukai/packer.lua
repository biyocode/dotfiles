vim.cmd [[packadd packer.nvim]]

local use = require("packer").use
require("packer").startup(function()
    use "wbthomason/packer.nvim" -- Package manager
    use({"catppuccin/nvim", as = "catppuccin"}) -- Theme
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }
    use {"nvim-telescope/telescope.nvim", tag = "0.1.1"} -- Fuzzy Finder
    use "nvim-lua/plenary.nvim" -- UI Render?
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}) -- Text highlighting
    use "mbbill/undotree" -- Undo history
    use "jose-elias-alvarez/null-ls.nvim"
    use "mhinz/vim-grepper" -- Project replace all tool
    use({
        "akinsho/nvim-bufferline.lua",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons"
    }) -- Tabs UI
    use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
    use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim"s built-in LSP
    use "hrsh7th/nvim-cmp" -- Completion
    use "neovim/nvim-lspconfig" -- LSP
    use "williamboman/mason.nvim" -- LSP Manager
    use "williamboman/mason-lspconfig.nvim" -- Mason to LSP
    use "L3MON4D3/LuaSnip"
    use "windwp/nvim-autopairs" -- Auto brackets
    use "numToStr/Comment.nvim" -- Comment blocks
    use "lukas-reineke/indent-blankline.nvim" -- Indent vertical lines
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    })
end)
