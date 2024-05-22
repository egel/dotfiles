return {
  "nvim-tree/nvim-tree.lua",
  event = "VimEnter",
  version = "v1.*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- optional: to have image preview
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    -- keymap.set("n", "<C-t>", nvim_tree_api.tree.change_root_to_parent, opts("Up"))
    -- keymap.set("n", "?", nvim_tree_api.tree.toggle_help, opts("Help"))
    nvim_tree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      sort = {
        sorter = "case_sensitive",
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
        dotfiles = true,
      },
      git = {
        ignore = false,
      },
    })

    local keymap = vim.keymap

    -- custom mappings
    --"<Esc>:NvimTreeToggle<CR>", {
    keymap.set("n", "<F9>", "<cmd>NvimTreeToggle<CR>", {
      desc = "Toggle open file tree",
      noremap = true,
    })
    keymap.set("n", "<F10>", "<cmd>NvimTreeFindFile<CR>", {
      desc = "Find current file in file tree",
      noremap = true,
    })
  end,
}
