--
--
vim.opt.encoding = "UTF-8"

-- window-scoped options
--
vim.wo.colorcolumn = "80,120"

vim.opt.guicursor = "" -- bold cursor
vim.opt.cursorline = true -- show current line with color
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false -- do not show the mode as it is already in status line

-- General tab settings
--
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.shiftwidth = 4 -- number of spaces to use for autoindent
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.expandtab = true -- expand tab to spaces so that tabs are spaces

vim.opt.scrolloff = 15
vim.opt.title = true

vim.opt.confirm = true -- Raise a dialogue asking if you wish to save changed files
vim.opt.ruler = true -- Show row and column in footer

-- vim.opt.clipboard = "unnamed,unnamedplus"  -- Use the system clipboard for yank/put/delete
vim.opt.fileformats = "unix,dos" -- Prefer unix fileformat
vim.opt.backspace = "indent,eol,start" -- Allow backspacing over everything in insert mode

vim.opt.foldenable = false -- No default fold, using plugin instead

vim.opt.list = true -- Highlight whitespace
vim.opt.listchars = "tab:»·,trail:•,eol:¬,nbsp:␣,extends:❯,precedes:❮" -- show extra space characters
vim.opt.autoindent = true -- Set auto indent to match adjacent lines

vim.opt.wildmenu = true -- Show list for autocompletion
vim.opt.wildignore = "*.o,*.obj,*~" -- Stuff to ignore when tab completing
  .. "*sass-cache*" -- ignore sass related stuff
  .. "*.DS_Store" -- ignore Mac related stuff
  .. "log/**,tmp/**" -- ignore Linux related stuff
  .. "*/.git/*" -- ignore git directory for repository
  .. "*/.svn/*" -- ignore SVN directory for repository
  .. "*/.idea/*" -- ignore IntelliJ directory for repository
  .. "*/.vscode/*" -- ignore VSCode directory for repository
  .. "*/venv/*" -- ignore default python virtual environment directory for repository
  .. "*/vendor" -- ignore Go related directory
  .. "*/node_modules/*" -- ignore Node related directory

vim.opt.history = 1000 -- Remember more commands and search history
vim.opt.undolevels = 1000 -- Use many muchos levels of undo
vim.opt.ignorecase = true -- Use case insensitive search, except when using capital letters
vim.opt.smartcase = true -- Do case-sensitive if there's a capital letter
vim.opt.smarttab = true -- Use shiftwidth to enter tabs
vim.opt.hlsearch = true -- Highlight searches
vim.opt.showmatch = true -- Show bracket matches
vim.opt.incsearch = true -- Show search results as I type

vim.opt.sessionoptions = "unix,slash" -- For unix/windows compatibility
--vim.opt.sessionoptions -= "options"
-- INVALID vim.opt.nostartofline = true                 -- Do not go to start of line automatically when moving

vim.opt.splitbelow = true
vim.opt.splitright = true

-- vim.opt.commentstring = "#\ %s"           -- add space before adding comment

vim.opt.breakindent = true -- preserve horizontal block indent
vim.opt.showbreak = "↪" -- Character to show before the lines that have been soft-wrapped

-- No backup, no swap, PERIOD !!!
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.spelllang = "en,pl,de"
vim.opt.spellsuggest = "9" -- show 9 spell suggestions at most

-- Insert mode key word completion setting
--vim.opt.complete+=kspell complete-=w complete-=b complete-=u complete-=t

--vim.opt.winblend=0  -- pseudo transparency for floating window

--vim.opt.mpletion behaviour
--vim.opt.completeopt+=menuone  -- Show menu even if there is only one item
--vim.opt.completeopt-=preview  -- Disable the preview window
