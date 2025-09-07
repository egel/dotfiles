return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt('Raw')<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>om",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  opts = {
    -- your configuration overrides
    -- model = "codellama:7b",
    -- model = "stable-code:latest",
    model = "gemma2:2b",
    url = "http://127.0.0.1:11434",

    serve = {
      on_start = false,
      command = "ollama",
      args = { "serve" },
      stop_command = "pkill",
      stop_args = { "-SIGTERM", "ollama" },
    },

    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
      General = {
        prompt = "$input. This is selected text $sel",
        input_label = "> ",
        -- model = "stable-code:latest",
        action = "display",
      },
      Sample_Prompt = {
        prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
        input_label = "> ",
        -- model = "codellama:7b",
        action = "display",
      },
    },
  },
}
