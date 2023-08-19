return {
    {
        "numToStr/Comment.nvim",
        event = "InsertEnter",
        keys = {
            "gcc",
            { "gc", mode = "v" },
            { "gb", mode = "v" },
        },
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
}
