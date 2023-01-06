return function()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
			max_prefix_length = 5,

			offsets = {
				{
					filetype = "NvimTree",
					text = "",
					text_align = "center",
				},
			},
			show_buffer_close_icons = true,
			show_close_icon = false,
			separator_style = "thin",
			always_show_bufferline = true,
		},
	})
end
