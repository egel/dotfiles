"
" Plugins for neovim
"
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

    " default NERDTree window size
    let g:NERDTreeWinSize=40

    " Minimal menu
    let g:NERDTreeMinimalMenu=1

  "}}}
  Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' } "{{{
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:nerdtree_tabs_open_on_new_tab=1
    let g:nerdtree_tabs_autoclose=1
    let g:nerdtree_tabs_autofind=0

    " ---- Open and hide NERDTree for all available tabs {{{
      noremap <C-e> <plug>NERDTreeTabsToggle<CR>

    "}}}

  "}}}
  Plug 'preservim/nerdcommenter'
  Plug 'editorconfig/editorconfig-vim'    " editorconfig plugin

  Plug 'mechatroner/rainbow_csv'

  "{{{ nvim completition
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua' " lua completitions
  Plug 'hrsh7th/cmp-buffer'   " allow to show hints from current buffer
  Plug 'hrsh7th/cmp-path'     " help to complete file
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'onsails/lspkind.nvim' " allows for showing better context/origin of hints

  " LuaSnip.
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}


  " Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }

  " Prettier
  " Plug 'neovim/nvim-lspconfig' " required (loaded before)
  Plug 'nvim-lua/plenary.nvim' " INFO: Somehow got problems while not having it while opening angular ts components
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'

  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " use telescope instead

  " Telescope
  " required:
  "   nvim-lua/popup.nvim
  "   nvim-lua/plenary.nvim
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } "{{{
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fl <cmd>Telescope git_files<cr>

  "}}}

  Plug 'vim-test/vim-test'

  "{{{ Golang support
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/guihua.lua' " recommanded if need floating window support
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "}}}

  "Plug 'ctrlpvim/ctrlp.vim' "{{{
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'
    "let g:ctrlp_show_hidden = 1
    "let g:ctrlp_clear_cache_on_exit = 0 " persist cache between sessions
    "set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

    "let g:ctrlp_custom_ignore = {
      "\ 'dir':  '\.git$\|\.swp$\|\.idea$\|build$\|bower_components\|node_modules\|dist\|target\|_site',
      "\ 'file': '\v\.(swp|exe|so|dll|DS_Store)$',
      "\ 'link': 'some_bad_symbolic_links',
      "\ }

    "let g:ctrlp_prompt_mappings = {
      "\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
      "\ 'AcceptSelection("t")': ['<cr>'],
      "\ }

  ""}}}
  Plug 'ryanoasis/vim-devicons' " Always load the vim-devicons as the very last one
call plug#end()
