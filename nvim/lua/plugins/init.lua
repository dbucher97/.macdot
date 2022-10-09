local present, packer = pcall(require, "init_packer")

if not present then
  return false
end


local setup = function(use)
  use { "nvim-lua/plenary.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "nathom/filetype.nvim" }

  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = require "plugins._catppuccin",
  --   -- after = "packer.nvim",
  -- }

  -- }
  use {
    "NTBBloodbath/doom-one.nvim",
    setup = function()
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 10
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = false
      vim.g.doom_one_plugin_whichkey = false
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = false
      vim.g.doom_one_plugin_lspsaga = false
    end,
    config = function()
      vim.cmd [[colorscheme doom-one]]
    end
  }


  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  use {
    "kyazdani42/nvim-web-devicons",
    after = "packer.nvim",
  }

  use {
    "glepnir/dashboard-nvim",
    after = "packer.nvim",
    config = require('plugins._dashboard'),
  }

  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-web-devicons",
    config = require('plugins._lualine'),
  }

  -- use { "akinsho/bufferline.nvim",
  --   after = "nvim-web-devicons",
  --   config = require "plugins._bufferline"
  -- }

  use {
    -- "aserowy/tmux.nvim",
    "dbucher97/tmux.nvim",
    config = require "plugins._tmux",
    after = "nvim-web-devicons",
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = require "plugins._indent-blankline",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = require "plugins._nvim-colorizer",
  }

  use { "romainl/vim-cool", event = "BufRead" }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    config = require "plugins._treesitter",
    run = ":TSUpdate",
  }

  use {
    "danymat/neogen",
    opt = true,
    config = require "plugins._neogen",
    setup = function() require("common").lazy_load("neogen") end
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = require "plugins._gitsigns",
    opt = true,
    setup = function() require("common").lazy_load("gitsigns.nvim") end
  }

  --   use {
  --     "andymass/vim-matchup",
  --     opt = true,
  --     setup = function() require("common").lazy_load("vim-matchup") end,
  --   }

  use {
    "neovim/nvim-lspconfig",
    opt = true,
    setup = function()
      require("common").lazy_load("nvim-lspconfig")
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    config = require("plugins._lspconfig"),
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = require "plugins._null-ls",
    opt = true,
    after = 'nvim-lspconfig',
  }

  -- use {
  --   "mickael-menu/zk-nvim",
  --   config = require "plugins._zk-nvim",
  --   opt = true,
  --   setup = {
  --     require("common").lazy_load("zk-nvim")
  --   }
  -- }

  use {
    "akinsho/toggleterm.nvim",
    config = require "plugins._toggleterm",
    opt = true,
    setup = {
      require("common").lazy_load("toggleterm.nvim")
    }
  }

  -- use {
  --   "RRethy/vim-illuminate",
  --   opt = true,
  --   setup = {
  --     require("common").lazy_load("vim-illuminate")
  --   }
  -- }

  -- use {
  --   "CosmicNvim/cosmic-ui",
  --   config = require "plugins._cosmic-ui",
  --   requires = { 'MunifTanjim/nui.nvim' },
  --   opt = true,
  --   setup = {
  --     require("common").lazy_load("cosmic-ui")
  --   }
  -- }
  --
  -- use {
  --   'sunjon/shade.nvim',
  --   config = require "plugins._shade"
  -- }
  --   use {
  --     "ray-x/lsp_signature.nvim",
  --     enabled = false,
  --     after = "nvim-lspconfig",
  --     config = require('plugins._lsp_signature'),
  --   }

  use {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = { "InsertEnter", "CmdlineEnter" },
  }
  use {
    "onsails/lspkind-nvim",
    after = "friendly-snippets",
    config = require "plugins._lspkind",
  }
  use {
    "hrsh7th/nvim-cmp",
    after = "lspkind-nvim",
    config = require "plugins._nvim-cmp",
  }
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = require "plugins._luasnip",
  }
  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }
  use { "hrsh7th/cmp-cmdline", after = "cmp-path" }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = require "plugins._nvim-autopairs",
  }
  use { "tpope/vim-surround", after = "nvim-autopairs" }


  use {
    "kyazdani42/nvim-tree.lua",
    config = require "plugins._nvim-tree",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  }

  use {
    "numToStr/Comment.nvim",
    config = require "plugins._comment",
    keys = { "gc", "gcc" },
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-telescope/telescope-file-browser.nvim" },
    config = require "plugins._telescope",
    after = "nvim-web-devicons"
  }

  -- use {
  --   "folke/which-key.nvim",
  --   config = require "plugins._which-key",
  -- }

  use {
    "TimUntersberger/neogit",
    requires = { "sindrets/diffview.nvim" },
    config = require "plugins._neogit",
    cmd = { "Neogit" },
  }

  use {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  }

  use {
    "folke/trouble.nvim",
    config = require "plugins._trouble",
    cmd = "TroubleToggle",
  }

  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
    event = "BufEnter"
  }

  use {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" }
  }
end

return packer.startup { setup }

--[[

local setup = function(use)

  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    event = evt_file,
  }


  -- use { 'henriquehbr/nvim-startup.lua', config = require 'plugins._nvim-startup' }

  -- Project
  -- use { "ahmedkhalf/project.nvim", config = require "plugins._project" }


  -- Configuration
  use { "rafcamlet/nvim-luapad", cmd = "Luapad" }

  -- Markdown
  use { "ellisonleao/glow.nvim", cmd = "Glow" }

  -- use { "preservim/vim-markdown", requires = {'godlygeek/tabular'} }
  use { "SidOfc/mkdx", config = require "plugins._mkdx" }

  use { "jbyuki/nabla.nvim" }

  use { "jkramer/vim-checkbox" }

  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }


  use { "neovim/nvim-lspconfig", config = require "plugins._lsp-config" }
  use {
    "williamboman/nvim-lsp-installer",
    config = require "plugins._nvim-lsp-installer",
  }

  -- use {
  --   "lervag/vimtex",
  --   config = require "plugins._vimtex",
  --   filetype = { "tex", "bib" },
  -- }



  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = require "plugins._null-ls",
    event = evt_file,
  }

--]]
