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
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
