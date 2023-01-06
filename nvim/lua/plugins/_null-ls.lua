return function()
    require "null-ls".setup()
    require 'mason-null-ls'.setup_handlers()
    -- local nls = require "null-ls"
    -- local formatting = nls.builtins.formatting
    -- nls.setup {
    --     sources = {
    --         formatting.prettierd,
    --         formatting.blue,
    --         nls.builtins.code_actions.gitsigns,
    --     },
    -- }
end
