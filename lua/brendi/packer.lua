vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("preservim/nerdtree")

    -- lua vim.api integration
    use("folke/neodev.nvim")

    -- Undo Stuff
    use({ "mbbill/undotree" })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
            })
        end,
    })

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            require("rose-pine").setup({
                groups = {
                    comment = 'love',
                },
                highlight_groups = {
                    Comment = { fg = "love" },
                    CocFadeOut = { fg = 'muted' }
                }
            })
            vim.cmd("colorscheme rose-pine")
        end,
    })
    -- Formatting stuff
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end,
    })
    -- use("voldikss/vim-floaterm")
    -- BAR BAR THE ELEPHANT
    use("nvim-tree/nvim-web-devicons")
    use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use { 'neoclide/coc.nvim', branch = 'release' }

    -- minimap - not using right now.
    -- use { 'wfxr/minimap.vim' }

    -- helix like diagnostics
    use({ "Mofiqul/trld.nvim" })
    use("lukas-reineke/indent-blankline.nvim")
    -- use "lukas-reineke/lsp-format.nvim"
    use({ "lewis6991/gitsigns.nvim" })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- use({ "mhartington/formatter.nvim" })
    -- use "jose-elias-alvarez/null-ls.nvim"
end)
