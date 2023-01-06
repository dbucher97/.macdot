local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	texlab = {
		-- root_dir = require('lspconfig.util').root_pattern'main.tex',
		settings = {
			texlab = {
				diagnosticsDelay = 150,
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
						-- "-outdir=./build",
						"%f",
					},
					executable = "latexmk",
					forwardSearchAfter = false,
					onSave = true,
				},
				-- auxDirectory = "build",
				chktex = {
					onEdit = true,
				},
				latexindent = {
					modifyLineBreaks = true,
				},
			},
		},
	},
	tsserver = {},
	emmet_ls = {
		capabilities = capabilities,
		filetypes = { "html", "css", "typescriptreact", "javascriptreact", "svelte" },
	},
	-- pylsp = {}
	pyright = {
		settings = {
			python = {
				venvPath = "/opt/homebrew/Caskroom/miniforge/base/envs/",
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "off",
				},
			},
		},
	},
	rust_analyzer = {},
}
