" vim: ft=vim fdm=marker ts=2 sts=2 sw=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Egel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reset everything to their defaults {{{
set all&

"}}}
" Enable no Vi commands compatibility {{{
set nocompatible

"}}}
" Skip initialization for vim-tiny or vim-small. {{{
  if !1 | finish | endif

"}}}
" Library functions {{{
  " Remove newline char from string
  function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
  endfunction

  " List of supported vim filetypes
  function! GetFiletypes()
    " Get a list of all the runtime directories by taking the value of that
    " option and splitting it using a comma as the separator.
    let rtps = split(&runtimepath, ",")
    " This will be the list of filetypes that the function returns
    let filetypes = []

    " Loop through each individual item in the list of runtime paths
    for rtp in rtps
      let syntax_dir = rtp . "/syntax"
      " Check to see if there is a syntax directory in this runtimepath.
      if (isdirectory(syntax_dir))
        " Loop through each vimscript file in the syntax directory
        for syntax_file in split(glob(syntax_dir . "/*.vim"), "\n")
          " Add this file to the filetypes list with its everything
          " except its name removed.
          call add(filetypes, fnamemodify(syntax_file, ":t:r"))
        endfor
      endif
    endfor

    " This removes any duplicates and returns the resulting list.
    " NOTE: This might not be the best way to do this, suggestions are welcome.
    return uniq(sort(filetypes))
  endfunction

"}}}
" Detect OS {{{
  let s:uname = system("echo -n \"$(uname)\"")
  let s:is_windows = has('win32') || has('win64')
  let s:is_cygwin = has('win32unix')
  let s:is_linux = has('unix') && s:uname == 'Linux'
  let s:is_macvim = has('gui_macvim') || has('unix') && s:uname == 'Darwin'

"}}}
" VIMDOT: initialize default vim settings {{{
  let s:settings={}
  let s:settings.default_indent=2
  let s:settings.max_column=120
  let s:settings.autocomplete_method='neocomplete'
  let s:settings.enable_cursorcolumn=0
  let s:settings.background='dark'
  let s:settings.background_color='#282828'
  let s:settings.colorscheme='gruvbox'
  let s:settings.airline_theme='tomorrow'
  let s:settings.history_levels=1000
  let s:settings.enable_cursorcolumn=1

"}}}
" Map leader key to comma {{{
  " It is not mapped with respect well unless We will set it before setting
  " for plug in.
  let mapleader = ','

  " Use <Leader> in global plugin.
  let g:mapleader = ','

  " Release keymappings for plug-in.
  nnoremap ;  <Nop>
  xnoremap ;  <Nop>
  nnoremap m  <Nop>
  xnoremap m  <Nop>
  nnoremap ,  <Nop>
  xnoremap ,  <Nop>

"}}}
" Set augroup {{{
  augroup MyAutoCmd
    autocmd!
  augroup END

"}}}
" Set shellshlash for Win {{{
  if s:is_windows
    set shellslash
  endif

"}}}
" Setup Vim-Plug management -------------------------------------------- {{{
  " Automatically install vim-plug if not exists {{{
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

  "}}}
  " Specify a directory for plugins {{{
  " - For Neovim: ~/.local/share/nvim/plugged
  " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')

  "}}}
  " Core plugins {{{
    Plug 'vim-scripts/matchit.zip'
    Plug 'vim-airline/vim-airline' "{{{
      let g:airline#extensions#tabline#buffer_min_count = 2
      let g:airline#extensions#tabline#close_symbol = '×'
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename (no path) in the tab
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline#extensions#tabline#show_close_button = 0
      let g:airline#extensions#tabline#show_splits = 0
      let g:airline#extensions#tabline#show_tab_nr = 0
      let g:airline#extensions#tabline#show_tab_type = 0
      let g:airline#extensions#tabline#show_tabs = 1
      let g:airline#extensions#tabline#tab_min_count = 1 " minimum number of tabs needed to show the tabline.
      let g:airline#extensions#tmuxline#enabled = 0 " disable airline override tmuxline
      let g:airline_powerline_fonts = 1
      let g:airline_theme = s:settings.airline_theme

    "}}}
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive' "{{{
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>gr :Gremove<CR>
      autocmd BufReadPost fugitive://* set bufhidden=delete

    "}}}
    Plug 'kien/ctrlp.vim' "{{{
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_show_hidden = 1
      set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
      set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

      let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|hg|idea))$',
        \ 'file': '\v\.(exe|so|dll)$',
        \ 'link': 'some_bad_symbolic_links',
        \ }

      let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<cr>'],
        \ }

    "}}}
    Plug 'tpope/vim-unimpaired'             " useful keybindings for eg. fugitive plugin
    Plug 'editorconfig/editorconfig-vim'    " editorconfig plugin
    Plug 'Konfekt/FastFold' "{{{
      let g:tex_fold_enabled=1
      let g:vimsyn_folding='af'
      let g:xml_syntax_folding = 1
      let g:php_folding = 1
      let g:perl_fold = 1

    "}}}

  "}}}
  " Other plugins {{{
    " Python plugins {{{
      Plug 'davidhalter/jedi-vim', {'for': 'python'} " python syntax + integration {{{
        let g:jedi#popup_on_dot=0

      "}}}
      Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 syntax

    "}}}
    " golang {{{
      Plug 'fatih/vim-go', {'for': 'go'}
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_types = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1

    "}}}
    Plug 'statianzo/vim-jade', {'for': 'jade'} " jade, unmaintained (vim-pug is not ready yet)
    Plug 'digitaltoad/vim-pug', {'for': 'pug'} " pug (formerly Jade)
    Plug 'mustache/vim-mustache-handlebars', {'for': ['mustache','handlebars']}
    Plug 'tpope/vim-haml', {'for': ['sass', 'scss']} "{{{ SASS, SCSS and haml syntax
      autocmd FileType scss,sass set iskeyword+=-
    "}}}
    Plug 'gcorne/vim-sass-lint', {'for': ['sass', 'scss']}
    Plug 'othree/html5.vim', {'for': 'html'}
    Plug 'groenewege/vim-less', {'for': 'less'} "{{{
      autocmd FileType less set iskeyword+=-
    "}}}
    Plug 'othree/yajs.vim', {'for': ['javascript', 'coffee', 'ls']} " JavaScript syntax (also ES6/ES2015)
    Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'coffee', 'ls']}
    Plug 'elzr/vim-json', {'for': 'json'} "{{{
      let g:vim_json_syntax_conceal = 0 " turn off onfly
      augroup json_autocmd
        autocmd!
        autocmd FileType json set foldmethod=syntax
      augroup END

    "}}}
    Plug 'leafgarland/typescript-vim', {'for': 'typescript'} "{{{
      let g:typescript_indent_disable = 1
      " let g:typescript_compiler_binary = 'tsc'
      " let g:typescript_compiler_options = ''
      " autocmd FileType typescript :set makeprg=tsc
      " autocmd QuickFixCmdPost [^l]* nested cwindow
      " autocmd QuickFixCmdPost    l* nested lwindow

    "}}}
    Plug 'godlygeek/tabular' " require by vim-markdown
    Plug 'plasticboy/vim-markdown', {'for': ['md', 'markdown', 'ngdoc']} "{{{
      let g:vim_markdown_folding_disabled = 0
      let g:vim_markdown_toc_autofit = 1
      let g:vim_markdown_conceal = 0
      let g:vim_markdown_fenced_languages = [
        \ 'viml=vim',
        \ 'bash=sh',
        \ 'shell=sh',
        \ 'ini=dosinia' ]
      let g:vim_markdown_math = 1
      let g:vim_markdown_new_list_item_indent = 4

    "}}}
    Plug 'kylef/apiblueprint.vim'          " blueprint/apiari syntax
    Plug 'smancill/conky-syntax.vim'       " conky file syntax
    Plug 'ekalinin/Dockerfile.vim'         " dockerfile syntax
    Plug 'chr4/nginx.vim' "{{{
      au BufRead,BufNewFile */usr/local/etc/nginx/sites-available/* set ft=nginx
      au BufRead,BufNewFile */usr/local/etc/nginx/sites-enabled/* set ft=nginx

    "}}}
    Plug 'keith/tmux.vim'
    Plug 'scrooloose/nerdtree' "{{{
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

      " NERDTree Files highlighting
      function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        execute 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        execute 'autocmd filetype nerdtree syn match ' . a:extension .' #^.*\.'. a:extension .'$#'
      endfunction

      if (&bg=='dark')
        let _NERDTreeHighlightBgColor=s:settings.background_color
        call NERDTreeHighlightFile('markdown', 'cyan', 'none', 'cyan', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('md', 'cyan', 'none', 'cyan', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('vimrc', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('gvimrc', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('zshrc', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('muttrc', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('editorconfig', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('gitignore', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('gitconfig', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('gitmodules', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('gitconfig.local', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('ini', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('config', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('conf', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('html', 'green', 'none', 'green', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('pug', 'green', 'none', 'green', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('jade', 'green', 'none', 'green', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('styl', 'magenta', 'none', 'magenta', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('css', 'magenta', 'none', 'magenta', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('sass', 'magenta', 'none', 'magenta', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('scss', 'magenta', 'none', 'magenta', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('coffee', 'red', 'none', 'red', _NERDTreeHighlightBgColor)
        call NERDTreeHighlightFile('js', 'red', 'none', 'red', _NERDTreeHighlightBgColor)

        call NERDTreeHighlightFile('sql', 'blue', 'none', 'blue', _NERDTreeHighlightBgColor)
      endif

    "}}}
    Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' } "{{{
      let g:nerdtree_tabs_open_on_gui_startup=1
      let g:nerdtree_tabs_open_on_new_tab=1
      let g:nerdtree_tabs_autoclose=1
      let g:nerdtree_tabs_autofind=0

    "}}}
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' } "{{{
      let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }

    "}}}
    Plug 'scrooloose/nerdcommenter' "{{{
      let NERDSpaceDelims = 1

    "}}}
    Plug 'ervandew/supertab' "{{{
      let g:SuperTabDefaultCompletionType = "<C-n>"

    "}}}
    Plug 'scrooloose/syntastic' "{{{
      let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes': ['python', 'javascript', 'jade'],
        \ 'passive_filetypes': []
      \ }

      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*

      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      " if add other then linter will check one for another checker
      let g:syntastic_markdown_mdl_exec = 'markdownlint'
      let g:syntastic_typescript_checkers = ['tslint'] " other 'tsc'
      let g:syntastic_javascript_checkers = ['eslint'] " 'standard', 'jslint'
      let g:syntastic_go_checkers = ['go', 'govet', 'golint']
      let g:syntastic_python_checkers = ['flake8', 'pylint', 'pyflakes']
      let g:syntastic_jade_checkers = ['jade_lint']
      let g:syntastic_json_checkers = ['jsonlint']
      let g:syntastic_sass_checkers=["sass_lint"]
      let g:syntastic_scss_checkers=["sass_lint"]
      let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

      let g:syntastic_check_on_open = 1
      let g:syntastic_error_symbol = '✗'
      let g:syntastic_warning_symbol = '∆' " ⚠
      let g:syntastic_style_error_symbol = '✗'
      let g:syntastic_style_warning_symbol = '∆' " ⚠

    "}}}

    Plug 'airblade/vim-gitgutter' "{{{
      let g:gitgutter_realtime = 1
      let g:gitgutter_sign_added = '+'
      let g:gitgutter_sign_modified = '~'
      let g:gitgutter_sign_removed = '-'
      let g:gitgutter_sign_removed_first_line = '^^'
      let g:gitgutter_sign_modified_removed = '~-'

      if (&bg=='dark')
        highlight clear SignColumn
        highlight GitGutterAdd            ctermfg=green   guifg=#9CCF31
        highlight GitGutterChange         ctermfg=yellow  guifg=#F7D708
        highlight GitGutterChangeDelete   ctermfg=yellow  guifg=#F7D708
        highlight GitGutterDelete         ctermfg=red     guifg=#CE0000
      endif

      " this difference can be tracked by this issue: https://github.com/airblade/vim-gitgutter/issues/113
      if has('gui_running')
        set updatetime=250
      else
        " must be more then 1200ms (due to internal tasks of vim)
        set updatetime=1300
      endif

    "}}}
    Plug 'xolox/vim-misc' " as dependency for vim-session
    Plug 'xolox/vim-session' "{{{
      let g:session_autosave = 'no'
      let g:session_autoload = 'no'
      let g:session_lock_enabled = 1      " Enable all session locking :-)
      let g:session_default_to_last = 1   " Open your last used session instead of the default session
      let g:session_directory = "~/.vim/sessions"  " default path for UNIX

      " Save session on quitting Vim
      " autocmd VimLeave * NERDTreeTabsClose
      " autocmd VimLeave * call SaveSession

      " (OFF) Restore session on starting Vim
      " autocmd VimEnter * call MySessionRestoreFunction()
      " autocmd VimEnter * NERDTree

    "}}}
    Plug 'nathanaelkane/vim-indent-guides' "{{{
      " ctermgb colors https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
      let g:indent_guides_auto_colors = 0

      " borrowed from https://github.com/scrooloose/nerdtree
      let g:indent_guides_exclude_filetypes = ['nerdtree']

      " auto-enable indent guides
      autocmd WinEnter * :IndentGuidesEnable

      if (&bg=='dark')
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2D2D2D   ctermbg=240
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#414141   ctermbg=237
      endif

    "}}}
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'ap/vim-css-color', {'for': ['sass', 'scss', 'css']} " Color CSS codes
    Plug 'junegunn/goyo.vim', {'for': 'markdown'} " Distraction-free writing in Vim.

    " Colorschemes {{{
      Plug 'morhetz/gruvbox'
      Plug 'altercation/vim-colors-solarized' "{{{
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
      "}}}
      Plug 'chriskempson/vim-tomorrow-theme'
      Plug 'nanotech/jellybeans.vim'
      Plug 'sickill/vim-monokai'

    "}}}

  call plug#end()

  "}}} end vim-plug
" Basic vim settings ------------------------------------------------------ {{{
  " enable syntax highlighting
  syntax on

  let &background = s:settings.background

  set modifiable
  if has("multi_byte")
    set encoding=utf-8      " The encoding displayed.
    set fileencoding=utf-8  " The encoding written to file.
    set termencoding=utf-8
  endif

  set noshelltemp                                 " Use pipes
  set clipboard=unnamed,unnamedplus               " Use the system clipboard for yank/put/delete
  set fileformats=unix,dos                        " Prefer unix fileformat
  set backspace=indent,eol,start                  " Allow backspacing over everything in insert mode

  " No default fold, using plugin instead
  set nofoldenable
  " set foldenable                                  "enable folds by default
  " set foldmethod=syntax                           "fold via syntax of files
  " set foldlevelstart=99                           "open all folds by default
  " let g:xml_syntax_folding=1                      "enable xml folding

  " No error bells, annoying visual bell
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif
  set shell=/bin/bash

  set confirm                                     " Raise a dialogue asking if you wish to save changed files
  let &history=s:settings.history_levels          " Remember more commands and search history
  let &undolevels=s:settings.history_levels       " Use many muchos levels of undo
  set ruler                                       " Show row and column in footer

  set scrolloff=5                                 " Minimum lines above/below cursor
  set mouse=a                                     " Enable use of the mouse for all modes
  set laststatus=2                                " Always show status bar
  set ttimeoutlen=600                             " Vim timeout for insert related/continue command
  set showcmd                                     " Show partial commands in the last line of the screen
  set title                                       " Change the terminal's title
  set list                                        " Highlight whitespace
  set listchars=tab:»·,trail:•,eol:¬,nbsp:_,extends:❯,precedes:❮ " show extra space characters
  set autoindent                                  " Set auto indent to match adjacent lines
  let &tabstop=s:settings.default_indent          " Number of spaces per tab for display
  let &shiftwidth=s:settings.default_indent       " Number of spaces per tab in insert mode
  let &softtabstop=s:settings.default_indent      " Number of spaces when indenting
  set expandtab                                   " Use spaces, not tab characters
  set hlsearch                                    " auto highlight when search (even with * sign)

  " Display line numbers on every window split except NERDTree
  if(exists('t:NERDTreeBufName') && bufname('%') == t:NERDTreeBufName)
    set nonumber
  else
    set number relativenumber
  endif

  " Default wrap all files except NERDTree
  if (!(exists('t:NERDTreeBufName') && bufname('%') == t:NERDTreeBufName))
    set wrap linebreak nolist
    set showbreak=↪\ \ \          " display this sign at the begin of wrapped line
  endif

  set wildmenu                    " Show list for autocompletion
  set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
  set wildignore+=*sass-cache*    " ignore sass related stuff
  set wildignore+=*DS_Store*      " ignore Mac related stuff
  set wildignore+=log/**,tmp/**   " ignore Linux related stuff

  set ignorecase                    " Use case insensitive search, except when using capital letters
  set smartcase                     " Do case-sensitive if there's a capital letter
  set smarttab                      " Use shiftwidth to enter tabs
  set hlsearch                      " Highlight searches
  set showmatch                     " Show bracket matches
  set incsearch                     " Show search results as I type

  set sessionoptions+=unix,slash    " For unix/windows compatibility
  set sessionoptions-=options
  set nostartofline                 " Do not go to start of line automatically when moving

  set splitbelow
  set splitright

  set commentstring=#\ %s           " add space before adding comment

"}}}
" Font, window dimmensions {{{
  " Hack font support Powerline characters
  if has("gui_running")
    set lines=999 columns=9999 " open maximized
    set linespace=12    " set space between lines (option only for GUI)
    set guioptions-=T   " turn off GUI toolbar (icons)
    set guioptions+=c   " use console dialogs
    " set guioptions-=e   " use GUI tabs if possible
    set guioptions-=r   " turn off GUI right scrollbar
    set guioptions-=L   " turn off GUI left scrollbar

    if s:is_macvim
      set guifont=Hack:h11
    elseif s:is_linux
      set guifont=Hack\ 11
    elseif s:is_windows
      set guifont=Consolas:h11:cANSI
    else
      set guifont=Hack:h11:cDEFAULT
    endif
  endif

"}}}
" Backups ----------------------------------------------------------------- {{{
  " No backup, no swap, PERIOD !!!
  set nobackup nowritebackup noswapfile autoread

"}}}
" Folding -------------------------------------------------------------- {{{
  " Set folding for vim files
  augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
  augroup END

  " Set folding for JavaScript files
  augroup ft_js
    au!
    au FileType javascript setlocal foldmethod=marker foldmarker={,}
  augroup END

  " folding for coffeescript & jade files
  " au FileType jade, coffeescript setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'->$'&&indent(v:lnum)<indent(v:lnum+1)?'a1':'s1'

"}}}

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" Auto commands ----------------------------------------------------------- {{{
  " Only do this part when compiled with support for autocommands.
  if has("autocmd")
    " ---- Highlight trailing spaces in annoying red {{{
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    "}}}
    " ---- Show trailing white spaces and spaces before a tab {{{
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

    "}}}
    " ---- Open files with proper syntax {{{

    "}}}
    " ---- Jump to last known cursor position on BufReadPost {{{
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " NOTE: read viminfo/marks, but removed: causes issues with jumplist sync
    " across Vim instances
      " \   rviminfo |
    " NOTE: removed for SVN commit messages: && fnamemodify(bufname('%'), ':t') != 'svn-commit.tmp'
    " ref: :h last-position-jump
    fun! AutojumpLastPosition()
      if ! exists('b:autojumped_init')
        let b:autojumped_init = 1
        if &ft != 'gitcommit' && &ft != 'diff' && ! &diff && line("'\"") <= line("$") && line("'\"") > 0
          " NOTE: `zv` is ignored with foldlevel in modeline.
          exe 'normal! g`"zv'
        endif
      endif
    endfun
    autocmd BufReadPost * call AutojumpLastPosition()

    "}}}
    " ---- Automatically reload .vimrc source when saved {{{
    function! RefreshUI()
      if exists(':AirlineRefresh')
        AirlineRefresh
      else
        " Clear & redraw the screen, then redraw all statuslines.
        redraw!
        redrawstatus!
      endif
    endfunction

    " au BufWritePost .vimrc source $MYVIMRC | :call RefreshUI()

    "}}}
    " ---- Git {{{
    autocmd FileType gitcommit setlocal spell

    "}}}
  endif " end of has("autocmd")

"}}}
" Key Mapping (key binding) ---------------------------------------------- {{{
  " ---- Map W, Q and WQ, WA as usual typo {{{
    command! WQ wq
    command! Wq wq
    command! Wa wa
    command! WA wa
    command! W w
    command! Q q

  "}}}
  " ---- w!! - which will sudo & save a file {{{
    cmap w!! %!sudo tee >/dev/null %

  "}}}
  " ---- <F3> key to hide current highlight for searched terms {{{
    map <F3> :noh<CR>
    nnoremap <F3> :set hlsearch! hlsearch?<CR>

  "}}}
  " ---- Toggle spell check with <F4> (default: en_us) {{{
  "switch spellcheck languages
    let g:myLang = 0
    let g:myLangList = [ "nospell", "en_us", "pl", "de_de" ]
    function! MySpellLang()
      "loop through languages
      let g:myLang = g:myLang + 1
      if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
      if g:myLang == 0 | set nospell | endif
      if g:myLang == 1 | setlocal spell spelllang=en_us | endif
      if g:myLang == 2 | setlocal spell spelllang=pl | endif
      if g:myLang == 3 | setlocal spell spelllang=de_de | endif
      echo "Set spell language:" g:myLangList[g:myLang]
    endf

    map <F4> :call MySpellLang()<CR>
    imap <F4> <ESC>:call MySpellLang()<CR>

  "}}}
  " ---- (OFF) Saving file <F5>, <F6> {{{
    "map <F5> :w<CR>                  " <F5> key save the file
    "map <F6> :wq<CR>                 " <F6> key save and exit the file

  "}}}
  " ---- bind Alt+<movement> keys to move around the windows instead of using Ctrl+w + <movement> {{{
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-h> <C-w>h
    map <C-l> <C-w>l

  "}}}
  " ---- Easier moving of code blocks  {{{
    "vnoremap < <gv                " Move to next section
    "vnoremap > >gv                " Move to previous section

  "}}}
  " ---- Jumping to move lines up/down  {{{
    nnoremap <A-J> :m .+1<CR>==
    nnoremap <A-K> :m .-2<CR>==
    inoremap <A-J> <Esc>:m .+1<CR>==gi
    inoremap <A-K> <Esc>:m .-2<CR>==gi
    vnoremap <A-J> :m '>+1<CR>gv=gv
    vnoremap <A-K> :m '<-2<CR>gv=gv

  "}}}
  " ---- disable ex mode {{
    map Q <Nop>

  "}}}
  " ---- TODO: disable Alt+[eoaszc] in input mode to not block Polish characters {{{
    " remove insert-mode mapping for Alt+a

  "}}}
  " ---- vim moving with hjkl in wrapped lines {{{
    nmap j gj
    nmap k gk
    vnoremap j gj
    vnoremap k gk
  "}}}
  " ---- Go to next/previous tab {{{
    noremap <leader>m <Esc>:tabnext<CR>
    noremap <leader>n <Esc>:tabprevious<CR>
    noremap <C-n> <Esc>:tabnew<CR>

  "}}}
  " ---- Map sort method {{{
    vnoremap <Leader>s :sort<CR>

  "}}}
  " ---- Move tab to left/right position in top tab-bar {{{
    map <F7> :execute 'silent! tabmove' . (tabpagenr()-2)<CR>
    map <F8> :execute 'silent! tabmove' . (tabpagenr()+1) <CR>

  "}}}
  " ---- Open and hide NERDTree with multiple tabs {{{
    map <Leader>p <plug>NERDTreeTabsToggle<CR>

  "}}}
  " ---- Find current file in NERDTree {{{
    map <leader>r :NERDTreeFind<CR>

  "}}}
  " ---- Space to toggle folds {{{
    nnoremap <space> za
    vnoremap <space> za

  "}}}
" Features ---------------------------------------------------------------- {{{
  " ---- Highlight TODO, FIXME, NOTE, etc. in any file {{{
    if has("autocmd")
      if v:version > 701
        autocmd syntax * call matchadd('ErrorMsg', '\v[@]?((FIXME)|(XXX)|(BUG))([ ]+)?(:)?')
        autocmd syntax * call matchadd('IncSearch', '\v[@]?((TODO)|(CHANGED)|(HACK))([ ]+)?(:)?')
        autocmd syntax * call matchadd('PmenuSel', '\v[@]?((NOTE)|(INFO)|(IDEA))([ ]+)?(:)?')
      endif
    endif

  "}}}
  " ---- Open the file in a new tab if it isn't already open {{{
    command! -nargs=1 -complete=file O tab drop <args>

  "}}}
  " ---- Remove trailing spaces on save file {{{
  fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun
  " autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " ---- Switch from: UPPER CASE, then to lower case, then to Title Case
  function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
      let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
      let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
      let result = toupper(a:str)
    endif
    return result
  endfunction
  vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

  " ---- Force setting for *.md files. More info: https://github.com/tpope/vim-markdown
  function! SetMarkdownOptions()
    set filetype=markdown
    " setlocal spell
    " setlocal textwidth=80
  endfunction
  autocmd BufNewFile,BufReadPost *.md,*.markdown,*.ngdoc call SetMarkdownOptions()

  "}}}
  " Create directory on save if not exsist {{{
  " Gracefully borrowed from: http://stackoverflow.com/a/4294176/1977012
  function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
      let dir=fnamemodify(a:file, ':h')
      if !isdirectory(dir)
        call mkdir(dir, 'p')
      endif
    endif
  endfunction
  augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup END

  "}}}
  " Edit a file or jump to it if already open {{{
  command! -nargs=1 -complete=file O tab drop <args>

  "}}}

"}}}
" Appearance ------------------------------------------------------------- {{{
  execute 'colorscheme '.s:settings.colorscheme

  " ---- Settings for Vim GUI {{{
  if !has('gui_running')
    " Enable 256 color terminal.
    if !exists('$TMUX')
      set t_Co=256

      " For prevent bug.
      autocmd MyAutoCmd VimLeave * set term=screen
    endif

    if has('gui')
      if !exists('g:colors_name')
        execute 'colorscheme '.s:settings.colorscheme
      endif
    endif
  endif

  "}}}
  " ---- Define your own colors {{{
  " Must be included before colorscheme !!!
  if !exists("autocmd_colorscheme_loaded")
    augroup VimrcColors
    au!
      autocmd ColorScheme * highlight TodoRed     ctermbg=darkgreen guibg=#eeeeee   ctermfg=Red           guifg=#E01B1B
      autocmd ColorScheme * highlight TodoOrange  ctermbg=darkgreen guibg=#002b37   ctermfg=LightMagenta  guifg=#E0841B
    augroup END
  endif

  "}}}
  " ---- Highlight current line and column {{{
    " set cursorcolumn and cursorline highlight color
    hi CursorLine     term=bold cterm=bold guibg=Grey40
    hi CursorColumn   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

    " highlight the current line if not diff (only for gruvbox preference)
    if !&diff
      set cursorline
    endif

  "}}}
  " ---- Highlight the 80th column {{{
    " In Vim >= 7.3, also highlight columns 120+
    if exists('+colorcolumn')
      " I picked 120-320 because you have to provide an upper bound and 500 seems
      " to be enough.
      if has("gui_running")
        let &colorcolumn="80,".join(range(120,1200),",")
      else
        " simple 80 color column for terminal version
        set colorcolumn=80
      endif
    else
      " fallback for Vim < v7.3
      autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif

  "}}}
  " ---- Clear all not open buffers {{{
    function! Wipeout()
      " list of *all* buffer numbers
      let l:buffers = range(1, bufnr('$'))

      " what tab page are we in?
      let l:currentTab = tabpagenr()
      try
        " go through all tab pages
        let l:tab = 0
        while l:tab < tabpagenr('$')
          let l:tab += 1

          " go through all windows
          let l:win = 0
          while l:win < winnr('$')
            let l:win += 1
            " whatever buffer is in this window in this tab, remove it from
            " l:buffers list
            let l:thisbuf = winbufnr(l:win)
            call remove(l:buffers, index(l:buffers, l:thisbuf))
          endwhile
        endwhile

        " if there are any buffers left, delete them
        if len(l:buffers)
          execute 'bwipeout' join(l:buffers)
        endif
      finally
        " go back to our original tab page
        execute 'tabnext' l:currentTab
      endtry
    endfunction
  "}}}

