return function()
  require("catppuccin").setup {
    transparent_background = false, term_colors = false,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = true,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = false,
    },
  }

  local colors = require("catppuccin.api.colors").get_colors()
  require("catppuccin").remap {
    ColorColumn = { bg = colors.mantle },
    IndentBlanklineContextChar = { fg = colors.surface0, gui = "nocombine" },
    NeogitHunkHeader = { bg = colors.mantle, fg = colors.mantle },
    Visual = { bg = "#66556c" },
    TSH1 = { fg = colors.peach, style = "underline" },
    TSH2 = { fg = colors.blue, style = "undercurl" },
    TSH3 = { fg = colors.flamingo },
    TSH4 = { fg = colors.teal },
    TSH5 = { fg = colors.lavender },
    TSH6 = { fg = colors.mauve },
    markdownWikilink = { fg = colors.blue, style = "underline" },
    markdownWikiPath = { fg = colors.sky, style = "none" },
    markdownWikiDelimiter = { fg = colors.sky, style = "none" },
    markdownLinkDelimiter = { fg = colors.sky, style = "none" },
    markdownLinkTextDelimiter = { fg = colors.sky, style = "none" },
    mkdHeading = { fg = "#7fa19c", style = "italic" },
    markdownH1Delimiter = { fg = "#7fa19c", style = "italic" },
    markdownH1 = { fg = "#7fa19c", style = "italic" },
    htmlH1 = { fg = "#7fa19c", style = "italic" },
    TSHMarker = { fg = colors.gray0 },
    TSPunctSpecial = { fg = colors.gray0 },
    mkdxCheckboxEmpty = { fg = colors.red },
    mkdxCheckboxComplete = { fg = colors.green },
    mkdxCheckboxPending = { fg = colors.yellow },
  }

  vim.cmd [[colorscheme catppuccin]]
end
