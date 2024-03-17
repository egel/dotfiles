-- Configuration for Neotest
--
-- used plugins:
--  - 'haydenmeade/neotest-jest',
--

local neotest = require("neotest")
local neotestpython = require("neotest-python")
local neotestplenary = require("neotest-plenary")
local neotestvimtest= require("neotest-vim-test")

neotest.setup({
  adapters = {
    neotestplenary,
    neotestpython({
      dap = { justMyCode = false },
    }),
    neotestvimtest({
      -- ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})

