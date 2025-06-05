-- local function get_python_path(verbose)
--     -- Check if poetry is installed and available on the system
--     local poetry_installed = os.execute("command -v poetry > /dev/null 2>&1")
--
--     if poetry_installed == 0 then
--         -- Poetry is installed, try to get the Python path from it
--         local handle = io.popen("poetry env info -p 2> /dev/null")
--         if handle then
--             local poetry_env_path = handle:read("*a"):gsub("%s+$", "")
--             handle:close()
--             -- If poetry env info succeeded and returned a path
--             if poetry_env_path and poetry_env_path ~= "" then
--                 local python_path = poetry_env_path .. "/bin/python"
--                 if verbose then
--                     print("Poetry environment found: " .. python_path)
--                 end
--                 return python_path
--             end
--         end
--     end
--
--     local venv_exists = os.execute("[ -d .venv ] > /dev/null 2>&1")
--
--     if venv_exists == 0 then
--         -- Use .venv/bin/python if it exists
--         local default_path = ".venv/bin/python"
--         if verbose then
--             print(".venv found: " .. default_path)
--         end
--         return default_path
--     else
--         -- No .venv directory found
--         return "python" -- Use system Python as last resort
--     end
-- end

local lsp_settings = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim", "Snacks" },
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
        -- on_attach = function()
        --     local python_path = get_python_path(true)
        --     vim.lsp.config("pyright", { settings = { pythonPath = python_path } })
        -- end,
        settings = {
            pyright = { autoImportCompletion = true },
            python = { pythonPath = ".venv/bin/python" },
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
            { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action" },
            { "<leader>cr", vim.lsp.buf.rename, desc = "LSP Rename Symbol" },
            { "L", vim.diagnostic.open_float, desc = "Open Diagnostics Float" },
        },
    },
    {
        "williamboman/mason.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        tag = "v2.0.0",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            for key, val in pairs(lsp_settings) do
                vim.lsp.config(key, val)
            end
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua", lsp_format = "fallback" },
                    python = { "ruff_format", "ruff_organize_imports" },
                    toml = { "pyproject-fmt" },
                    rust = { "rustfmt" },
                    json = { "jq" },
                },
            })
            vim.keymap.set("n", "<leader>cf", function()
                require("conform").format()
            end, { silent = true })
        end,
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         local dmypy = require("lint").linters.dmypy
    --         --[[ assert(#dmypy.args == 12)
    --         local alt_func = dmypy.args[12]
    --         dmypy.args[12] = function()
    --             local ret = get_python_path(false)
    --             if ret ~= "python" then
    --                 return ret
    --             end
    --             return alt_func()
    --         end ]]
    --         dmypy.cmd = "poetry"
    --         dmypy.args = {
    --             "run",
    --             "mypy",
    --             -- "--timeout",
    --             -- "50000",
    --             "--show-column-numbers",
    --             "--show-error-end",
    --             "--hide-error-context",
    --             "--no-color-output",
    --             "--no-error-summary",
    --             "--no-pretty",
    --         }
    --
    --         require("lint").linters_by_ft = {
    --             python = { "dmypy" },
    --         }
    --         vim.keymap.set("n", "<leader>cl", function()
    --             require("lint").try_lint()
    --         end, { silent = true })
    --     end,
    -- },
    {
        "jmbuhr/otter.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
}
