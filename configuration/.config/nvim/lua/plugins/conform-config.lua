return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },

        -- Conform will run multiple formatters sequentially
        go = { "goimports", "gofmt" },
        python = { "black" },

        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        java = { "google-java-format" },
        -- kotlin = { "ktlint" },
        -- ruby = { "standardrb" },
        markdown = { { "prettierd", "prettier" } },
        -- erb = { "htmlbeautifier" },
        html = { { "prettierd", "htmlbeautifier" } },
        bash = { "beautysh" },
        proto = { "buf" },
        rust = { "rustfmt" },
        --yaml = { "yamlfmt" },
        toml = { "taplo" },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        -- zig = { "zigfmt" },

        -- TODO: ignore propose lint: *.min.css, *.min.js
      },

      -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },

      -- If this is set, Conform will run the formatter asynchronously after save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_after_save = {
        lsp_fallback = true,
      },
    })
  end,
}
