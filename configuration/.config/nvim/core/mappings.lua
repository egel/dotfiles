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
vim.mapleader = ","

-- Use <leader> in global plugin.
vim.g.mapleader = ","

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
vim.keymap.set("n", "Q", "<nop>")

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

-- ##################################
-- Diagnostics
-- ##################################
--
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

-- Show boarder in popup windows (diagnostic, hover, help)
--
vim.diagnostic.config({
  border = border,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  virtual_text = {
    source = "always",
    prefix = "▎", -- Could be '■', '●', '▎', 'x'
  },
  float = {
    border = border,
    source = "always",
  },
})
-- override theme's floating window background color to be same as in terminal
vim.cmd("autocmd ColorScheme * highlight! link FloatBorder Normal")

-- Change diagnostic symbols in the sign column (gutter)
--
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 300
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
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
  desc = "Show diagnostic [E]rror messages",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
  desc = "Open diagnostic [Q]uickfix list",
})

-- ##################################
-- Navigation, Movement & Mobility
-- ##################################
--
--
-- Quick open of Ex-mode
--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Ex stands for :Explore

-- copy current filepath to clipboard
-- (starting from base path - vim starting directory aka pwd)
--
vim.keymap.set("n", "<F2>", "<ESC>:let @+=expand('%:p')<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move entire selection Up/Down
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Moving line by line with hjkl also in wrapped lines
--
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "k", "gk", { noremap = true })
keymap.set("v", "k", "gk", { noremap = true })

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
vim.keymap.set("n", "<C-w>>", "<ESC>:vertical resize +5<CR>", {
  desc = "Resize window 5 points to left",
  noremap = true,
})
vim.keymap.set("n", "<C-w><", "<ESC>:vertical resize -5<CR>", {
  desc = "Resize window 5 points to right",
  noremap = true,
})
vim.keymap.set("n", "<C-w>=", "<ESC>:resize -5<CR>", {
  desc = "Resize window 5 points to down",
  noremap = true,
})
vim.keymap.set("n", "<C-w>-", "<ESC>:resize +5<CR>", {
  desc = "Resize window 5 points to up",
  noremap = true,
})

-- DX improvenent: When J back prev line cursor stays at same place
--
vim.keymap.set("n", "J", "mzJ`z")

-- DX improvenent: Cursor stays in middle when ...
--
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- when moving half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- when moving half page up

-- ##################################
-- Enhance visualizations
-- ##################################
--

-- DX improvenent: Disable text highlight
--
local disable_text_highlight = "<Esc>:noh<CR>"
keymap.set("n", "<F3>", disable_text_highlight)
keymap.set("v", "<F3>", disable_text_highlight)

vim.keymap.set("n", "n", "nzzzv") -- DX improvenent: when highlight next item
vim.keymap.set("n", "N", "Nzzzv") -- DX improvenent: when highlight previous item

-- DX improvenent: do not replace copied buffer with system buffer while
-- pasting and send replaced to Void
--
vim.keymap.set("x", "<leader>p", '"_dP')

-- jump to next tmux session without exiting
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format code
vim.keymap.set("n", "<leader>f", function()
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
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI<Left><Left><Left>")

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
vim.keymap.set("v", "<leader>is", "", { desc = "[i]nline [s]ort selected elements" })

-- Beautify JSON
local jsonBeautify = "<Esc>:%!jq . <CR>"
local jsonUglyfy = "<Esc>:%!jq -c . <CR>"
keymap.set("n", "<leader>jq", jsonBeautify) -- perform: jq on current buffer
keymap.set("n", "<leader>ujq", jsonUglyfy) -- perform: undo jq on current buffer

-- ##################################
-- Plugins
-- ##################################
--

-- nvim-tree
--
vim.keymap.set("n", "<F9>", "<Esc>:NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set("n", "<F10>", "<Esc>:NvimTreeFindFile<CR>", { noremap = true })

-- nvim-telescope
--
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {
  desc = "[f]ind [f]iles",
})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {
  desc = "[f]ind [g]rep",
})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {
  desc = "[f]ind in [b]uffers",
})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<leader>gI", telescope_builtin.lsp_implementations, {
  desc = "[g]oto [I]mplementation",
})

-- LSP
--
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      desc = { "[g]o to [d]efinition" },
      buffer = ev.buf,
    })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
      desc = { "[g]o to [D]eclaration" },
      buffer = ev.buf,
    })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
      desc = "[c]ode [a]ction",
      buffer = ev.buf,
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
      desc = "Hover documentation",
      buffer = ev.buf,
    })
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
      buffer = ev.buf,
    })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
      buffer = ev.buf,
    })

    -- Rename the variable under your cursor (WORKS ONLY WITH LSP)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
      desc = "[r]ename",
      buffer = ev.buf,
    })
  end,
})

-- gitsigns (plugin)
--
require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, { desc = "[h]unk [s]tage" })
    map("n", "<leader>hr", gs.reset_hunk)
    map("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[h]unk [u]ndo staged" })
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end)
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", gs.diffthis)
    map("n", "<leader>hD", function()
      gs.diffthis("~")
    end)
    map("n", "<leader>td", gs.toggle_deleted)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})
