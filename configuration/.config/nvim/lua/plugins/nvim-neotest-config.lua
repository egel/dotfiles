-- Configuration for Neotest
--
-- used plugins:
--  - 'haydenmeade/neotest-jest',
--
return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- plugins
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
  },
  config = function()
    local neotest = require("neotest")
    local neotest_python = require("neotest-python")
    local neotest_plenary = require("neotest-plenary")
    local neotest_vimtest = require("neotest-vim-test")
    local neotest_go = require("neotest-go")

    return neotest.setup({
      adapters = {
        neotest_plenary,
        neotest_python({
          dap = { justMyCode = false },
        }),
        neotest_vimtest({
          -- ignore_file_types = { "python", "vim", "lua" },
        }),
        neotest_go({
          experimental = {
            test_table = true,
          },
          args = {
            "-count=1", -- never use case, always fresh tests
            "-timeout=60s",
          },
        }),
      },
    })
  end,
}
