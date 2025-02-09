return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
    "LspAttach",
  },
  opts = {},
  config = function()
    local conform = require("conform")
    local prettier = { "prettierd", "prettier", stop_after_first = true }

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },

        -- Conform will run multiple formatters sequentially
        go = { "goimports", "gofmt" },
        python = { "isort", "black" },

        -- Use a sub-list to run only the first available formatter
        javascript = prettier,
        typescript = prettier,
        javascriptreact = prettier,
        typescriptreact = prettier,
        json = prettier,
        graphql = prettier,
        java = { "google-java-format" },
        vue = prettier,
        -- kotlin = { "ktlint" },
        -- ruby = { "standardrb" },
        markdown = prettier,
        -- erb = { "htmlbeautifier" },
        html = { "prettierd", "htmlbeautifier" },
        bash = { "shfmt" }, -- beautysh
        sh = { "shfmt" }, -- beautysh
        proto = { "buf" },
        rust = { "rustfmt" },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
        css = prettier,
        scss = prettier,
        -- zig = { "zigfmt" },

        -- TODO: ignore propose lint: *.min.css, *.min.js
      },

      -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 2500,
      },

      -- If this is set, Conform will run the formatter asynchronously after save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      stop_after_first = false,
    })

    -- shfmt: modification
    conform.formatters.shfmt = {
      prepend_args = { "-i", "2" },
    }
  end,
}
