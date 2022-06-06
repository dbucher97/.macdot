return function()
  local nls = require 'null-ls'
  local formatting = nls.builtins.formatting
  nls.setup {
    sources = {
      formatting.stylua,
      formatting.prettierd,
    },
  }
end
