return function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "c",
            "cmake",
            "cpp",
            "css",
            "html",
            "markdown",
            "python",
            "javascript",
            "lua",
            "dockerfile",
            "bash",
            "typescript",
            "tsx",
            "vim",
            "yaml",
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "ä",
                scope_incremental = "grc",
                node_decremental = "ö",
            },
        },
    }

    -- require("nvim-treesitter.highlight").set_custom_captures {
    --    ["h1heading"] = "TSH1",
    --    ["h2heading"] = "TSH2",
    --    ["h3heading"] = "TSH3",
    --    ["h4heading"] = "TSH4",
    --    ["h5heading"] = "TSH5",
    --    ["h6heading"] = "TSH6",
    --    ["hmarker"] = "TSHMarker",
    -- }
end
