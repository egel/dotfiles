return {
  "mfussenegger/nvim-lint",
  events = "LazyFile",
  opts = {
    events = {
      "BufReadPre",
      "BufNewFile",
      -- "BufWritePost",
      -- "BufReadPost",
      -- "InsertLeave",
    },
    linters_by_ft = {
      -- eslint is slower then eslint_d, but works better between multiple projects open
      javascript = { "eslint_d" }, -- from npm global
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      -- kotlin = { "ktlint" },
      terraform = { "tflint" },
      ruby = { "standardrb" },
      --markdown = { "markdownlint", "cspell" }, --
      -- md = { "markdownlint", "cspell" }, --
      lua = { "luacheck" }, -- from :Mason
      yaml = { "yamllint" },
      css = { "stylelint" },
      scss = { "stylelint" },
      bash = { "shellcheck", "shfmt" },
      sh = { "shellcheck", "shfmt" },
      json = { "jsonlint" },
      html = { "htmllint" },

      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = {},
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = {},
    },
  },
  config = function()
    local lint = require("lint")
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- fix for Eslint < 9 (but not working for less then 9 :( )
    local eslint_d = lint.linters.eslint_d
    eslint_d.args = {
      "--no-warn-ignored", -- <-- this is the key argument
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    -- Lint file content when: Enter Buffer, Save the buffer
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- local ok, err = pcall(lint.try_lint, nil, {})
        -- if not ok then
        -- vim.notify(err, vim.log.levels.WARN)
        -- end
        -- lint.try_lint(nil, { ignore_errors = true })
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint(nil, { ignore_errors = true })
      vim.print("Tried linting")
    end, { desc = "Trigger linting for current file" })
  end,
}
