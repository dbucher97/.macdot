return function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	cmp.setup({
		completion = {
			keyword_length = 1,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "nvim_lua" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "neorg" },
			{ name = "buffer", keyword_length = 3 },
		},
		mapping = {
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }, { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = false }, { "i", "c" }),
		},
		experimental = {
			ghost_text = true,
		},
		formatting = {
			format = lspkind.cmp_format({
				with_text = false,
				maxwidth = 50,
				menu = {
					buffer = "[buf]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[api]",
					path = "[path]",
					luasnip = "[snip]",
				},
			}),
		},
		window = {
			documentation = {
				border = "rounded",
			},
		},
	})

	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer", keyword_length = 3 },
		},
	})

	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path", keyword_length = 2 },
		}, {
			{ name = "cmdline", keyword_length = 2 },
		}),
	})
end
