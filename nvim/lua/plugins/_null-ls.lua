return function()
	local nls = require("null-ls")
	local formatting = nls.builtins.formatting
	nls.setup({
		sources = {
			formatting.prettierd,
			formatting.blue,
			nls.builtins.code_actions.gitsigns,
		},
	})
end
