"
" Plugins for neovim
"
" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')

  " Base plugins use by other plugins
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive' "{{{
    autocmd BufReadPost fugitive://* set bufhidden=delete

  "}}}
  Plug 'tpope/vim-unimpaired'             " useful keybindings for eg. fugitive plugin
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  Plug 'airblade/vim-gitgutter' "{{{
    let g:gitgutter_realtime = 1
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '~'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_removed_first_line = '^^'
    let g:gitgutter_sign_modified_removed = '~-'
  "}}}
  Plug 'preservim/nerdtree' "{{{
    nnoremap <Leader>n :NERDTreeFocus<CR>
    "nnoremap <C-n> :NERDTree<CR>
    "nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>

    let NERDTreeIgnore = [
      \ '\~$',
      \ '\.pyc$',
      \ '__pycache__',
      \ '\.swp$',
      \ '\.DS_Store',
      \ '\.git$',
      \ '\.hg',
      \ 'node_modules'
      \ ]

    " Use custom arrows
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    " Show hidden files (default, switch by 'Shift + I')
    let NERDTreeShowHidden=1

    " Default NERDTree window size
    let g:NERDTreeWinSize=50

    " Minimal menu
    let g:NERDTreeMinimalMenu=0

  "}}}
  Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' } "{{{
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:nerdtree_tabs_open_on_new_tab=1
    let g:nerdtree_tabs_autoclose=1
    let g:nerdtree_tabs_autofind=0

    " ---- Open and hide NERDTree for all available tabs {{{
      nnoremap <C-e> <plug>NERDTreeTabsToggle<CR>

    "}}}

  "}}}
  Plug 'preservim/nerdcommenter'
  Plug 'editorconfig/editorconfig-vim'    " editorconfig plugin

  " Add git info message after the line
  Plug 'f-person/git-blame.nvim'

  " Help operating on CSV files
  Plug 'mechatroner/rainbow_csv'

  " The fastest syntax highlighter
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'theHamsta/nvim-dap-virtual-text'

  " Mason (should be before lsp)
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  "{{{ nvim LSP completition
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua' " lua completitions
  Plug 'hrsh7th/cmp-buffer'   " allow to show hints from current buffer
  Plug 'hrsh7th/cmp-path'     " help to complete file
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'onsails/lspkind.nvim' " allows for showing better context/origin of hints

  " LuaSnip
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'} " (required by lsp-zero)

  "Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
  "}}}

  " Add nice bottom line in editor modes
  Plug 'nvim-lualine/lualine.nvim'

  Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
  Plug 'theprimeagen/harpoon'

  " Prettier
  " Plug 'neovim/nvim-lspconfig' " required (loaded before)
  "Plug 'nvim-lua/plenary.nvim' " INFO: Somehow got problems while not having it while opening angular ts components
  "Plug 'jose-elias-alvarez/null-ls.nvim'
  "Plug 'MunifTanjim/prettier.nvim'
  "Plug 'prettier/vim-prettier', {
    "\ 'do': 'yarn install --frozen-lockfile --production',
    "\ 'branch': 'release/0.x',
    "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']
    "\ }

  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " use telescope instead

  " Telescope
  " required:
  "   nvim-lua/popup.nvim
  "   nvim-lua/plenary.nvim
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

  Plug 'vim-test/vim-test' "{{{
    let g:test#javascript#runner = 'jest'

    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    "nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    "nmap <silent> <leader>g :TestVisit<CR>
  "}}}

  "{{{ Golang support
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/guihua.lua' " recommanded if need floating window support
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
  "}}}

  "Plug 'davidhalter/jedi-vim'

  " Preview CSS colors inside terminal
  " It's not perfectly accurate but gives relative information about a color
  Plug 'ap/vim-css-color'

  Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

