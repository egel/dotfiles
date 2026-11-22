return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    -- Mason (should be before lsp)
    "williamboman/mason.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua", -- lua completitions
    "hrsh7th/cmp-buffer", -- allow to show hints from current buffer
    "hrsh7th/cmp-path", -- help to complete file
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim", -- " allows for showing better context/origin of hints
  },
  config = function()
    local vim_api = vim.api
    local keymap = vim.keymap

    -- list of configs <https://github.com/neovim/nvim-vim.lsp.config/blob/master/doc/configs.md>

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim_api.nvim_create_autocmd("LspAttach", {
      group = vim_api.nvim_create_augroup("Uservim.lsp.config", {}),
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
    -- Declarative server list: every server installed via mason gets an
    -- explicit `vim.lsp.config()` + `vim.lsp.enable()` here, which also
    -- silences the "'config' config not found" health warnings.
    -- Config reference: <https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md>
    local servers = {
      -- Docker
      dockerls = {},
      docker_compose_language_service = {},

      -- GoLang
      gopls = {
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
      },

      -- SQL
      sqlls = {},

      -- JSON / TOML
      jsonls = {},
      taplo = {},

      -- Python
      pyright = {
        cmd = { "pyright" }, -- installed from :Mason
      },

      -- TypeScript / JavaScript
      ts_ls = {
        -- installed from :Mason
      },
      eslint = {},

      -- CSS
      cssls = {
        -- cmd = { "vscode-html-languageservice", "--stdio" },
      },
      stylelint_lsp = {},

      -- HTML (css + javascript)
      tailwindcss = {
        --cmd = { "vscode-html-languageservice", "--stdio" },
      },
      html = {
        --cmd = { "vscode-html-languageservice", "--stdio" },
      },

      -- Angular
      angularls = {},

      -- Astro
      astro = {},

      -- GraphQL (.graphql files)
      graphql = {},

      -- Shell / Bash
      bashls = {},

      -- Lua
      lua_ls = {
        -- cmd = { "lua-language-server" },
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
      },

      -- Zig
      zls = {},

      -- Java
      jdtls = {},

      -- YAML / Helm
      yamlls = {},
      helm_ls = {},
    }

    for server, server_config in pairs(servers) do
      vim.lsp.config(server, server_config)
      vim.lsp.enable(server)
    end
  end,
}
