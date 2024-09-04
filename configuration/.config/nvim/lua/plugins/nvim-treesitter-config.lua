return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- syntax highlight
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local treesitter_config = require("nvim-treesitter.configs")

    treesitter_config.setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "ini",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "scss",
        "html",
        "sql",
        "markdown",
        "markdown_inline",
        "graphql",
        "bash",
        "git_rebase",
        "git_config",
        "gitignore",
        "dockerfile",
        "latex",
        "muttrc",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
