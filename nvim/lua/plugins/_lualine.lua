return function()
  local evil_conf = require("plugins._lualine-evil")
  evil_conf = vim.tbl_extend("force", evil_conf, { extensions = { 'nvim-tree', 'quickfix' } })
  require("lualine").setup(evil_conf)
  --[[
  require("lualine").setup {
    options = {
      theme = "onedark",
      component_separators = '',
      section_separators = '',
    },
    sections = {
      lualine_a = { function() return "x" end },
      lualine_b = {
        {
          'filename',
          path = 0,
          symbols = { modified = ' ', readonly = ' ' },
        },
      },
      lualine_c = { 'diagnostics' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'branch', 'diff' },
      lualine_z = { 'progress', 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {
        {
          'filename',
          path = 0,
          symbols = { modified = ' ', readonly = ' ' },
        },
      },
      lualine_c = {},
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { 'nvim-tree', 'quickfix' },
  }
]]
end
