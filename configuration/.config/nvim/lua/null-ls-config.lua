--local null_ls = require("null-ls")

--null_ls.setup({
  ----debug = true, -- enable debug mode and get debug output
  --sources = {
    --null_ls.builtins.formatting.stylua,
    --null_ls.builtins.diagnostics.eslint,
    --null_ls.builtins.completion.spell,
  --},

  --on_attach = function(client, bufnr)
    --if client.server_capabilities.documentFormattingProvider then
      --vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format {async = true}<CR>")

      ---- format on save
      --vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format {async = true}")
    --end

    --if client.server_capabilities.documentRangeFormattingProvider then
      --vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    --end
  --end,
--})
