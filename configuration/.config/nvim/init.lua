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
  "options.lua",
  "autocmds.lua",
  "plugins.lua",
  "mappings.lua",
}
for _, name in ipairs(core_config_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

-- load colorscheme
function myColorScheme(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  -- Set transparent background
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end
myColorScheme()

--
-- Load setup for plugins
--
-- The order of loading plugins matter!
--
-- Start loading plugins by default from "lua" directory
--

-- load lualine theme
require('lualine-config')

-- load treesitter
require('nvim-treesitter')

require('luasnip-config') -- Snippets should be before cmp-config
--
-- setup cmp plugins
require('cmp-config')
require('mason-config')
require('lsp-config')
require('gitsigns-config')

-- telescope: search for files, grep text and more
require('telescope-config')

-- load project.nvim
require('project-nvim-config')

require('nvim-tree-config')
