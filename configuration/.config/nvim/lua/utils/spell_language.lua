local M = {}

-- SetMySpellLanguage change current spell lang and rotate with next from
-- the list
--
--
function M.SetMySpellLanguage()
  vim.g.myLang = vim.g.myLang + 1
  local myLang = vim.g.myLang
  local myLangList = vim.g.myLangList
  if myLang >= #myLangList then
    vim.g.myLang = 1
  end
  if myLang == 1 then
    vim.cmd("set nospell")
  end
  if myLang == 2 then
    vim.cmd("setlocal spell spelllang=en_us")
  end
  if myLang == 3 then
    vim.cmd("setlocal spell spelllang=pl")
  end
  if myLang == 4 then
    vim.cmd("setlocal spell spelllang=de_de")
  end
  vim.print("Set spell language to:", myLangList[myLang])
end

return M
