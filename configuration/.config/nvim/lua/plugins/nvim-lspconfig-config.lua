return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    -- Mason (should be before lsp)
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua", -- lua completitions
    "hrsh7th/cmp-buffer", -- allow to show hints from current buffer
    "hrsh7th/cmp-path", -- help to complete file
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim", -- " allows for showing better context/origin of hints
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local telescope = require("telescope.builtin")

    local vim_api = vim.api
    local keymap = vim.keymap

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim_api.nvim_create_autocmd("LspAttach", {
      group = vim_api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", {
          desc = "[g]o to telescope [d]efinition",
          buffer = ev.buf,
        })
        -- keymap.set("n", "gd", vim.lsp.buf.definition, {
        -- desc = "[g]o to [d]efinition",
        -- buffer = ev.buf,
        -- })
        keymap.set("n", "gD", vim.lsp.buf.declaration, {
          desc = "[g]o to [D]eclaration",
          buffer = ev.buf,
        })
        -- keymap.set("n", "gt", vim.lsp.buf.type_definition, {
        -- desc = "[g]o to [t]ype definition",
        -- buffer = ev.buf,
        -- })
        -- keymap.set("n", "gi", vim.lsp.buf.implementation, {
        -- desc = "[g]o to [i]mplementation",
        -- buffer = ev.buf,
        -- })
        -- keymap.set("n", "gr", vim.lsp.buf.references, {
        -- desc = "[g]o to [r]eferences",
        -- buffer = ev.buf,
        -- })
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", {
          desc = "[g]o to [t]ype definition",
          buffer = ev.buf,
        })
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", {
          desc = "[g]o to telescope [i]mplementation",
          buffer = ev.buf,
        })
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {
          desc = "[g]o to telescope [r]eferences",
          buffer = ev.buf,
        })
        keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {
          desc = "Open telescope [d]iagnostic [l]ist",
          buffer = ev.buf,
        })
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
          desc = "Show possible [c]ode [a]ctions",
          buffer = ev.buf,
        })
        keymap.set("n", "K", vim.lsp.buf.hover, {
          desc = "Hover documentation",
          buffer = ev.buf,
        })
        --keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
        --buffer = ev.buf,
        --})
        -- Rename the variable under your cursor (WORKS ONLY WITH LSP)
        keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
          desc = "[r]ename",
          buffer = ev.buf,
        })
      end,
    })

    -- ##################################
    -- setup languages
    -- ##################################
    --
    -- More info: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/
    -- Enable (broadcasting) snippet capability for completion
    --
    local capabilities = cmp_nvim_lsp.default_capabilities()
    --local capabilities = vim.lsp.protocol.make_client_capabilities()
    --capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Docker
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
    })

    -- Bash
    lspconfig["bashls"].setup({
      capabilities = capabilities,
    })

    -- GoLang
    --
    lspconfig["gopls"].setup({
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
      capabilities = capabilities,
    })

    -- SQL
    --
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
    })

    -- setup lsp for Python
    --
    lspconfig["pyright"].setup({
      cmd = { "pyright" }, -- installed from :Mason
      capabilities = capabilities,
    })

    -- TypeScript
    --
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
    }) -- installed from :Mason

    -- CSS
    --
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      -- cmd = { "vscode-html-languageservice", "--stdio" },
    })

    -- HTML (css + javascript)
    --
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      --cmd = { "vscode-html-languageservice", "--stdio" },
    })

    -- HTML (css + javascript)
    --
    lspconfig["html"].setup({
      capabilities = capabilities,
      --cmd = { "vscode-html-languageservice", "--stdio" },
    })

    -- Angular
    --
    -- nvim_lsp["angularls"].setup({})

    -- Shell / Bash
    --
    lspconfig["bashls"].setup({})

    -- Lua
    --
    lspconfig["lua_ls"].setup({
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
            disable = {
              -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              "missing-fields",
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
      capabilities = capabilities,
    })

    -- Zig
    --
    lspconfig["zls"].setup({
      capabilities = capabilities,
    })

    -- java
    --
    lspconfig["jdtls"].setup({
      capabilities = capabilities,
    })
  end,
}
