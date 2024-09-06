return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
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
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "helm_ls",
        "jdtls", -- java lsp
        "lua_ls",
        "pyright",
        "sqlls",
        "stylelint_lsp",
        "tsserver",
        "yamlls", -- yaml language-server
        "zls",

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
    })

    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      ensure_installed = {
        -- LSP
        "prettierd",
        "prettier",
        "isort", -- python
        "cspell",

        -- Linter
        "luacheck",
        "markdownlint",
        "shellcheck",
        "yamllint",
        "eslint_d", -- node

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
        "rustfmt", -- rust
      },
    })
  end,
}
