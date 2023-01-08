return function()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,

        ["sumneko_lua"] = function()
            require("lspconfig").sumneko_lua.setup {
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

        ["ltex"] = function()
            require("lspconfig").ltex.setup {
                on_attach = function(_, _)
                    -- your other on_attach functions.
                    require("ltex_extra").setup {
                        load_langs = { "en-US", "de-DE" },
                        init_check = true,
                        path = ".ltex",
                        log_level = "none",
                    }
                end,
                settings = {
                    ltex = {
                        additionalRules = {
                            languageModel = "~/.ngrams/",
                            motherTounge = "de-DE",
                        },
                    },
                },
            }
        end,

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
                    }
                }
            }
        end,
    }
end
