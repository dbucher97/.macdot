--  ____              _     _ _       _   _                 _
-- |  _ \  __ ___   _(_) __| ( )___  | \ | | ___  _____   _(_)_ __ ___
-- | | | |/ _` \ \ / / |/ _` |// __| |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |_| | (_| |\ V /| | (_| | \__ \ | |\  |  __/ (_) \ V /| | | | | | |
-- |____/ \__,_| \_/ |_|\__,_| |___/ |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- For Neovim version 0.7

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local core_modules = { 'options', 'plugins' }

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error Loading " .. module .. "\n\n" .. err)
  end
end

-- require 'functions'

-- vim.cmd [[
-- augroup auto_update
-- autocmd!
-- autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua :so % | PackerSync
-- autocmd BufWritePost ~/.config/nvim/lua/plugins/_*.lua :PackerCompile
-- augroup END
-- ]]
