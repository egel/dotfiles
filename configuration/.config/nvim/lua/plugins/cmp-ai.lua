return {
  "tzachar/cmp-ai",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local cmp_ai = require("cmp_ai.config")

    cmp_ai:setup({
      max_lines = 10,
      provider = "Ollama",
      provider_options = {
        model = "llama3.2",
        auto_unload = false, -- Set to true to automatically unload the model when exiting nvim.
        stream = true,
        -- prompt = function(lines_before, lines_after)
        -- return lines_before
        -- end,
        -- suffix = function(lines_after)
        -- vim.notify("lines_after", lines_after)
        -- return lines_after
        -- end,
        -- prompt = "<｜fim▁begin｜>" .. lines_before .. "<｜fim▁hole｜>" .. lines_after .. "<｜fim▁end｜>",
        -- raw_response_cb = function(response)
        -- -- the `response` parameter contains the raw response (JSON-like) object.

        -- vim.notify(vim.inspect(response)) -- show the response as a lua table

        -- vim.g.ai_raw_response = response -- store the raw response in a global variable so that you can use it somewhere else (like statusline).
        -- end,
        options = {
          temperature = 0.2,
        },
      },
      notify = true,
      notify_callback = function(msg)
        vim.notify(msg)
      end,
      run_on_every_keystroke = true,
      ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
        html = true,
      },
    })
  end,
}
