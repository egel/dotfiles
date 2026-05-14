return {
  "rcarriga/nvim-notify",
  version = "*",
  dependencies = {},
  config = function(_)
    local notify = require("notify")

    -- 24-bit colour is required
    vim.opt.termguicolors = true

    notify.setup({
      background_colour = "#000000",
      stages = "static", -- fade,
      max_width = 70,
      max_height = 10,
      render = "default", -- default, minimal, simple, compact
      top_down = true,

      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
      },
    })

    vim.notify = notify
  end,
}
