--
-- Mappings file - configuration for editor mappings
--
-- more info: https://neovim.io/doc/user/map.html
--
--

local keymap = vim.keymap
local api = vim.api

-- Map leader key to SPACE (before I used coma, reason below)
--
-- INFO: If using coma (,) a leader you can't jump forward (;) and backward (,)
-- with coma.
--
-- It is not mapped with respect well unless we will set it before setting
-- for plug in.
vim.mapleader = " "
vim.g.mapleader = " "
vim.maplocalleader = " "

-- enable if using nerd fonts
vim.g.have_nerd_font = true

-- SetMySpellLanguage change current spell lang and rotate with next from
-- the list.
--
function SetNextSpellLanguage()
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
  print("Set spell language to:", myLangList[myLang])
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
--
-- Various modifiers with example f4
--
--  map('n', '<sc-f5>', [[<cmd>lua print('ctrl+shift+f5')<cr>]], {noremap = true})
--  map('n', '<c-f5>', [[<cmd>lua print('ctrl+f5')<cr>]], {noremap = true})
--  map('n', '<s-f5>', [[<cmd>lua print('shift+f5')<cr>]], {noremap = true})
--  map('n', '<a-f5>', [[<cmd>lua print('alt+f5')<cr>]], {noremap = true})
--  map('n', '<d-f5>', [[<cmd>lua print('command+f5')<cr>]], {noremap = true}) -- command-key (Macintosh only)
-- Ctrl+Shift+B
-- map('n', '<cs-B>', [[<cmd>lua print('ctrl+shift+b')<cr>]], {noremap = true})
--
-- Ctrl+Shift+=
-- map('n', '<c-+>', [[<cmd>lua print('ctrl+shift+=')<cr>]], {noremap = true})
--
-- Ctrl+=
-- map('n', '<c-=>', [[<cmd>lua print('ctrl+=')<cr>]], {noremap = true})
--
-- Ctrl+.
-- map('n', '<c-.>', [[<cmd>lua print('ctrl+.')<cr>]], {noremap = true})
--
-- Alt+Enter
-- map('n', '<a-cr>', [[<cmd>lua print('alt+enter')<cr>]], {noremap = true})

-- Map W, Q and WQ, WA as usual typo
--
keymap.set("c", "WQ", "wq")
keymap.set("c", "Wq", "wq")
keymap.set("c", "Wa", "wa")
keymap.set("c", "WA", "wa")
keymap.set("c", "W", "w")
keymap.set("c", "Q", "q")

-- Disable capital Q
--
keymap.set("n", "Q", "<nop>")

-- Copy to system clipboard
--
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')

-- Paste effectively (also very large files) from system clipboard
--
keymap.set("n", "<leader>p", '"+p')

-- Reload nvim configuration (without exit)
--
-- INFO: $MYVIMRC is a special variable used in nvim which points to configuration
--
keymap.set("n", "<leader>~", "<Esc>:source $MYVIMRC<CR>")

-- Toggle spell check with <F4> (default: en_us)
--
vim.g.myLang = 1
vim.g.myLangList = { "nospell", "en_us", "pl", "de_de" }
keymap.set("n", "<F4>", ":lua SetNextSpellLanguage()<CR>", { noremap = false, silent = false })

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  desc = "Show line diagnostics automatically in hover window",
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})
-- vim.cmd([[
-- autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
-- ]])

-- Go to next diagnostic warning/error
--
keymap.set("n", "]d", vim.diagnostic.goto_next, {
  desc = "Go to next [d]iagnostic message",
})
keymap.set("n", "[d", vim.diagnostic.goto_prev, {
  desc = "Go to previous [d]iagnostic message",
})
keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
  desc = "Show diagnostic [E]rror messages",
  noremap = true,
  silent = true,
})
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
  desc = "Open diagnostic [Q]uickfix list",
})

-- ##################################
-- Navigation, Movement & Mobility
-- ##################################
--
--
-- Quick open of Ex-mode
--
keymap.set("n", "<leader>ee", vim.cmd.Explore) -- Open netrw explorer

-- copy current filepath to clipboard
-- (starting from base path - vim starting directory aka pwd)
--
keymap.set("n", "<F2>", "<ESC>:let @+=expand('%:p')<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move entire selection Up/Down
--
keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Moving line by line with hjkl also in wrapped lines
--
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "k", "gk", { noremap = true })
keymap.set("v", "k", "gk", { noremap = true })

-- TIP: Disable arrow keys in normal mode
--
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Go to next/previous tab
--
keymap.set("n", "<leader>m", "<Esc>:bnext<CR>", { desc = "next tab" })
keymap.set("n", "<leader>n", "<Esc>:bprev<CR>", { desc = "previous tab" })
keymap.set("n", "C-n", "<Esc>:tabnew<CR>", { desc = "new tab", remap = true })

-- Move tab to left/right position in top tab-bar
--
keymap.set("n", "<F7>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()-1)<CR>")
keymap.set("n", "<F8>", "<Esc>:execute 'silent! tabmove' . (tabpagenr()+1)<CR>")

-- Resize windows
--
-- Explain: there is = instead of + because on standard ASCII keyboard to
-- create + sign you need to also press Shift
--
keymap.set("n", "<C-w>>", "<ESC>:vertical resize +5<CR>", {
  desc = "Resize window 5 points to left",
  noremap = true,
})
keymap.set("n", "<C-w><", "<ESC>:vertical resize -5<CR>", {
  desc = "Resize window 5 points to right",
  noremap = true,
})
keymap.set("n", "<C-w>=", "<ESC>:resize -5<CR>", {
  desc = "Resize window 5 points to down",
  noremap = true,
})
keymap.set("n", "<C-w>-", "<ESC>:resize +5<CR>", {
  desc = "Resize window 5 points to up",
  noremap = true,
})

-- DX improvenent: When J back prev line cursor stays at same place
--
keymap.set("n", "J", "mzJ`z")

-- DX improvenent: Cursor stays in middle when ...
--
keymap.set("n", "<C-d>", "<C-d>zz") -- when moving half page down
keymap.set("n", "<C-u>", "<C-u>zz") -- when moving half page up

-- ##################################
-- Enhance visualizations
-- ##################################
--

-- DX improvenent: Disable text highlight
--
local disable_text_highlight = "<Esc>:noh<CR>"
keymap.set("n", "<F3>", disable_text_highlight)
keymap.set("v", "<F3>", disable_text_highlight)

keymap.set("n", "n", "nzzzv") -- DX improvenent: when highlight next item
keymap.set("n", "N", "Nzzzv") -- DX improvenent: when highlight previous item

-- DX improvenent: do not replace copied buffer with system buffer while
-- pasting and send replaced to Void
--
keymap.set("x", "<leader>p", '"_dP')

-- jump to next tmux session without exiting
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format code
keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, {
  desc = "format code",
})

-- ##################################
-- Code (re)formatting or (re)shuffling
-- ##################################
--

-- replace current word (like local variable replace) also ask for each replacement
-- leader + r (replace)
--
-- This is a substitut of LSP rename function
--
keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI<Left><Left><Left>")

-- Change variables (local & global)
--
-- FIXME: Not well tested
--
keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>") -- local file
keymap.set("n", "gR", "gD:%s/<C-R>///gc<left><left><left>") -- Global

-- Sort selected lines A-Z
keymap.set("v", "<leader>s", ":sort<CR>", { desc = "[s]ort lines vertically", noremap = true })

-- Inline Sort
--
keymap.set("v", "<leader>is", "", { desc = "[i]nline [s]ort selected elements" })

-- Beautify JSON
local jsonBeautify = "<Esc>:%!jq . <CR>"
local jsonUglyfy = "<Esc>:%!jq -c . <CR>"
keymap.set("n", "<leader>jq", jsonBeautify) -- perform: jq on current buffer
keymap.set("n", "<leader>ujq", jsonUglyfy) -- perform: undo jq on current buffer

-- ##################################
-- Plugins
-- ##################################
--
-- plugins configurations and mapping are inside dedicated components
