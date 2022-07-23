return function()
  require('indent_blankline').setup {
    filetype_exclude = { "dashboard" },
    space_char_blankline = ' ',
    show_current_context = false,
    show_current_context_start = false,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    viewport_buffer = 20,
    max_indent_increase = 2,
  }
end
