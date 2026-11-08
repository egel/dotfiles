return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
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
        "astro",
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitignore",
        "go",
        "go",
        "graphql",
        "html",
        "ini",
        "javascript",
        "jsdoc",
        "json",
        "latex",
        "lua",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "muttrc",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby", "markdown" },
      },
      indent = { enable = true, disable = { "ruby " } },
    })
  end,
}
