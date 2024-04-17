return {
  "preservim/nerdcommenter",
  config = function()
    -- Create default mappings
    vim.g.NERDCreateDefaultMappings = 1

    -- Add spaces after comment delimiters by default
    vim.g.NERDSpaceDelims = 1
  end,
}
