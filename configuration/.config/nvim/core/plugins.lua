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

-- Example using a list of specs with the default options
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

local plugins = {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false, -- load during startup
    priority = 1000,
    config = true,
    opts = {
      background = "dark",
    },
  },

  'tpope/vim-fugitive',
  'tpope/vim-unimpaired', -- useful keybindings for eg. fugitive plugin
  'tpope/vim-repeat',
  'tpope/vim-surround',

  'lewis6991/gitsigns.nvim',

  'preservim/nerdcommenter',

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- add sidebar tree window (for easier overview on directories structure)
  {
      'nvim-tree/nvim-tree.lua',
      event = "VeryLazy",
      dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
          'MunifTanjim/nui.nvim',
      },
  },

  -- editorconfig plugin
  {
    'editorconfig/editorconfig-vim',
    lazy = false, -- load during startup
  },

  -- Add git info message after the line
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
  },

  -- Help operating on CSV files
  {
    'mechatroner/rainbow_csv',
    event = 'VeryLazy',
  },

  --  the fastest syntax highlighter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      -- syntax highlight
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    }
  },
  --{
  --  'styled-components/vim-styled-components',
  --  branch = "main",
  --},


  -- nvim LSP completition
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Mason (should be before lsp)
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua', -- lua completitions
      'hrsh7th/cmp-buffer',   -- allow to show hints from current buffer
      'hrsh7th/cmp-path',     -- help to complete file
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim', -- " allows for showing better context/origin of hints
    },
  },

  {
    'L3MON4D3/LuaSnip',  -- (required by lsp-zero)
    event = 'VeryLazy',
    tag = 'v1.1.0',
  },

  -- add nice bottom bar to show additional informations
  {
    'nvim-lualine/lualine.nvim', -- Add nice bottom line in editor modes
    lazy = false, -- load during startup
  },

  -- harpoon
  {
    'theprimeagen/harpoon',
    event = 'VeryLazy',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  },

  -- Add enhancement for structuring projects (+ telescope)
  --'ahmedkhalf/project.nvim',

  -- Golang
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua', -- " recommanded if need floating window support
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- 'davidhalter/jedi-vim',
  --

  -- Ale linting tool
  {
    'dense-analysis/ale',
    event = 'VeryLazy',
  },

  -- Preview CSS colors inside terminal
  -- It's not perfectly accurate but gives relative information about a color
  {
    'norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
  },

  -- tabs
  {'romgrk/barbar.nvim',
    event = "VeryLazy",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- tests
  {
    "nvim-neotest/neotest",
    event = 'VeryLazy',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",

      -- plugins
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go"
    }
  }
}

local options = {}

require("lazy").setup(plugins, options)

