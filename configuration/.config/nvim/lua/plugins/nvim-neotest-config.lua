-- Configuration for Neotest
--
-- used plugins:
--  - 'haydenmeade/neotest-jest',
--
return {
  "nvim-neotest/neotest",
  -- event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "folke/which-key.nvim",
    "mfussenegger/nvim-dap",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- plugins
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "marilari88/neotest-vitest",
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
  },
  config = function()
    local neotest = require("neotest")
    local neotest_jest = require("neotest-jest")
    local neotest_go = require("neotest-go")
    local neotest_vitest = require("neotest-vitest")
    -- local neotest_python = require("neotest-python")
    -- local neotest_plenary = require("neotest-plenary")
    -- local neotest_vimtest = require("neotest-vim-test")

    return neotest.setup({
      adapters = {
        -- golang
        --
        neotest_go({
          experimental = {
            test_table = true,
          },
          args = {
            "-count=1", -- never use cache, always fresh tests
            "-timeout=60s",
          },
        }),
        -- JS/TS
        --
        neotest_jest({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),

        neotest_vitest({
          -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        }),
      },
    })
  end,
}
