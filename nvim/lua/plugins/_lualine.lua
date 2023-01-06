return function()
    -- local evil_conf = require("plugins._lualine-evil")
    -- evil_conf = vim.tbl_extend("force", evil_conf, { extensions = { 'nvim-tree', 'quickfix' } })
    -- require("lualine").setup(evil_conf)
    require("lualine").setup {
        options = {
            theme = "auto",
            component_separators = "",
            section_separators = "",
        },
        extensions = { "nvim-tree", "quickfix" },
    }
end
