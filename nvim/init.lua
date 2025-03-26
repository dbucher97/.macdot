vim.g.mapleader = " "
vim.g.maplocalleader = " "

local indent = 4

vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = indent -- Size of an indent
vim.o.smartindent = true -- Insert indents automatically
vim.o.tabstop = indent -- Number of spaces tabs count for
vim.o.spelllang = "en"
vim.o.scrolloff = 4 -- Lines of context
vim.o.termguicolors = true -- True color support
vim.o.mouse = "a" -- Enable Mouse support
vim.o.background = "dark"
vim.o.textwidth = 88 -- Set text width
vim.o.list = true -- Show some invisible characters
vim.o.listchars = "tab:> ,trail:•" -- Define chars to show instead:
vim.o.relativenumber = true -- Relative line numbers
vim.o.wrap = true -- Enable line wrap
vim.o.signcolumn = "yes:1" -- Always show signcolumn on left
vim.o.colorcolumn = "89" -- Display color column
vim.o.cursorline = true
vim.o.pumheight = 30
vim.o.undofile = true
-- vim.o.hidden = false


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

-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme onedark]])


vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
-- vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<leader><tab>", ":b#<cr>", {silent = true})
