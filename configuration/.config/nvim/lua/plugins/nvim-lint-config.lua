return {
  "mfussenegger/nvim-lint",
  events = "LazyFile",
  opts = {
    events = {
      "BufWritePost",
      "BufReadPost",
      "InsertLeave",
    },
    linters_by_ft = {
      -- eslint is slower then eslint_d, but works better between multiple projects open
      javascript = { "eslint" }, -- from npm global
      typescript = { "eslint" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      -- kotlin = { "ktlint" },
      terraform = { "tflint" },
      ruby = { "standardrb" },
      markdown = { "markdownlint", "cspell" }, --
      lua = { "luacheck" }, -- from :Mason
      yaml = { "yamllint" },
      css = { "stylelint" },
      scss = { "stylelint" },

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

    -- Lint file content when: Enter Buffer, Save the buffer
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- local ok, err = pcall(lint.try_lint, nil, {})
        -- if not ok then
        -- vim.notify(err, vim.log.levels.WARN)
        -- end
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint(nil, { ignore_errors = true })
      vim.print("Tried linting")
    end, { desc = "Trigger linting for current file" })
  end,
}
