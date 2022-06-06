return function()
  local wk = require "which-key"
  wk.setup {
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<CR>"] = "RET",
      ["<tab>"] = "TAB",
      ["<Tab>"] = "TAB",
      ["<leader>"] = "SPC",
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 10,
    },
  }

  -- Extend defaults
  wk.register({
    ["<space>"] = "Leader",
    ["g"] = "Go",
    ["z"] = "Folds and Spell",
    ["["] = "Previous",
    ["]"] = "Next",
    ["gnn"] = "Treesitter scope selection",
    ["gm"] = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "TS highlight group" },
  }, {})
  --[[ wk.register({
    ['<ScrollWheelUp>'] = { '<C-y>', 'which_key_ignore' },
    ['<ScrollWheelDown>'] = { '<C-e>', 'which_key_ignore' },
  }, { mode = 'n' }) ]]

  wk.register({
    ["<c-h>"] = { "<cmd>lua require('tmux').move_left()<cr>", "Goto window left" },
    ["<c-j>"] = { "<cmd>lua require('tmux').move_bottom()<cr>", "Goto window down" },
    ["<c-k>"] = { "<cmd>lua require('tmux').move_top()<cr>", "Goto window up" },
    ["<c-l>"] = { "<cmd>lua require('tmux').move_right()<cr>", "Goto window right" },
  }, { mode = "v" })
  wk.register({
    ["<c-h>"] = { "<cmd>lua require('tmux').move_left()<cr>", "Goto window left" },
    ["<c-j>"] = { "<cmd>lua require('tmux').move_bottom()<cr>", "Goto window down" },
    ["<c-k>"] = { "<cmd>lua require('tmux').move_top()<cr>", "Goto window up" },
    ["<c-l>"] = { "<cmd>lua require('tmux').move_right()<cr>", "Goto window right" },
    ["<esc>"] = "Exit terminal mode",
    ["<c-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  }, { mode = "t" })
  vim.cmd[[tnoremap <Esc> <C-\><C-n>]]
  wk.register({
    ["<c-h>"] = "Goto window left",
    ["<NL>"] = "Goto window down",
    ["<c-k>"] = "Goto window up",
    ["<c-l>"] = "Goto window right",

    ["<tab>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    g = {
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
      i = {
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        "Goto implementation",
      },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<C-n>"] = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next diagnostic",
    },
    ["<C-p>"] = {
      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
      "Previous diagnostic",
    },
  }, {})

  wk.register({
    ["?"] = { "<cmd>WhichKey<cr>", "Open WhichKey" },
    ["."] = { "<cmd>Telescope find_files<cr>", "Find File" },
    [","] = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    ["+"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    ["<Tab>"] = { "<cmd>b#<cr>", "Last Buffer" },
    f = {
      name = "Find/File",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      v = {
        '<cmd>lua require("telescope.builtin").find_files{cwd="~/.config/nvim"}<cr>',
        "Find Nvim",
      },
      d = {
        '<cmd>lua require("telescope.builtin").find_files{cwd="~/.config"}<cr>',
        "Find Dotfiles",
      },
      g = { "<cmd>Telescope live_grep<cr>", "Find Word" },
      h = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
      c = { "<cmd>Telescope commands<cr>", "Find Commands" },
      m = { "<cmd>Telescope <cr>", "Commands" },
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      n = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Find notes" },
    },
    b = {
      name = "Buffers",
      p = { "<cmd>bp<cr>", "Previous Buffer" },
      n = { "<cmd>bn<cr>", "Next Buffer" },
      l = { "<cmd>b#<cr>", "Last Buffer" },
      d = { "<cmd>bd<cr>", "Close Buffer" },
      j = { "<cmd>BufferLineCyclePrev<cr>", "Next Buffer on Line" },
      k = { "<cmd>BufferLineCycleNext<cr>", "Previous Buffer on Line" },
      J = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer right" },
      K = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer left" },
      ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go to Buffer 1" },
      ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go to Buffer 2" },
      ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go to Buffer 3" },
      ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go to Buffer 4" },
      ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go to Buffer 5" },
      ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Go to Buffer 6" },
      ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Go to Buffer 7" },
      ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Go to Buffer 8" },
      ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Go to Buffer 9" },
      ["0"] = { "<cmd>BufferLineGoToBuffer 10<cr>", "Go to Buffer 10" },
      b = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
    },
    c = {
      name = "Code",
      -- d = { '', "Type Definition" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename object" },
      a = { "<cmd>CodeActionMenu<CR>", "Code actions" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format file" },
      e = {
        "<cmd>lua vim.lsp.diagnostic.open_float()<CR>",
        "Open Diagnostics",
      },
      q = {
        "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
        "Open location list",
      },
      w = {
        name = "workspace",
        a = {
          "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
          "Add workspace folder",
        },
        r = {
          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
          "Remove workspace folder",
        },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          "List workspace folders",
        },
      },
      x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    },
    g = {
      name = "Git",
      g = { "<cmd>Neogit<cr>", "Toggle NeoGit" },
      h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
      n = { "<cmd>Gitsigns next_hunk<cr>", "Go to next hunk" },
      p = { "<cmd>Gitsigns prev_hunk<cr>", "Go to previous hunk" },
      s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
      u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
      r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
      R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
      S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },
      b = {
        '<cmd>lua require"gitsigns".blame_line{full=true}<cr>',
        "Blame hunk",
      },
    },
    n = {
      name = "Zettels",
      n = { "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", "New note" },
      a = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Find notes" },
      j = { "<cmd>ZkFleeting<cr>", "New fleeting note" },
      m = { "/[[<cr>", "Navigate links" },
      q = {
        name = "Special notes",
        d = { "<cmd>ZkDailies { sort = { 'modified' } }<cr>", "Find daily notes" },
        f = { "<cmd>ZkFleetings { sort = { 'modified' } }<cr>", "Find fleeting notes" },
        l = { "<cmd>ZkLitertaures { sort = { 'modified' } }<cr>", "Find literature notes" },
      },
      t = { "<cmd>ZkTags<cr>", "Show tags" },
      b = { "<cmd>ZkBacklinks<cr>", "Show backlinks" },
      l = { "<cmd>ZkLinks<cr>", "Show Links" },
      s = {
        "<cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<cr>",
        "Search in notes",
      },
      g = {
        '<cmd>lua require("telescope.builtin").live_grep{cwd=vim.env.ZK_NOTEBOOK_DIR}<cr>',
        "Live grep in notes",
      },
      d = { "<cmd>ZkToday<cr>", "Goto daily note" },
      y = { "<cmd>ZkFrom yesterday<cr>", "Goto yesterday's daily note" },
      i = { "<cmd>ZkILink { sort = { 'modified' }}<cr>", "Insert link" },
      o = { "<cmd>ZkITag<cr>", "Insert tag" },
      p = { "<cmd>ZkSketch<cr>", "Insert iPad sketch" }
    },
    p = {
      name = "Packer",
      p = { "<cmd>PackerSync<cr>", "Sync" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      x = { "<cmd>PackerClean<cr>", "Clean" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    ["<C-t>"] = {"<cmd>ToggleTerm<cr>", "Toggle terminal"},
    t = {
      name = "Terminal",
      t = {"<cmd>ToggleTerm<cr>", "Toggle terminal"},
      v = {"<cmd>ToggleTerm direction=vertical size=80<cr>", "Toggle terminal vertical"},
      a = {"<cmd>ToggleTermToggleAll<cr>", "Toggle all terminals"},
      f = {"<cmd>ToggleTerm direction=float<cr>", "Toggle terminal float"},
      b = {"<cmd>ToggleTerm direction=tab<cr>", "Toggle terminal tab"},
      ["1"] = {"<cmd>ToggleTerm 1<cr>", "Toggle terminal 1"},
      ["2"] = {"<cmd>ToggleTerm 2<cr>", "Toggle terminal 2"},
      ["3"] = {"<cmd>ToggleTerm 3<cr>", "Toggle terminal 3"},
      ["4"] = {"<cmd>ToggleTerm 4<cr>", "Toggle terminal 4"},
      ["5"] = {"<cmd>ToggleTerm 5<cr>", "Toggle terminal 5"},
      ["6"] = {"<cmd>ToggleTerm 6<cr>", "Toggle terminal 6"},
      ["7"] = {"<cmd>ToggleTerm 7<cr>", "Toggle terminal 7"},
      ["8"] = {"<cmd>ToggleTerm 8<cr>", "Toggle terminal 8"},
      ["9"] = {"<cmd>ToggleTerm 9<cr>", "Toggle terminal 9"},
    },
    l = { name = "Language" },
  }, { prefix = "<leader>" })

  wk.register({
    c = {
      f = { ":'<,'>lua vim.lsp.buf.range_formatting()<CR>", "Format range" },
    },
    n = {
      name = "Zettels",
      t = {
        ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
        "New note from selected title",
      },
      c = {
        ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
        "New note from selected content",
      },
      f = { ":'<,'>ZkMatch<CR>", "Match selected text" },
    },
  }, { prefix = "<leader", mode = "v" })

  wk.register({
    ["<c-z>"] = { "<cmd>ZkILink { sort = { 'modified' }}<cr>", "Insert link to node" },
    ["<c-t>"] = { "<cmd>ZkITag<cr>", "Insert tag" },
  }, { mode = "i" })

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

  wk.register({
    ["<c-l>"] = { _expand_or_jump, "Expand or jump snippet" },
    ["<c-h>"] = { _jump_back, "Jump back in snippet" },
    ["<c-b>"] = { _choice, "Active snippet choice" },
  }, { mode = "i" })

  wk.register({
    ["<c-l>"] = { _expand_or_jump, "Expand or jump snippet" },
    ["<c-h>"] = { _jump_back, "Jump back in snippet" },
    ["<c-b>"] = { _choice, "Active snippet choice" },
  }, { mode = "s" })

  --------------------------------------------------------------------------------
  -- Just descritpions
  -- surround
  wk.register({
    ["cs"] = "Change surroundings",
    -- ['cq'] = { 'cs\'"', 'Single quotes to double quotes' },
    -- ['cQ'] = { 'cs"\'', 'Double quotes to single quotes' },
    ["ds"] = "Delete surroundings",
    ["ys"] = "Add surroundings",
    ["yss"] = "Add surroundings to line",
    ["gc"] = "Comment",
    ["gb"] = "Block comment",
    ["gbc"] = "Block comment current line",
    ["gcc"] = "Comment current line",
    ["gcA"] = "Comment at end of line",
    ["gcO"] = "Comment above line",
    ["gco"] = "Comment below line",
  }, {})

  wk.register({
    ["gS"] = "Wrap line in surrounding",
    ["S"] = "Wrap line in surrounding",
    ["gc"] = "Comment",
    ["gb"] = "Block comment",
  }, { mode = "n" })

  --------------------------------------------------------------------------------
  -- File Type spceific bindings
  --
  _G._registerNvimTree = function()
    local buf = vim.api.nvim_get_current_buf()
    require("which-key").register({
      a = { "Add new file", buffer = buf },
      ["-"] = { "Dir up", buffer = buf },
      ["<2-LeftMouse>"] = { "Open file/folder", buffer = buf },
      ["<cr>"] = { "Open file/folder", buffer = buf },
      o = { "Open file/folder", buffer = buf },
      O = { "Open file/folder no pick", buffer = buf },
      ["<2-RightMouse>"] = { "Change dir", buffer = buf },
      ["+"] = { "Change dir", buffer = buf },
      ["<C-]>"] = { "Change dir", buffer = buf },
      ["<C-v>"] = { "Vertical split", buffer = buf },
      ["<C-x>"] = { "Horizontal split", buffer = buf },
      ["<C-t>"] = { "New tab", buffer = buf },
      ["<C-r>"] = { "Full rename", buffer = buf },
      ["<"] = { "Previous Sibling", buffer = buf },
      [">"] = { "Next Sibling", buffer = buf },
      ["P"] = { "Parent Node", buffer = buf },
      ["<bs>"] = { "Close Node", buffer = buf },
      K = { "First Sibling", buffer = buf },
      J = { "Last Sibling", buffer = buf },
      H = { "Toggle dotfiles", buffer = buf },
      I = { "Toggle ignored", buffer = buf },
      d = { "Delete file", buffer = buf },
      D = { "Trash file", buffer = buf },
      r = { "Rename file", buffer = buf },
      R = { "Refress NvimTree", buffer = buf },
      x = { "Cut file", buffer = buf },
      c = { "Copy file", buffer = buf },
      p = { "Paste file", buffer = buf },
      y = { "Copy rename file", buffer = buf },
      Y = { "Copy path of file", buffer = buf },
      ["gy"] = { "Copy absolut path", buffer = buf },
      ["[c"] = { "Previous Git item", buffer = buf },
      ["]c"] = { "Next Git item", buffer = buf },
      s = { "Open in Finder", buffer = buf },
      q = { "Close NvimTree", buffer = buf },
      ["g?"] = { "Toggle NvimTree Help", buffer = buf },
    }, {})
  end

  _G._registerTrouble = function()
    local buf = vim.api.nvim_get_current_buf()
    require("which-key").register({
      ["<c-t>"] = { "Open in new tab", buffer = buf },
      ["<c-x>"] = { "Open in horizontal split", buffer = buf },
      ["<c-v>"] = { "Open in vertical split", buffer = buf },
      ["<tab>"] = { "Open/Toggle fold", buffer = buf },
      m = { "Toggle mode", buffer = buf },
      o = { "Jump and quit", buffer = buf },
      p = { "Preview", buffer = buf },
      P = { "Toggle preview", buffer = buf },
      q = { "Quit", buffer = buf },
      r = { "Refresh", buffer = buf },
      ["<cr>"] = { "Jump", buffer = buf },
    }, {})
  end

  vim.cmd [[
augroup WhichKeyFT
autocmd!
autocmd FileType NvimTree lua _registerNvimTree()
autocmd FileType Trouble lua _registerTrouble()
augroup END
]]

  _G._registerLang = function(lang)
    local dict = require("plugins._which-key-langs")[lang]
    if dict == nil or next(dict) == nil then
      return
    end
    local buf = vim.api.nvim_get_current_buf()
    for _, v in pairs(dict) do
      v.buffer = buf
    end
    require("which-key").register({
      l = dict,
    }, { prefix = "<leader>" })
  end

  local ac = [[augroup WhichKeyLangs\
autocmd!
]]

  for k, _ in pairs(require "plugins._which-key-langs") do
    ac = ac .. "autocmd FileType " .. k .. " lua _registerLang('" .. k .. "')\n"
  end

  ac = ac .. [[augroup END
]]

  vim.cmd(ac)
end
