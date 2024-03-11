return {
    -- TELESCOPE ---------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close
                        },
                    },
                }
            })
        end,
        keys = {
            { "<leader>ff", "<cmd>Telescope fd<cr>" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
            { "<leader>f,", "<cmd>Telescope buffers<cr>" },
        },
        cmd = { "Telescope" },
    },
    -- { "lukas-reineke/indent-blankline.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = { "Neotree" },
        keys = {
            { "<Tab>", "<cmd>Neotree toggle<cr>" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    width = 30,
                },
            })
        end,
    },
}
