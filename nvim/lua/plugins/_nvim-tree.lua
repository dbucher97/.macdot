return function()
  require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = true,
    hijack_cursor = false,
    update_cwd = false,
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    diagnostics = {
      enable = true,
      icons = require 'common.symbols',
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    filters = {
      dotfiles = true,
      custom = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    renderer = {
      indent_markers = { enable = true },
      highlight_git = true,
      highlight_opened_files = "all",
      icons = {
        show = {
          git = false,
          folder = true,
          file = true,
          folder_arrow = true,
        }
      },
    },
    view = {
      width = 30,
      hide_root_folder = true,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {
          { key = '<Tab>', action = 'close' },
          { key = '+', action = 'cd' },
        },
      },
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
    },
    trash = {
      cmd = 'trash',
      require_confirm = true,
    },

  }
end
