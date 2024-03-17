local telescope = require('telescope')

local options = {
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
    }
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
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

--local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--

telescope.setup(options)
