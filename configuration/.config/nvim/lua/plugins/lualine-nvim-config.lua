return {
  "nvim-lualine/lualine.nvim", -- Add nice bottom line in editor modes
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- load during startup

  -- Enhance lualine with information about ollama status
  optional = true,
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        local status = require("ollama").status()

        if status == "IDLE" then
          return "󱙺" -- nf-md-robot-outline
        elseif status == "WORKING" then
          return "󰚩" -- nf-md-robot
        end
      end,
      cond = function()
        return package.loaded["ollama"] and require("ollama").status() ~= nil
      end,
    })
  end,
}
