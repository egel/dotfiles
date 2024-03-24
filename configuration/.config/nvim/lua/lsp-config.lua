-- Setup lspconfig.
local nvim_lsp = require("lspconfig")

-- ##################################
-- setup languages
-- ##################################
--
-- More info: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/

-- Docker
nvim_lsp["dockerls"].setup({})

-- Bash
nvim_lsp["bashls"].setup({})

-- GoLang
--
nvim_lsp["gopls"].setup({
  cmd = { "gopls" },
  -- on_attach = on_attach,
  -- capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  },
})

-- SQL
--
nvim_lsp["sqlls"].setup({})

-- setup lsp for Python
--
nvim_lsp["pyright"].setup({
  cmd = { "pyright" }, -- installed from :Mason
})

-- JavaScript / TypeScript
--
nvim_lsp["tsserver"].setup({}) -- installed from :Mason

-- CSS
nvim_lsp["stylelint_lsp"].setup({})
nvim_lsp["cssmodules_ls"].setup({ -- installed from :Mason
  -- provide your on_attach to bind keymappings
  on_attach = custom_on_attach,
  -- optionally
  init_options = {
    camelCase = "dashes",
  },
})

-- HTML
nvim_lsp["html"].setup({})

-- Lua
--
nvim_lsp["lua_ls"].setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Zig
--
nvim_lsp["zls"].setup({})
