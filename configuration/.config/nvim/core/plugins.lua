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

local plugins = {
  --{
  --"folke/tokyonight.nvim",
  --lazy = false,
  --priority = 1000,
  --opts = {},
  --config = function()
  --vim.cmd.colorscheme('tokyonight-storm')
  --end
  --},
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- load during startup
    priority = 1000,
    opts = {
      background = "dark",
    },
    config = function()
      vim.cmd.colorscheme("gruvbox")

      -- Set transparent background
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },

  "tpope/vim-fugitive",
  "tpope/vim-unimpaired", -- useful keybindings for eg. fugitive plugin
  "tpope/vim-repeat",
  "tpope/vim-surround",

  -- Vue
  --
  "posva/vim-vue",

  { import = "plugins/gitsigns-config" },

  { import = "plugins/nerdcommenter-config" },

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- vimdiff
  { import = "plugins/diffview-nvim-config" },

  -- add sidebar tree window (for easier overview on directories structure)
  { import = "plugins/nvim-tree-config" },

  -- editorconfig plugin
  --
  -- nvim support editor config by default (https://neovim.io/doc/user/editorconfig.html)
  --
  -- {
  -- "editorconfig/editorconfig-vim",
  -- lazy = false, -- load during startup
  -- },

  -- Add git info message after the line
  { import = "plugins/git-blame-nvim-config" },

  -- Help operating on CSV files
  {
    "mechatroner/rainbow_csv",
    event = "VeryLazy",
  },

  { import = "plugins/mason-lspconfig-nvim-config" },
  --
  -- nvim LSP completition
  { import = "plugins/nvim-lspconfig-config" },

  { import = "plugins/cmp-config" },
  { import = "plugins/luasnip-config" },

  -- add nice bottom bar to show additional informations
  --
  { import = "plugins/lualine-nvim-config" },

  -- Telescope
  { import = "plugins/telescope-config" },

  -- Add enhancement for structuring projects (+ telescope)
  --'ahmedkhalf/project.nvim',

  -- Golang
  { import = "plugins/go-nvim-config" },

  -- Linting manager
  --
  --{ import = "plugins/nvim-lint-config" },

  -- Formatting manager
  --
  { import = "plugins/conform-config" },

  -- Preview CSS colors inside terminal
  -- It's not perfectly accurate but gives relative information about a color
  { import = "plugins/nvim-colorizer-config" },

  --  the fastest syntax highlighter
  { import = "plugins/nvim-treesitter-config" },
  { import = "plugins/nvim-neotest-config" },

  -- tabs
  { import = "plugins/barbar-nvim-config" },

  { import = "plugins/nomnivore-ollama-config" },

  -- Custom
  --{ import = "custom/mdx-config" },
}

local options = {
  performance = {
    cache = {
      enabled = false,
    },
    rtp = {
      disabled_plugins = {},
    },
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}

require("lazy").setup(plugins, options)
