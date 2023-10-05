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
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local plugins = {
  {
    'ellisonleao/gruvbox.nvim',
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
      'nvim-tree/nvim-tree.lua',
      dependencies = {
          'nvim-tree/nvim-web-devicons',
      },
  },

  -- editorconfig plugin
  'editorconfig/editorconfig-vim', 

  -- Add git info message after the line
  'f-person/git-blame.nvim',

  -- Help operating on CSV files
  'mechatroner/rainbow_csv',

  -- syntax highlight
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'nvim-treesitter/nvim-treesitter', --  the fastest syntax highlighter
  'theHamsta/nvim-dap-virtual-text',

  -- Mason (should be before lsp)
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- nvim LSP completition
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua', -- lua completitions
  'hrsh7th/cmp-buffer',   -- allow to show hints from current buffer
  'hrsh7th/cmp-path',     -- help to complete file
  'hrsh7th/cmp-cmdline',
  'onsails/lspkind.nvim', -- " allows for showing better context/origin of hints

  {
    'L3MON4D3/LuaSnip',  -- (required by lsp-zero)
    tag = 'v1.1.0',
  },

  'nvim-lualine/lualine.nvim', -- Add nice bottom line in editor modes

  -- harpoon
  {
    'theprimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  },

  -- Add enhancement for structuring projects (+ telescope)
  'ahmedkhalf/project.nvim',

  -- package to run test quick
  'vim-test/vim-test',

  -- Golang
  {
    'fatih/vim-go',
    cmd = "GoUpdateBinaries",
    dependencies = {
      'ray-x/go.nvim',
      'ray-x/guihua.lua', -- " recommanded if need floating window support
    }
  },

  'davidhalter/jedi-vim',

  -- Ale linting tool
  'dense-analysis/ale',


  -- Preview CSS colors inside terminal
  -- It's not perfectly accurate but gives relative information about a color
  'ap/vim-css-color',
}

local options = {}

require("lazy").setup(plugins, options)


