local function get_python_path()
    -- Check if poetry is installed and available on the system
    local poetry_installed = os.execute("command -v poetry > /dev/null 2>&1")

    if poetry_installed then
        -- Poetry is installed, try to get the Python path from it
        local handle = io.popen("poetry env info -p 2>/dev/null")
        if handle then
            local poetry_env_path = handle:read("*a"):gsub("%s+$", "")
            handle:close()
            -- If poetry env info succeeded and returned a path
            if poetry_env_path and poetry_env_path ~= "" then
                local python_path = poetry_env_path .. "/bin/python"
                print("Poetry environment found: " .. python_path)
                return python_path
            end
        end
    end

    local venv_exists = os.execute("[ -d .venv ] > /dev/null 2>&1")

    if venv_exists then
        -- Use .venv/bin/python if it exists
        local default_path = ".venv/bin/python"
        print(".venv found: " .. default_path)
        return default_path
    else
        -- No .venv directory found
        return "python" -- Use system Python as last resort
    end
end

local lsp_settings = {
    lua_ls = {
        settings = {
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
    },
    pyright = {
        on_attach = function()
            local python_path = get_python_path()
            vim.schedule(function ()
                vim.cmd("PyrightSetPythonPath " .. python_path)
            end)
        end,
        settings = {
            pyright = { autoImportCompletion = true },
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "off",
                },
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
        lazy = true,
        keys = {
            { "<leader>cf", vim.lsp.buf.format },
            { "<leader>cr", vim.lsp.buf.rename },
            { "gd", vim.lsp.buf.definition },
            { "gD", vim.lsp.buf.declaration },
            { "gr", vim.lsp.buf.references },
            { "gi", vim.lsp.buf.implementations },
            { "K", vim.lsp.buf.hover },
            { "<c-K>", vim.lsp.buf.signature_help, mode = "i" },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
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
                    require("lspconfig")[server_name].setup(settings)
                end,
            })
        end,
    },
    -- {
    --     "jay-babu/mason-null-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "jose-elias-alvarez/null-ls.nvim",
    --     },
    --     opts = {
    --         ensure_installed = { "jq" },
    --         automatic_installation = false,
    --         handlers = {},
    --     },
    --     config = function(_, opts)
    --         require("mason-null-ls").setup(opts)
    --         require("null-ls").setup({ sources = {} })
    --     end,
    -- },
    {
        "danymat/neogen",
        config = true,
    },
}
