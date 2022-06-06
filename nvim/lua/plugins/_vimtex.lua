return function ()
  local g = vim.g
  g.vimtex_imaps_enabled = 0
  g.vimtex_view_method = 'skim'
  g.vimtex_view_skim_sync = 1
  g.vimtex_quickfix_enabled = 0
  g.vimtex_compiler_latexmk = {
    ["build_dir"] = "build",
    ["callback"] = 1,
    ["continuous"] = 1,
    ["options"] = {"-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode"}
  }

  vim.cmd[[imap <C-e> <Plug>(vimtex-delim-close)]]

  -- g.vimtex_view_skim_reading_bar = 1
end
