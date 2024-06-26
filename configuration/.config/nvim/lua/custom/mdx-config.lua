--
-- MDX File type
--
-- This is implementation of MDX filetype followed from:
-- https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
return {
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })

    -- set mdx extension to use markdown syntax
    vim.treesitter.language.register("markdown", "mdx") -- mdx use markdown parser
  end,
}
