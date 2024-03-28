require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
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
    "lua_ls",
    "pyright",
    "sqlls",
    "stylelint_lsp",
    "tsserver",
    "yamlls", -- yaml language-server
    "zls",
    -- Additionally install npm package vscode-langservers-extracted
    --
    -- @see https://github.com/hrsh7th/vscode-langservers-extracted

    -- Linter
    --"luacheck",
    --"yamllint",

    -- Formatter
    --"beautysh",
    --"black",
    --"stylua",
  },
  automatic_installation = false,
})

-- This plugin allow to use Mason server names instead
-- if some installers cannot be installed in via Mason, put them here
require("mason-tool-installer").setup({
  ensure_installed = {
    -- LSP
    "prettierd",
    "isort",
    "cspell",

    -- Linter
    "luacheck",
    "markdownlint",
    "shellcheck",
    "yamllint",

    -- Formatter
    "beautysh",
    "black",
    "stylua",
  },
})
