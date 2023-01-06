return function()
    vim.g["mkdx#settings"] = {
        enter = { enable = 1, shift = 1, o = 0, malformed = 1 },
        highlight = { enable = 1 },
        checkbox = { toggles = { " ", "x" } },
        -- map = { enable = 0 },
        restore_visual = 0,
    }
    vim.cmd [[
  augroup md
  autocmd!
  autocmd FileType markdown hi clear markdownCodeBlock
  augroup END
  ]]
end
