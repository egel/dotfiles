return {
  "rcarriga/nvim-notify",
  version = "*",
  dependencies = {},
  config = function(_)
    local notify = require("notify")

    -- 24-bit colour is required
    vim.opt.termguicolors = true

    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
