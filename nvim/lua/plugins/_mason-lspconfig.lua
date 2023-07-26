return function()
    require("mason-lspconfig").setup()

    local function pyright_on_attach(context)
        local Job = require "plenary.job"
        Job
            :new({
                command = "poetry",
                args = { "env", "info", "--path" },
                on_exit = vim.schedule_wrap(function(j, return_val)
                    if return_val == 0 then
                        local path = j:result()[1]
                        vim.cmd(
                            "PyrightSetPythonPath " .. path .. "/bin/python"
                        )
                        print("Poetry env: " .. path)
                    end
                end),
            })
            :sync()
    end

    require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,

        ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        format = {
                            enable = false,
                        },
                    },
                },
            }
        end,

        -- ["ltex"] = function()
        --     require("lspconfig").ltex.setup {
        --         on_attach = function(_, _)
        --             -- your other on_attach functions.
        --             require("ltex_extra").setup {
        --                 load_langs = { "en-US", "de-DE" },
        --                 init_check = true,
        --                 path = ".ltex",
        --                 log_level = "none",
        --             }
        --         end,
        --         settings = {
        --             ltex = {
        --                 additionalRules = {
        --                     languageModel = "~/.ngrams/",
        --                     motherTounge = "de-DE",
        --                 },
        --             },
        --         },
        --     }
        -- end,

        ["texlab"] = function()
            require("lspconfig").texlab.setup {
                on_attach = function(_, bufnr)
                    vim.api.nvim_buf_set_keymap(
                        bufnr,
                        "n",
                        "<leader>r",
                        "<cmd>TexlabBuild<CR>",
                        { silent = true }
                    )
                    vim.api.nvim_buf_set_keymap(
                        bufnr,
                        "n",
                        "<leader>v",
                        "<cmd>TexlabForward<CR>",
                        { silent = true }
                    )
                end,
                settings = {
                    texlab = {
                        forwardSearch = {
                            executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                            args = { "%l", "%p", "%f" },
                        },
                        build = {
                            args = {
                                "-pdflatex=lualatex",
                                "-pdf",
                                "-interaction=nonstopmode",
                                "-shell-escape",
                                "-synctex=1",
                                "-outdir=./build",
                                "%f",
                            },
                            executable = "latexmk",
                            forwardSearchAfter = false,
                            onSave = true,
                        },
                        auxDirectory = "build",
                        latexindent = {
                            modifyLineBreaks = true,
                        },
                    },
                },
            }
        end,

        ["pyright"] = function()
            require("lspconfig").pyright.setup {
                settings = {
                    python = {
                        analysis = {
                            diagnosticsMode = "openFilesOnly",
                            typeCheckingMode = "off",
                        },
                    },
                },
                on_attach = pyright_on_attach,
            }
        end,
    }
end
