return function()
  local symbols = require 'common.symbols'

  require('bufferline').setup {
    options = {
      numbers = function(opts)
        return string.format('%s.', opts.ordinal)
      end,

      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        for _, e in ipairs { 'error', 'warning', 'info', 'hint' } do
          if diagnostics_dict[e] ~= nil then
            return symbols[e]
          end
        end
        return 0
      end, --]]

      offsets = {
        {
          filetype = 'NvimTree',
          text = '',
          text_align = 'center',
        },
      },
      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = 'thin',
      always_show_bufferline = true,
    },
  }
end
