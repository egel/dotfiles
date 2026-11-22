return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already
      -- installed. Example: { "rust_analyzer@nightly", "lua_ls" }
      --
      -- This setting has no relation with the `automatic_installation` setting.
      ---@type string[]
      ensure_installed = {
        -- LSP
        "angularls",
        "astro", -- astro language-server
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "graphql", -- for .graphql files
        "helm_ls",
        "jdtls", -- java lsp
        "lua_ls",
        "pyright",
        "sqlls",
        "stylelint_lsp",
        "tailwindcss",
        "ts_ls",
        "yamlls", -- yaml language-server
        "zls",

        -- Installed rust packages via rustup
        -- @see https://github.com/egel/dotfiles/tree/main/configuration#rust
        -- "rust-analyzer",

        "taplo",
        -- Additionally install npm package vscode-langservers-extracted
        --
        -- @see https://github.com/hrsh7th/vscode-langservers-extracted

        -- Linter
        --"luacheck",
        --"yamllint",

        -- Formatter
      },
      automatic_installation = false,

      -- Disable mason-lspconfig's automatic enabling: servers are defined and
      -- enabled explicitly in nvim-lspconfig-config.lua. Enabling here would
      -- activate servers before their `vim.lsp.config()` exists.
      automatic_enable = false,
    })

    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatter
        "prettierd",
        "prettier",
        "isort", -- python
        "cspell",
        "tailwindcss-language-server",

        -- Linter
        "luacheck",
        "markdownlint",
        "shellcheck",
        "yamllint",
        "eslint_d", -- node
        "tree-sitter-cli",

        -- Formatter
        "beautysh", -- shell
        "shfmt", -- shell
        "black", -- python
        "buf", -- proto buffs
        "goimports", -- go
        "gofumpt", -- go
        "stylua", -- lua
        "yamlfmt",
        "htmlbeautifier", -- html
        "google-java-format", -- java
        "jsonlint", -- json
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
