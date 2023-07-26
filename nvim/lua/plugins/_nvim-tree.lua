return function()
    local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<Tab>', api.tree.toggle, opts("Toggle"))
        -- vim.keymap.set('n', '+', api.tree.cd, {})
    end

    require("nvim-tree").setup {
        disable_netrw = true,
        on_attach = my_on_attach,
        hijack_netrw = true,
        open_on_tab = true,
        hijack_cursor = false,
        update_cwd = false,
        -- update_to_buf_dir = {
        --   enable = true,
        --   auto_open = true,
        -- },
        diagnostics = {
            enable = true,
            icons = require "common.symbols",
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        },
        system_open = {
            cmd = nil,
            args = {},
        },
        filters = {
            dotfiles = true,
            custom = {},
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        renderer = {
            root_folder_label = false,
            indent_markers = { enable = true },
            highlight_git = true,
            highlight_opened_files = "all",
            icons = {
                show = {
                    git = false,
                    folder = true,
                    file = true,
                    folder_arrow = true,
                },
            },
        },
        view = {
            width = 30,
            side = "left",
            -- mappings = {
            --     custom_only = false,
            --     list = {
            --         { key = "<Tab>", action = "close" },
            --         { key = "+", action = "cd" },
            --     },
            -- },
            number = false,
            relativenumber = false,
            signcolumn = "yes",
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
    }
end
