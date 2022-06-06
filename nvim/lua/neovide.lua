local g = vim.g

g.neovide_cursor_animation_length = 0.03

local font = "JetBrainsMono Nerd Font"
local fontsize = 12
vim.api.nvim_set_option("guifont", font .. ":h" .. fontsize)

local changefont = function(amount)
  fontsize = fontsize + amount
  if fontsize < 2 then
    fontsize = 2
  end
  vim.api.nvim_set_option("guifont", font .. ":h" .. fontsize)
end

vim.keymap.set("n", "<C-+>", function() changefont(1) end)
vim.keymap.set("n", "<C-->", function() changefont(-1) end)

