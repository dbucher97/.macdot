return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = true,
    keys = {
        {"<leader>ff", "<cmd>Telescope fd<cr>"},
        {"<leader>fh", "<cmd>Telescope help_tags<cr>"},
        {"<leader>f,", "<cmd>Telescope buffers<cr>"},
    },
    cmd = { "Telescope" },
}
