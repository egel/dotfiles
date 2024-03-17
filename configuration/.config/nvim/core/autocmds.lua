local api = vim.api

--
-- Autocmds
--
-- inspired by: https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
--

-- Git:
-- enable spell check when entering gitcommit file
api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { 'gitcommit' },
        command = 'setlocal spell',
    }
)

-- Folding
-- Set folding for vim files
api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { 'vim' },
        command = 'setlocal foldmethod=marker foldmarker={{{,}}}',
    }
)

-- Set folding for JavaScript/TypeScript files
api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { 'javascript', 'typescript' },
        command = 'setlocal foldmethod=marker foldmarker={,}',
    }
)

-- Run gofmt on save
--
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

