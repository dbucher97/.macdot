return {
    -- TELESCOPE ---------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-e>"] = actions.send_selected_to_qflist
                                + actions.open_qflist,
                        },
                    },
                },
            })
        end,
        keys = {
            { "<leader>ff", "<cmd>Telescope fd<cr>" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
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
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
}
