local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" }, -- from npm global
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  -- svelte = { "eslint_d" },
  -- kotlin = { "ktlint" },
  terraform = { "tflint" },
  ruby = { "standardrb" },
  markdown = { "markdownlint" }, --
  lua = { "luacheck" }, -- from :Mason
  yaml = { "yamllint" },
  css = { "stylelint" },
  scss = { "stylelint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Lint file content when: Enter Buffer, Save the buffer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>ll", function()
  lint.try_lint()
  vim.print("Tried linting")
end, { desc = "Trigger linting for current file" })
