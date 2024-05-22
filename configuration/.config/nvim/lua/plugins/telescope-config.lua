return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    -- additional enhancement
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("live_grep_args")

    local lga_actions = require("telescope-live-grep-args.actions")

    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, {
      desc = "Fuzzy [f]ind [f]iles in cwd",
    })
    keymap.set("n", "<leader>fo", builtin.oldfiles, {
      desc = "Fuzzy [f]ind [o]ld files",
    })
    keymap.set("n", "<leader>fb", builtin.buffers, {
      desc = "Fuzzy [f]ind files in open [b]uffer",
    })
    keymap.set("n", "<leader>fr", builtin.lsp_references, {
      desc = "Fuzzy [f]ind [r]eferences in cwd",
    })
    keymap.set("n", "<leader>fg", builtin.live_grep, {
      desc = "[f]ind [g]rep string in cwd",
    })
    keymap.set("n", "<leader>fs", builtin.grep_string, {
      desc = "[f]ind grep_[s]tring under cursor in cwd",
    })
    keymap.set("n", "<leader>fh", builtin.help_tags, {
      desc = "[f]ind string in vim [h]elp manual",
    })

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow", -- follow symbolic links
          "--hidden", -- search for hidden files
          "--no-heading", -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--ignore-case", -- Case insensitive search
          "--line-number", -- Show line numbers
          "--column", -- Show column numbers
          "--smart-case", -- Smart case search
          --"--debug", -- Show debug messages

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
          "--glob-case-insensitive",
        },

        prompt_prefix = " 🔍 ",

        mappings = {
          -- i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          --["<C-h>"] = "which_key"
          -- }
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
            "--glob-case-insensitive",
          },
        },
        live_grep = {
          --hidden = true,
        },
      },
      extensions = {
        -- Your extension configuration goes here:
        live_grep_args = {
          auto_quoting = true,
        },
        -- define mappings, e.g.
        mappings = { -- extend mappings
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          },
        },
        -- please take a look at the readme of the extension you want to configure
      },
    })
  end,
}
