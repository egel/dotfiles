return {
  "L3MON4D3/LuaSnip", -- (required by lsp-zero)
  event = "VeryLazy",
  tag = "v1.1.0",
  config = function()
    local luasnip = require("luasnip")

    -- Source: https://github.com/L3MON4D3/LuaSnip#set_config
    --
    luasnip.config.set_config({
      -- tells LuaSnip to remember history of changes around last snippet.
      -- you can jump back into it even if you move out of the selection. Nice!
      history = true,

      -- if you have dynamic snippet, it updates it as you type
      update_events = "TextChanged,TextChangedI", -- update on each change

      -- enable autotriggering snippets
      enable_autosnippets = true,

      -- use to trigger visual selection
      store_selection_keys = "<Tab>",
    })

    -- Lazy-load snippets, i.e. only when required, like for given filetype
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })

    --
    -- Mappings
    --

    -- expansion key
    -- expand the current item or jusmp to next item within the snippet
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, {
      silent = true,
    })

    -- Ctrl + j jump backwards key
    -- expand the current item or jusmp to next item within the snippet
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, {
      silent = true,
    })

    -- Ctrl + l selecting within a last of options
    -- expand the current item or jusmp to next item within the snippet
    vim.keymap.set("i", "<C-l>", function()
      if luasnip.choice_active() then
        luasnip.choice_active(1)
      end
    end)

    --vim.keymap.set("n", "<Leader><Leader>s", "<cmd>source ~/.config/nvim/LuaSnip/")
  end,
}
