--
-- Maciej Sypien personal configuration for NeoVim
--
-- inspired by https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
--

local api = vim.api
local utils = require("utils/utils")
local semver = require("utils/semver")

-- check if we have the latest stable version of nvim
local expected_ver = semver('0.8.0')
local nvim_ver = semver(utils.get_nvim_version())

if expected_ver > nvim_ver then
  local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
  api.nvim_err_writeln(msg)
  return
end

-- Load standard/core configuration files
local core_config_files = { -- order matters
  "options.vim",
  "plugins.vim",
  "mappings.lua",
}
for _, name in ipairs(core_config_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

-- load colorscheme
vim.cmd("colorscheme gruvbox")

--
-- Load setup for plugins
--

-- setup cmp plugins (& lsp)
require('cmp-config/config')

-- prettier: save files according to opinionated standard
require('null-ls-config/config')
require('prettier-config/config')

-- telescope: search for files, grep text and more
require('telescope-config/config')

-- Snippets
require('luasnip-config/config')
