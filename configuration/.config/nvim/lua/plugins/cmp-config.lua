-- inspired by:
--    https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local lspkind = require("lspkind")

    -- for sorting the results
    local compare = require("cmp.config.compare")

    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },

      window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        completeopt = "menu,menuone,preview,noselect",
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        ["<C-x>"] = cmp.mapping(cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = "cmp_ai" },
            }),
          },
        })),
      }),

      -- you can also configure:
      --    keyword_length
      --    priority
      --    max_item_count  - useful when having to many results from specific section
      sources = cmp.config.sources({
        -- The order reflect in completion results
        { name = "cmp_ai" }, -- include input from cmp-ai plugin
        { name = "cmp_git" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "look" },
        { name = "buffer", keyword_length = 2, max_item_count = 10 }, -- start suggesting from X chars
        { name = "ultisnips" }, -- For ultisnips users.
        { name = "luasnip" }, -- For luasnip users.
      }),

      formatting = {
        fields = {
          cmp.ItemField.Kind,
          cmp.ItemField.Abbr,
          cmp.ItemField.Menu,
        },
        format = lspkind.cmp_format({
          -- defines how annotations are shown
          -- default: symbol
          -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
          mode = "symbol_text",
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[LUA]",
            path = "[path]",
            ultisnips = "[snip]",
          },

          symbol_map = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
            -- icons for cmp-ai completion
            HF = "",
            OpenAI = "",
            Codestral = "",
            Bard = "",
          },

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization.
          -- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            return vim_item
          end,

          experimental = {
            native_menu = false,

            ghost_text = true,
          },
        }),
      },

      sorting = {
        priority_weight = 2,
        comparators = {
          require("cmp_ai.compare"),
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },

      -- source: https://github.com/hrsh7th/nvim-cmp/issues/598
      performance = {
        trigger_debounce_time = 100, -- time after last key-input to next reload of available options
      },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = "buffer" },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
