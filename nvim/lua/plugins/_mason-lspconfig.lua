return function()
	require("mason-lspconfig").setup()

	require("mason-lspconfig").setup_handlers({
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({})
		end,

		["sumneko_lua"] = function()
			require("lspconfig").sumneko_lua.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	})
end
