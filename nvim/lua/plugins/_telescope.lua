return function()
    require("telescope").setup {
        defaults = {
            mappings = {
                i = {
                    ["<C-h>"] = "which_key",
                    ["<Esc>"] = "close",
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
            prompt_prefix = "   ",
            selection_caret = " ",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 80,
            },
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        pickers = {
            lsp_code_actions = {
                theme = "cursor",
            },
            lsp_range_code_actions = {
                theme = "cursor",
            },
        },
    }

    require("telescope").load_extension "file_browser"

    -- require 'telescope'.load_extension 'themes'
end
