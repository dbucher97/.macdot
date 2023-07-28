return {
    --     {
    --         "hrsh7th/nvim-cmp",
    --         dependencies = {
    --             'hrsh7th/cmp-nvim-lsp',
    --             'hrsh7th/cmp-buffer',
    --             'hrsh7th/cmp-path',
    --             'hrsh7th/cmp-cmdline',
    --             'petertriho/cmp-git',
    --         },
    --         event = { "InsertEnter", "CmdwinEnter" },
    --         config = function()
    --             local cmp = require 'cmp'
    --             cmp.setup {
    --                 sources = cmp.config.sources({
    --                     { name = 'nvim_lsp' },
    --                     { name = "path" },
    --                 }, {
    --                     { name = 'buffer' },
    --                 })
    --             }
    --         end
    --     }
    { 'echasnovski/mini.completion', version = '*', config = true, }
}
