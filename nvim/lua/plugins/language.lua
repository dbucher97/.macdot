vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client == nil then
            return
        end

        -- Only apply to texlab
        if client.name == "texlab" then

            local servername = vim.v.servername

            -- Define cache directory and file
            local cache_dir = vim.fn.stdpath("cache")
            local cache_file = cache_dir .. "/tex_servername"

            -- Ensure cache directory exists
            vim.fn.mkdir(cache_dir, "p")
            -- Write server name to cache file
            local file = io.open(cache_file, "w")
            if file then
                file:write(servername)
                file:close()
            end

            local opts = { buffer = ev.buf, silent = true }

            -- Example keymaps for texlab
            vim.keymap.set("n", "<leader>lb", "<cmd>LspTexlabBuild<CR>", opts)
            vim.keymap.set("n", "<leader>lc", "<cmd>LspTexlabCancelBuild<CR>", opts)
            vim.keymap.set("n", "<leader>ll", "<cmd>LspTexlabForward<CR>", opts)
            vim.keymap.set(
                "n",
                "<leader>ce",
                "<cmd>LspTexlabChangeEnvironment<CR>",
                opts
            )
            vim.keymap.set(
                "n",
                "<leader>fe",
                "<cmd>LspTexlabFindEnvironments<CR>",
                opts
            )
        end
    end,
})

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
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = { features = "all" },
            },
        },
    },
    texlab = {
        settings = {
            texlab = {
                build = {
                    executable = "nextonic",
                    args = {
                        "compile",
                        "--synctex",
                        "--keep-logs",
                        "--keep-intermediates",
                        "-o",
                        "build",
                        "%f",
                    },
                    onSave = true,
                    forwardSearchAfter = true,
                    auxDirectory = "build",
                    logDirectory = "build",
                    pdfDirectory = "build",
                },
                forwardSearch = {
                    executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                    args = { "-n", "-g", "-b", "%l", "%p", "%f"},
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
                "latex",
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
                    html = { "djlint" },
                    tex = { "latexindent" },
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
