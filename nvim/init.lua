vim.g.mapleader = " "
vim.g.maplocalleader = " "

local indent = 4

vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = indent -- Size of an indent
vim.o.smartindent = true -- Insert indents automatically
vim.o.tabstop = indent -- Number of spaces tabs count for
-- vim.o.softtabstop = indent -- Number of spaces tabs count for
vim.o.spelllang = "en"

vim.o.scrolloff = 4 -- Lines of context

vim.o.termguicolors = true -- True color support
vim.o.mouse = "a" -- Enable Mouse support

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


local opts = {}

require("lazy").setup("plugins", opts)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

