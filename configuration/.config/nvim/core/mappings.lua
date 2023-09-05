--
-- Mappings file - configuration for editor mappings
--
-- more info: https://neovim.io/doc/user/map.html
--
--

local keymap = vim.keymap
local api = vim.api

-- Map leader key to coma
-- It is not mapped with respect well unless we will set it before setting
-- for plug in.
vim.mapleader = ','

-- Use <leader> in global plugin.
vim.g.mapleader = ","

-- setMySpellLanguage change current spell lang and rotate with next from
-- the list
--
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
--
keymap.set("c", "WQ", "wq")
keymap.set("c", "Wq", "wq")
keymap.set("c", "Wa", "wa")
keymap.set("c", "WA", "wa")
keymap.set("c", "W", "w")
keymap.set("c", "Q", "q")

-- Quick open of Ex-mode
--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Ex stands for :Explore

-- Move entire selection Up/Down
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")


-- When J back prev line cursor stays at same place
--
vim.keymap.set("n", "J", "mzJ`z")

-- Cursor stays in middle when ...
--
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- when moving half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- when moving half page up
vim.keymap.set("n", "n", "nzzzv") -- when highlight next item
vim.keymap.set("n", "N", "Nzzzv") -- when highlight previous item

-- do not replace copied buffer with system buffer while pasting
-- and send replaced to Void
--
vim.keymap.set("x", "<leader>p", "\"_dP")

-- disable capital Q
vim.keymap.set("n", "Q", "<nop>")

-- jump to next tmux session without exiting
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format code
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Inline Sort
-- source:
--
vim.keymap.set("v", "<leader>is", "")

-- replace current word (like local variable replace)
-- leader + r (replace)
--
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Resize windows
--
-- there is = instead of + becasue on standard ASCII keyboard to create + sign
-- you need to also press Shift
--
vim.keymap.set("n", "C-w <", "<ESC>:vertical resize +5<CR>", {noremap=true})
vim.keymap.set("n", "C-w >", "<ESC>:vertical resize -5<CR>", {noremap=true})
vim.keymap.set("n", "C-w =", "<ESC>:resize -5<CR>", {noremap=true})
vim.keymap.set("n", "C-w -", "<ESC>:resize +5<CR>", {noremap=true})

-- Disable text highlight
--
local disable_text_highlight = "<Esc>:noh<CR>"
keymap.set("n", "<F3>", disable_text_highlight)
keymap.set("v", "<F3>", disable_text_highlight)

-- Moving line by line with hjkl also in wrapped lines
--
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "k", "gk", { noremap = true })
keymap.set("v", "k", "gk", { noremap = true })

-- Change variables (local & global)
--
-- FIXME: Not well tested
--
keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>") -- local file
keymap.set("n", "gR", "gD:%s/<C-R>///gc<left><left><left>") -- Global

-- Go to next/previous tab
keymap.set("n", "<leader>m", "<Esc>:tabnext<CR>", { desc = "next tab"})
keymap.set("n", "<leader>n", "<Esc>:tabprevious<CR>", { desc = "previous tab"})
keymap.set("n", "C-n", "<Esc>:tabnew<CR>", { desc = "new tab", remap = true })

-- Sort selected lines A-Z
keymap.set("v", "<leader>s", ":sort<CR>", { desc = "sort lines", noremap = true })

-- Beautify JSON
local jsonBeautify = "<Esc>:%!jq . <CR>"
local jsonUglyfy = "<Esc>:%!jq -c . <CR>"
keymap.set("n", "<leader>jq", jsonBeautify) -- perform: jq on current buffer
keymap.set("n", "<leader>ujq", jsonUglyfy) -- perform: undo jq on current buffer

-- Move tab to left/right position in top tab-bar
keymap.set('n', "<F7>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()-1)<CR>")
keymap.set('n', "<F8>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()+1)<CR>")

-- Reload nvim configuration (without exit)
--
-- INFO: $MYVIMRC is a special variable used in nvim which points to configuration
--
keymap.set('n', "<leader>~", "<Esc>:source $MYVIMRC<CR>")

-- Toggle spell check with <F4> (default: en_us)
vim.g.myLang = 1
vim.g.myLangList = { "nospell", "en_us", "pl", "de_de" }
keymap.set('n', '<F4>', ':lua setMySpellLanguage()<CR>',
  { noremap = false, silent = false }
)

-- harpoon mappings
--
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-b>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)

-- nvim-telescope
--
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
