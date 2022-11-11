

" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'             " useful keybindings for eg. fugitive plugin
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
    nnoremap <C-n> :NERDTree<CR>
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
      noremap <C-t> <plug>NERDTreeTabsToggle<CR>

    "}}}

  "}}}
  Plug 'preservim/nerdcommenter'
  Plug 'editorconfig/editorconfig-vim'    " editorconfig plugin

  Plug 'mechatroner/rainbow_csv'

  "{{{ nvim completition
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " For Ultisnips users.
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  "}}}

  "{{{ Golang support
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/guihua.lua' " recommanded if need floating window support
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "}}}

  Plug 'ctrlpvim/ctrlp.vim' "{{{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_clear_cache_on_exit = 0 " persist cache between sessions
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.swp$\|\.idea$\|build$\|bower_components\|node_modules\|dist\|target',
      \ 'file': '\v\.(swp|exe|so|dll|DS_Store)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

    let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
      \ 'AcceptSelection("t")': ['<cr>'],
      \ }

  "}}}
  Plug 'ryanoasis/vim-devicons' " Always load the vim-devicons as the very last one
call plug#end()

