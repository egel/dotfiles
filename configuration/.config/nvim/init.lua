--
-- Maciej Sypien personal configuration for NeoVim
--
-- inspired by https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
--

local utils = require("utils/utils")
local semver = require("utils/semver")

-- check if we have the latest stable version of nvim
--
-- Change to v0.11 as there were some changes and deprecations in NeoVim api
local expected_ver = semver("0.11.0")
local nvim_ver = semver(utils.get_nvim_version())

if expected_ver > nvim_ver then
  local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
  vim.notify(msg)
  return
end

-- Load standard/core configuration files
--
-- the order matters
--
local core_config_files = { -- order matters
  "options.lua",
  "autocmds.lua",

  -- only general mappings. plugin mappings are inside plugins
  "mappings.lua",
  "plugins.lua",

  -- special config for neovide
  "neovide.lua",
}
for _, name in ipairs(core_config_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end
