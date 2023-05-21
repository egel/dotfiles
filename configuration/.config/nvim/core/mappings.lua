--
-- Mappings file - configuration for editor mappings
--
-- more info: https://neovim.io/doc/user/map.html
--
--

local keymap = vim.keymap
local api = vim.api

function setMySpellLanguage ()
    vim.g.myLang = vim.g.myLang + 1
    local myLang = vim.g.myLang
    local myLangList = vim.g.myLangList
    if myLang >= #(myLangList) then vim.g.myLang = 0 end
    if myLang == 1 then vim.cmd('set nospell') end
    if myLang == 2 then vim.cmd('setlocal spell spelllang=en_us') end
    if myLang == 3 then vim.cmd('setlocal spell spelllang=pl') end
    if myLang == 4 then vim.cmd('setlocal spell spelllang=de_de') end
    print("Set spell language:", myLangList[myLang])
end

-- Modes (more at :map-listing)
--      n = normal
--      v = visual & select
--      s = select
--      x = visual
--      i = insert
--      o = operator-pending
--      ! = insert & command-line
--      t = terminal-job
--      c = command-line
--
-- Mapping (more at :help :map-modes)
--      map - works recursively in normal, visual, select and operator pending modes.
--      map! - works recursively in insert and command-line modes.
--
--      noremap - works non-recursively in normal, visual, select and operator pending modes.
--      noremap! - works non-recursively in insert and command-line modes.
--
--      nmap - works recursively in normal mode.
--      imap - works recursively in insert mode.
--      vmap - works recursively in visual and select modes.
--      xmap - works recursively in visual mode.
--      smap - works recursively in select mode.
--      cmap - works recursively in command-line mode.
--      omap - works recursively in operator pending mode.
--

-- Map W, Q and WQ, WA as usual typo
keymap.set("c", "WQ", "wq")
keymap.set("c", "Wq", "wq")
keymap.set("c", "Wa", "wa")
keymap.set("c", "WA", "wa")
keymap.set("c", "W", "w")
keymap.set("c", "Q", "q")

-- disable text highlight
local disable_text_highlight = "<Esc>:noh<CR>"
keymap.set("n", "<F3>", disable_text_highlight)
keymap.set("v", "<F3>", disable_text_highlight)

-- Moving line by line with hjkl also in wrapped lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "k", "gk", { noremap = true })
keymap.set("v", "k", "gk", { noremap = true })

-- Change variables (local & global)
keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>") -- local file
keymap.set("n", "gR", "gD:%s/<C-R>///gc<left><left><left>") -- Global

-- Go to next/previous tab
keymap.set("n", "<Leader>m", "<Esc>:tabnext<CR>", { desc = "next tab"})
keymap.set("n", "<Leader>n", "<Esc>:tabprevious<CR>", { desc = "previous tab"})
keymap.set("n", "C-n", "<Esc>:tabnew<CR>", { desc = "new tab", remap = true })

-- Sort selected lines A-Z
keymap.set("v", "<Leader>s", ":sort<CR>", { desc = "sort lines", noremap = true })

-- Beautify JSON
--vim.api.nvim_create_user_command( -- not working
    --"JsonBeautify",
    --"<cmd>:%!jq . %<CR>",
    --{
        --desc = "Beautify JSON file from",
    --}
--) -- end not working
local jsonBeautify = "<Esc>:%!jq . <CR>"
local jsonUglyfy = "<Esc>:%!jq -c . <CR>"
keymap.set("n", "<Leader>jq", jsonBeautify) -- perform: jq on current buffer
keymap.set("n", "<Leader>ujq", jsonUglyfy) -- perform: undo jq on current buffer

-- Move tab to left/right position in top tab-bar
keymap.set('n', "<F7>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()-1)<CR>")
keymap.set('n', "<F8>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()+1)<CR>")

-- Reload nvim configuration (without exit)
keymap.set('n', "<Leader>~", "<Esc>:source $MYVIMRC<CR>") -- $MYVIMRC is a special variable used in nvim to point to configuration

-- Toggle spell check with <F4> (default: en_us)
vim.g.myLang = 0
vim.g.myLangList = { "nospell", "en_us", "pl", "de_de" }
keymap.set('n', '<F4>', ':lua setMySpellLanguage()<CR>', { noremap = false, silent = false })

