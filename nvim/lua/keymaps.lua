local default = { silent = true }keu
local set = vim.keymap.set

set('n', '<leader><Tab>', '<cmd>b#<CR>', default)

-- Telescope
set('n', '<leader>.', '<cmd>Telescope find_files<CR>', default)
set('n', '<leader>,', '<cmd>Telescope buffers<CR>', default)
set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', default)
set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', default)
set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', default)
set('n', '<leader>fb', '<cmd>Telescope file_browser<CR>', default)
set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', default)
set('n', '<leader>fc', '<cmd>Telescope commands<CR>', default)
set('n', '<leader>fm', '<cmd>Telescope<CR>', default)
set('n', '<leader>fn', function()
  require("telescope.builtin").find_files { cwd = "~/.config/nvim" }
end, default)
set('n', '<leader>fd', function()
  require("telescope.builtin").find_files { cwd = "~/.config/" }
end, default)

-- Bufferline
set('n', '<leader>bp', '<cmd>bp<cr>', default)
set('n', '<leader>bn', '<cmd>bn<cr>', default)
set('n', '<leader>bl', '<cmd>b#<cr>', default)
set('n', '<leader>bd', '<cmd>bd %<cr>', default)
--[[
set('n', '<leader>bj', '<cmd>BufferLineCycleNext<cr>', default)
set('n', '<leader>bk', '<cmd>BufferLineCyclePrev<cr>', default)
set('n', '<leader>bJ', '<cmd>BufferLineMoveNext<cr>', default)
set('n', '<leader>bK', '<cmd>BufferLineMovePrev<cr>', default)
set('n', '<leader>bb', '<cmd>BufferLinePick<cr>', default)
for i = 1, 9 do
  set('n', '<leader>b' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>', default)
end
--]]
-- NvimTree
set('n', '<Tab>', '<cmd>NvimTreeToggle<CR>', default)
set('n', '<leader>te', '<cmd>NvimTreeOpen<CR>', default)
set('n', '<leader>tc', '<cmd>NvimTreeClose<CR>', default)
set('n', 'gm', '<cmd>TSHighlightCapturesUnderCursor<cr>', default)

-- ToggleTerm
set('t', '<c-h>', function() require('tmux').move_left() end, default)
set('t', '<c-j>', function() require('tmux').move_down() end, default)
set('t', '<c-k>', function() require('tmux').move_top() end, default)
set('t', '<c-l>', function() require('tmux').move_right() end, default)
set('t', '<esc>', '<c-\\><c-n>', default)
set('t', '<c-t>', '<cmd>ToggleTerm<CR>', default)
-- vim.keymap.del('n', '<c-t>')
set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', default)
set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', default)
set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', default)
set('n', '<leader>tT', '<cmd>ToggleTerm direction=tab<CR>', default)
set('n', '<c-t>', ':ToggleTerm<CR>', default)
for i = 1, 9 do
  set('n', '<leader>t' .. i, ':ToggleTerm ' .. i, default)
end
-- set('n', 'tt', ':ToggleTerm', default)
--

-- LSP
set('n', '<leader>cr', function() require('cosmic-ui').rename() end, default)
set('n', '<leader>ca', function() require('cosmic-ui').code_actions() end, default)
set('n', '<leader>cf', vim.lsp.buf.formatting, default)
set('v', '<leader>cf', '<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>', default)
set('n', '<leader>ce', vim.diagnostic.open_float, default)
set('n', '<leader>cq', vim.diagnostic.setqflist, default)
set('n', '<c-n>', vim.diagnostic.goto_next, default)
set('n', '<c-p>', vim.diagnostic.goto_prev, default)
set('n', '<leader>cx', '<cmd>TroubleToggle<cr>', default)
set('n', 'gd', vim.lsp.buf.definition, default)
set('n', 'gD', vim.lsp.buf.declaration, default)
set('n', 'gi', vim.lsp.buf.implementation, default)
set('n', 'gr', vim.lsp.buf.references, default)
set('n', 'K', vim.lsp.buf.signature_help, default)

-- Git
set('n', '<leader>gg', '<cmd>NeoGit<cr>', default)
set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', default)
set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', default)
set('n', '<leader>gp', '<cmd>Gitsigns previous_hunk<cr>', default)
set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', default)
set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', default)
set('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<cr>', default)
set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', default)
set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', default)
set('n', '<leader>gl', '<cmd>Gitsigns toggle_current_line_blame<cr>', default)

-- Packer
set('n', '<leader>pp', '<cmd>PackerSync<cr>')
set('n', '<leader>pc', '<cmd>PackerCompile<cr>')
set('n', '<leader>pu', '<cmd>PackerUpdate<cr>')
set('n', '<leader>px', '<cmd>PackerClean<cr>')

-- Luasnip

local _expand_or_jump = function()
  local ls = require "luasnip"
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end

local _jump_back = function()
  local ls = require "luasnip"
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end

local _choice = function()
  local ls = require "luasnip"
  if ls.choice_active() then
    ls.change_choice(1)
  end
end

set('i', '<c-l>', _expand_or_jump)
set('i', '<c-h>', _jump_back)
set('i', '<c-b>', _choice)
set('s', '<c-l>', _expand_or_jump)
set('s', '<c-h>', _jump_back)
set('s', '<c-b>', _choice)

-- CMP

--]]
