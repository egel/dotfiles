--    https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
return {
  "rcarriga/nvim-notify",
  dependencies = {},
  config = function()
    -- 24-bit colour is required
    vim.opt.termguicolors = true
  end,
}
