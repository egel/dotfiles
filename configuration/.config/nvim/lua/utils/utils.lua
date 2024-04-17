local M = {}

-- Returns nvim version as string in SemVer format X.Y.Z
--
function M.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format("%d.%d.%d", actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

-- Set given colorscheme else fallback to gruvbox theme
--
function M.set_color_scheme(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  -- Set transparent background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
