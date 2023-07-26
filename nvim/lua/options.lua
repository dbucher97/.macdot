--- Global settings for neovim

-- Disableing builtin plugins that are not needed
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- use filetype.nvim
vim.g.did_load_filetypes = 1

-- use treesitter
-- vim.cmd[[syntax off]]

local indent = 4

vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = indent -- Size of an indent
vim.o.smartindent = true -- Insert indents automatically
vim.o.tabstop = indent -- Number of spaces tabs count for
-- vim.o.softtabstop = indent -- Number of spaces tabs count for
vim.o.spelllang = "en"
vim.o.hidden = true -- Enable modified buffers in bg
vim.o.ignorecase = true -- Ignore case
vim.o.joinspaces = false -- No double spaces with join
vim.o.scrolloff = 4 -- Lines of context
vim.o.shiftround = true -- Round indent
vim.o.sidescrolloff = 1 -- Columns of context
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.termguicolors = true -- True color support
vim.o.mouse = "a" -- Enable Mouse support
vim.o.showmatch = true -- Show matching brackets
vim.o.foldlevelstart = 99
vim.o.fillchars = "fold:-"
vim.o.completeopt = "menuone,noselect"

vim.o.background = "dark"
vim.o.textwidth = 88 -- Set text width
vim.o.list = true -- Show some invisible characters
vim.o.listchars = "tab:> ,trail:•" -- Define chars to show instead:
vim.o.number = true -- Print line number
-- vim.o.relativenumber = true -- Relative line numbers
vim.o.wrap = true -- Enable line wrap
vim.o.signcolumn = "yes:1" -- Always show signcolumn on left
vim.o.colorcolumn = "89" -- Display color column
vim.o.cursorline = true
vim.o.pumheight = 15
vim.o.undofile = true

vim.g.tex_flavor = "latex"

vim.o.laststatus = 3

-- vim.cmd [[autocmd FileType python,json setlocal sw=4 | setlocal ts=4]]

-- need to move to setup in packer
-- needs to be loaded before plugin, packer.config seems to be uneventful.
vim.g.kitty_navigator_no_mappings = 1

vim.g.mkdp_auto_close = 0
vim.g.vimtex_quickfix_open_on_warnings = 0

if vim.g.neovide then
    require "neovide"
end
