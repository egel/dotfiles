return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
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
        debounce_delay = 50,
        float = {
          enable = false,
        },
      },
      sort = {
        sorter = "case_sensitive",
      },
      -- I want still use netrw without modify current buffer
      hijack_netrw = false,
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
        dotfiles = false,
        git_ignored = true,
        -- Hide custom dir/files even when hidden
        custom = {
          "^\\.DS_Store$",
          "^\\.git$",
        },
        -- Always show some files
        exclude = {
          "^\\.gitlab-ci.yml$",
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    local keymap = vim.keymap

    -- ##############################
    -- CUSTOM MAPPINGS
    -- ##############################

    keymap.set("n", "<F9>", "<cmd>NvimTreeToggle<CR>", {
      desc = "Toggle open file tree",
      noremap = true,
    })
    keymap.set("n", "<F10>", "<cmd>NvimTreeFindFile<CR>", {
      desc = "Find current file in file tree",
      noremap = true,
    })

    -- Silently open in new tab
    --
    -- Sometimes, we only want to open a tab, but don't want to jump to that tab immediately.
    local function open_tab_silent(node)
      local api = require("nvim-tree.api")

      api.node.open.tab(node)
      vim.cmd.tabprev()
    end
    keymap.set("n", "T", open_tab_silent, {
      desc = "Open Tab Silently",
    })
  end,
}
