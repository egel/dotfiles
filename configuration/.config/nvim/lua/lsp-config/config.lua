-- Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- setup languages
-- GoLang
nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities = capabilities,
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
  }
}
