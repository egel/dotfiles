return {
  "L3MON4D3/LuaSnip", -- (required by lsp-zero)
  event = "VeryLazy",
  version = "v3.*",
  build = "make install_jsregexp",
  dependencies = {
    "rcarriga/nvim-notify",
  },
  config = function()
    local ls = require("luasnip")
    local notify = require("notify")

    -- Source: https://github.com/L3MON4D3/LuaSnip#set_config
    --
    ls.config.set_config({
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
    require("luasnip.loaders.from_lua").load({
      -- INFO: here using a path to previously simlinked directory
      --       See: configuration/README.md for more
      paths = "~/.config/nvim/lua/luasnip/",
    })

    --
    -- Mappings
    --
    vim.keymap.set("n", "<leader>o", function()
      vim.cmd(":source ~/.config/nvim/lua/plugins/luasnip-config.lua", false)
      notify("LuaSnips reloaded")
    end, { desc = "source luasnips files without restarting vim" })

    -- expanding
    vim.keymap.set({ "i" }, "<C-K>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, {
      desc = "expand the current item or jusmp to next item within the snippet",
      silent = true,
    })

    -- changing the active choice
    vim.keymap.set("i", "<C-e>", function()
      if ls.choice_active() then
        ls.choice_active(1)
      end
    end, {
      desc = "expand the current item or jusmp to next item within the snippet",
    })

    -- jump forward
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.jumpable(1) then
        ls.jump(1)
      end
    end, {
      desc = "jump to next item within the snippet",
      silent = true,
    })

    -- jump backward
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, {
      desc = "jump to previous item within the snippet",
      silent = true,
    })

    --vim.keymap.set("n", "<Leader><Leader>s", "<cmd>source ~/.config/nvim/LuaSnip/")
  end,
}
