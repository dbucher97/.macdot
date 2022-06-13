return function()
  local nls = require 'null-ls'
  local formatting = nls.builtins.formatting
  nls.setup {
    sources = {
      formatting.stylua,
      formatting.prettierd,
      formatting.black,
      nls.builtins.code_actions.gitsigns,
    },
  }
end
