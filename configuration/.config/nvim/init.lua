--
-- Maciej Sypien personal configuration for NeoVim
--
-- inspired by github.com/jdhao/nvim-config
--

local api = vim.api
local utils = require("utils")

-- check if we have the latest stable version of nvim
local expected_ver = "0.8.0"
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
  local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
  api.nvim_err_writeln(msg)
  return
end

-- Load configurations
local core_config_files = {
  "options.vim",
  "plugins.vim",
  "mappings.lua",
}

for _, name in ipairs(core_config_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

vim.cmd("colorscheme gruvbox")

require('cmp-config/config')
