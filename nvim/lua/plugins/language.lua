local lsp_settings = {
    lua_ls = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "rust",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        keys = {
            { "<leader>cf", vim.lsp.buf.format },
            { "<leader>cr", vim.lsp.buf.rename },
            { "<leader>gd", vim.lsp.buf.definition },
            { "<leader>gD", vim.lsp.buf.declaration },
            { "<leader>gr", vim.lsp.buf.references },
            { "<leader>gi", vim.lsp.buf.implementations },
            { "K", vim.lsp.buf.hover },
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
        },
        config = function(_, opts)
            require("mason").setup({})
            require("mason-lspconfig").setup(opts)
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    local settings = lsp_settings[server_name] or {}
                    require("lspconfig")[server_name].setup({ settings = settings })
                end,
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        opts = {
            ensure_installed = { "black", "jq" },
            automatic_installation = false,
            handlers = {},
        },
        config = function(_, opts)
            require("mason-null-ls").setup(opts)
            require("null-ls").setup({sources = {}})
        end,
    },
}
