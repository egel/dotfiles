-- Setup lspconfig.
local nvim_lsp = require("lspconfig")

-- ##################################
-- setup languages
-- ##################################

-- GoLang
--
nvim_lsp["gopls"].setup {
    cmd = {"gopls"},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true
            },
            staticcheck = true
        }
    },
    init_options = {
        usePlaceholders = true
    }
}

-- setup lsp for CSS
--
nvim_lsp['cssmodules_ls'].setup {
    -- provide your on_attach to bind keymappings
    on_attach = custom_on_attach,
    -- optionally
    init_options = {
        camelCase = 'dashes',
    },
}
