require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)

require("mason-lspconfig").setup(
    {
        -- A list of servers to automatically install if they're not already
        -- installed. Example: { "rust_analyzer@nightly", "lua_ls" }
        --
        -- This setting has no relation with the `automatic_installation` setting.
        ---@type string[]
        ensure_installed = {
            "angularls",
            "tsserver",
            "lua_ls",
            "helm_ls",
            "bashls",
            "docker_compose_language_service",
            "dockerls",
            --'shellcheck',
            "sqlls",
            "stylelint_lsp",
            "yamlls", -- yaml language-server
            "pyright",
            "mdx_analyzer",
            "cssmodules_ls",
            -- "luacheck",
            -- "luaformatter",
            -- "nginx-language-server",
            -- "java_language_server"

            -- Additionally install npm package vscode-langservers-extracted
            --
            -- @see https://github.com/hrsh7th/vscode-langservers-extracted
            "cssls",
            "eslint",
            "html",
        },
        automatic_installation = false
    }
)
