return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  config = function()
    -- Attach to certain Filetypes, add special configuration for `html`
    -- Use `background` for everything else.
    local colorizer = require("colorizer")

    colorizer.setup({
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      html = {
        mode = "foreground",
      },
    })
  end,
}
