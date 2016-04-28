"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                               Vimrc Settings
"                        Using NeoBundle plugin manager
"                                Use foldings!
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small. {{{
if !1 | finish | endif
" }}}

if has('vim_starting')
  if &compatible
    set nocompatible    " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle management ---------------------------------------------------- {{{
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" NOTE: You don't set neobundle setting in .gvimrc!

" Colorschemes and Appereance {{{
"NeoBundle 'flazz/vim-colorschemes'   " many colorschemes but not being updated
NeoBundle 'morhetz/gruvbox'           " done by vim-colorschemes
NeoBundle 'sickill/vim-monokai'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" }}}
" Syntax bundles {{{
NeoBundle 'davidhalter/jedi-vim'                      " python syntax + integration
NeoBundle 'lervag/vimtex'                             " tex/latex syntax
NeoBundle 'othree/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'elzr/vim-json'                             " JSON syntax
NeoBundle 'kylef/apiblueprint.vim'                    " blueprint/apiari syntax
NeoBundle 'othree/yajs.vim'                           " JavaScrip syntax (also ES6/ES2015)
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'smancill/conky-syntax.vim'                 " conky file syntax
NeoBundle 'Glench/Vim-Jinja2-Syntax'                  " Jinja2 syntax
NeoBundle 'ekalinin/Dockerfile.vim'                   " dockerfile syntax
NeoBundle 'statianzo/vim-jade'                        " jade, unmaintained (vim-pug is not ready yet)
NeoBundle 'digitaltoad/vim-pug'                       " pug (formerly Jade)
NeoBundle 'evanmiller/nginx-vim-syntax'

" }}}
" Plug-in bundles {{{
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-gitgutter'          " left side git status icons (~,+,-)
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'              " improve insert surround text
NeoBundle 'editorconfig/editorconfig-vim'   " editorconfig plugin
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'      " as dependency for vim-session
NeoBundle 'tpope/vim-abolish'   " fix while words while typing
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'nelstrom/vim-markdown-folding'   " improve folding in markdown
NeoBundle 'ashisha/image.vim'               " preview images
NeoBundle 'mattn/webapi-vim'
NeoBundle 'heavenshell/vim-slack'
NeoBundle 'ap/vim-css-color'

" }}}
" Other bundles {{{
NeoBundle 'edthedev/pelican.vim'
NeoBundle 'ryanss/vim-hackernews'                     " hackernews
" }}}

call neobundle#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" }}}
" Basic vim settings ------------------------------------------------------ {{{

" enable syntax highlighting
syntax on

set modifiable
if has("multi_byte")
  set encoding=utf-8      " The encoding displayed.
  set fileencoding=utf-8  " The encoding written to file.
  set termencoding=utf-8
endif

set clipboard=unnamed,unnamedplus               " Use the system clipboard for yank/put/delete
set fileformats=unix,dos                        " Prefer unix fileformat
set backspace=indent,eol,start                  " Allow backspacing over everything in insert mode
set nofoldenable                                " Disable code folding
set noerrorbells                                " No error bells
set novisualbell                                " No annoying visual bell
set confirm                                     " Raise a dialogue asking if you wish to save changed files
set history=1500                                " Remember more commands and search history
set undolevels=1500                             " Use many muchos levels of undo
set ruler                                       " Show row and column in footer
set scrolloff=5                                 " Minimum lines above/below cursor
set mouse=a                                     " Enable use of the mouse for all modes
set laststatus=2                                " Always show status bar
set ttimeoutlen=600                             " Decrease timeout for faster insert with 'O'
set showcmd                                     " Show partial commands in the last line of the screen
set title                                       " Change the terminal's title
set list listchars=tab:»·,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮ " show extra space characters
set autoindent                                  " Set auto indent
set tabstop=2 shiftwidth=2 softtabstop=2        " Set indent to 2 spaces
set expandtab                                   " Use spaces, not tab characters

" Display line numbers on every window split except NERDTree
if(exists('t:NERDTreeBufName') && bufname('%') == t:NERDTreeBufName)
  set nonumber
else
  set number
endif

set wildmenu                   " Enable bash style tab completion
set wildignore=*.o,*.obj,*~    " Stuff to ignore when tab completing
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**

set ignorecase                                  " Use case insensitive search, except when using capital letters
set smartcase                                   " Pay attention to case when caps are used
set smarttab
set hlsearch                                    " Highlight searches
set showmatch                                   " Show bracket matches
set incsearch                                   " Show search results as I type

set sessionoptions+=unix,slash                  " For unix/windows compatibility
set nostartofline                               " Do not go to start of line automatically when moving

set commentstring=#\ %s

" }}}
" Backups ----------------------------------------------------------------- {{{
" No backup, no swap, PERIOD !!!
set nobackup nowritebackup noswapfile autoread

" }}}
" Appearance ------------------------------------------------------------- {{{
" ---- Set 256 colors pallete {{{
set t_Co=256

"}}}
" ---- Define your own colors {{{
" Must be included before colorscheme !!!
if !exists("autocmd_colorscheme_loaded")
  augroup VimrcColors
  au!
    autocmd ColorScheme * highlight TodoRed     ctermbg=darkgreen guibg=#eee     ctermfg=Red           guifg=#E01B1B
    autocmd ColorScheme * highlight TodoOrange  ctermbg=darkgreen guibg=#002b37  ctermfg=LightMagenta  guifg=#E0841B
  augroup END
endif

" }}}
" ---- Tmuxline {{{
"let g:tmuxline_preset = 'minimal'
"let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : ['#H', "uptime #(uptime| cut -d' ' -f4-|cut -d, -f1)"],
      \'x'    : '#(date)',
      \'y'    : '#W',
      \'z'    : ['#(whoami)', '#H']}

" }}}
" ---- Different templates depends on GUI or LUI {{{
if has("gui_running")
  " Hack font support Powerline characters
  if has("gui_gtk2")
    set guifont=Hack\ 13
  elseif has("gui_macvim")
    set guifont=Hack:h13
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
  set linespace=12            " set space between lines (option only for GUI)

  set guioptions-=T           " turn off GUI toolbar (icons)
  set guioptions+=e
  set guioptions-=r           " turn off GUI right scrollbar
  set guioptions-=L           " turn off GUI left scrollbar
  set guitablabel=\[%N\]\ %t\ %M
else
  " indent guidlines for terminal
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
endif

" }}}
" ---- Set default GUI screen size (lines, columns) {{{
if has("gui_running")
  " Maximize gvim window.
  set lines=999
  set columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" }}}
" ---- Indent guidelines from vim-indent-guides plugin {{{
" taken from https://github.com/scrooloose/nerdtree
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" }}}
" ---- Highlight current line and column {{{
if !&diff
  set cursorline   " highlight the current line
endif
"set cursorcolumn                    " highlight the current column
hi CursorLine     term=bold cterm=bold guibg=Grey40
hi CursorColumn   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" }}}
" ---- Highlight maching braces constantly {{{
" 'set showmatch' option only show braces one when creating
syn match Braces display '[{}()\[\]]'
hi Braces guifg=red ctermfg=red

" }}}
" ---- Highlight the 80th column {{{
" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
  " (I picked 120-320 because you have to provide an upper bound and 500 seems to be enough.)
  if has("gui_running")
    let &colorcolumn="80,".join(range(120,500),",")
  else
    " simple 80 color column for terminal version
    set colorcolumn=80
  endif
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }}}

" }}}
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

" folding for coffeescript files
setl fdm=expr fde=getline(v:lnum)=~'->$'&&indent(v:lnum)<indent(v:lnum+1)?'a1':'s1'

" }}}
" Autocommands ----------------------------------------------------------- {{{

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " ---- Highlight trailing spaces in annoying red {{{
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " }}}
  " ---- Show trailing white spaces and spaces before a tab {{{
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

  " }}}
  " ---- Open files with proper syntax {{{
  au BufRead,BufNewFile *.coffee setfiletype coffee

  " }}}
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
  au BufReadPost * call AutojumpLastPosition()

  " }}}
  " ---- (OFF) Automatically load .vimrc source when saved {{{
  "au BufWritePost $MYVIMRC,~/dot-files/.vimrc,$MYVIMRC.local source $MYVIMRC
  "au BufWritePost $MYGVIMRC,~/dot-files/.gvimrc source $MYGVIMRC

  " }}}
  " ---- Auto commands for fugitive {{{
  " Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  au User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
  au BufReadPost fugitive://* set bufhidden=delete

  " }}}
endif " end of has("autocmd")

" }}}
" Plugin Helpers ---------------------------------------------------------- {{{
" ---- NerdTree {{{
" Tabs
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.DS_Store']

" Use custom arrows
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Show hidden files (default, switch by 'Shift + I')
let NERDTreeShowHidden=1

" default NERDTree window size
let g:NERDTreeWinSize=30

" Open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() | wincmd p | end
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

" Close vim when the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

" NERDTree Files highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^.*\.'. a:extension .'$#'
endfunction

" define local variable
" 8-bit colos  https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
if &bg == 'dark'
  let _NERDTreeHighlightBgColor = '#282828'
  call NERDTreeHighlightFile('markdown', 'cyan', 'none', 'cyan', _NERDTreeHighlightBgColor)
  call NERDTreeHighlightFile('md', 'cyan', 'none', 'cyan', _NERDTreeHighlightBgColor)

  call NERDTreeHighlightFile('vimrc', 'gray', 'none', 'gray', _NERDTreeHighlightBgColor)
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

" ---- nerdtree-git-plugin (require NerdTree)
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

" }}}
" ---- Nerdcommenter {{{
let NERDSpaceDelims=1
" }}}
" ---- Supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" ---- GitGutter {{{
let g:gitgutter_realtime=1

" this difference can be tracked by this issue: https://github.com/airblade/vim-gitgutter/issues/113
if has('gui_running')
  set updatetime=250
else
  " must be more then 1200ms (internal tasks of vim)
  set updatetime=1300
endif

" Proper display GitGutter for darker themes
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=#9CCF31
highlight GitGutterChange ctermfg=yellow guifg=#F7D708
highlight GitGutterDelete ctermfg=red guifg=#CE0000
highlight GitGutterChangeDelete ctermfg=yellow guifg=#F7D708

" }}}
" ---- Highlight TODO, FIXME, NOTE, etc. {{{
if has("autocmd")
  if v:version > 701
    autocmd syntax * call matchadd('ErrorMsg', '\W\zs\(FIXME\|XXX\|BUG\)')
    autocmd syntax * call matchadd('IncSearch', '\W\zs\(TODO\|CHANGED\|HACK\)')
    autocmd syntax * call matchadd('PmenuSel', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

" }}}
" ---- Add airline powerline fonts to vim {{{
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 0

" }}}
" ---- Open the file in a new tab if it isn't already open {{{
command! -nargs=1 -complete=file O tab drop <args>

" }}}
" ---- Auto session for vim-session {{{
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_lock_enabled = 1      " Enable all session locking :-)
let g:session_default_to_last = 1   " Open your last used session instead of the default session
let g:session_directory = "~/.vim/sessions"  " default path for UNIX

" Save session on quitting Vim
" autocmd VimLeave * NERDTreeTabsClose
" autocmd VimLeave * call SaveSession

" (OFF) Restore session on starting Vim
"autocmd VimEnter * call MySessionRestoreFunction()
"autocmd VimEnter * NERDTree

" }}}
" ---- Syntastic plugin settings {{{
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['python', 'html', 'javascript'], }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = [ 'flake8', 'pylint', 'pyflakes' ]
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_javascript_checkers = ['eslint']

" }}}
" ---- Customization vim-latex plugin {{{
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" Set latex flavor for code highlighting
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" Now \e will load the pdf viewer to the page containing the nearest label to
" the current cursor position (assuming the default backslash for the LocalLeader key).
" This works well on multi-file projects since the aux file is searched to
" find the pdf name. So you can jump around in Vim using its wonderful tools,
" then tell the pdf viewer to jump to the same page.
nnoremap <buffer> <LocalLeader>e :call EvinceNearestLabel()<CR>

function! OpenPDF(file,page) " Open pdf to the current location in a LaTeX file {{{
" Read more: http:/vim.wikia.com/wiki/Open_pdf_to_the_current_location_in_a_LaTeX_file
  exec 'silent ! evince --page-label=' . a:page . ' ' . a:file . ' > /dev/null 2>&1 &'
endfunction
" }}}
function! LoadEvinceByLabel(l) " Load PDF to the page containing label {{{
  for f in split(glob("*.aux"))
    let label = system('grep "^.newlabel{' . a:l . '" ' . f)
    let page = matchstr(label, '.\{}{\zs.*\ze}}')
    if ! empty(page)
      call OpenPDF(substitute(f, "aux$", "pdf", ""), page)
      return
    endif
  endfor
endfunction

" }}}
function! EvinceNearestLabel() " Load PDF to the page containing the nearest previous label to the cursor {{{
  let line = search("\\label{", "bnW")
  if line > 0
    let m = matchstr(getline(line), '\\label{\zs[^}]*\ze}')
    if empty(m)
      echomsg "No label between here and start of file"
    else
      call LoadEvinceByLabel(m)
    endif
  endif
endfunction
"}}}

autocmd BufRead,BufNewFile *.tex setlocal formatoptions+=w textwidth=120
 " }}}
" ---- vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" }}}
" Key Mapping (key binding) ---------------------------------------------- {{{
" Map W, Q and WQ, WA as usual typo
command! WQ wq
command! Wq wq
command! Wa wa
command! WA wa
command! W w
command! Q q

" ---- w!! - which will sudo & save a file {{{
cmap w!! %!sudo tee >/dev/null %

" }}}
" ---- map leader key to comma {{{
let mapleader=","

" }}}
" ---- <F3> key to hide current highlight for searched terms {{{
map <F3> :noh<CR>

" }}}
" ---- Toggle spell check with <F4> (default: en_us) {{{
map <F4> :setlocal spell! spelllang=en_us<CR>
imap <F4> <ESC>:setlocal spell! spelllang=en_us<CR>

" }}}
" ---- (OFF) Saving file <F5>, <F6> {{{
"map <F5> :w<CR>                  " <F5> key save the file
"map <F6> :wq<CR>                 " <F6> key save and exit the file

" }}}
" ---- bind Alt+<movement> keys to move around the windows instead of using Ctrl+w + <movement> {{{
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" }}}
" ---- Easier moving of code blocks  {{{
"vnoremap < <gv                " Move to next section
"vnoremap > >gv                " Move to previous section

" }}}
" ---- Jumping to move lines up/down  {{{
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}
" ---- Go to next/previous tab {{{
" Example: Ctrl + H
noremap <leader>m <Esc>:tabnext<CR>
noremap <leader>n <Esc>:tabprevious<CR>
noremap <C-n> <Esc>:tabnew<CR>

" }}}
" ---- Map sort method {{{
vnoremap <Leader>s :sort<CR>
" }}}
" ---- Move tab to left/right position in top tab-bar {{{
map <F7> :execute 'silent! tabmove' . (tabpagenr()-2)<CR>
map <F8> :execute 'silent! tabmove' . (tabpagenr()+1) <CR>

" }}}
" ---- Open and hide NERDTree with multiple tabs {{{
map <Leader>p <plug>NERDTreeTabsToggle<CR>

" }}}
" ---- Find current file in NERDTree {{{
map <leader>r :NERDTreeFind<CR>

" }}}
" ---- Space to toggle folds {{{
nnoremap <space> za
vnoremap <space> za

" }}}
" }}} #ENDof key mapping
" Features ---------------------------------------------------------------- {{{
" Remove trailing spaces on save file {{{
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Switch from: UPPER CASE, then to lower case, then to Title Case
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

" Force setting for *.md files. More info: https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md,*.markdown,*.ngdoc call SetMarkdownOptions()
function! SetMarkdownOptions()
    set filetype=markdown
    setlocal textwidth=80
endfunction

" }}}
" Force setting for *.jade files {{{
" More info: http://stackoverflow.com/a/6118265/1977012
autocmd BufRead,BufNewFile *.jade setlocal ft=jade

" }}}
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
" }}}

" Edit a file or jump to it if already open {{{
command! -nargs=1 -complete=file O tab drop <args>
" }}}

"}}}

" Load local (personal) vim settings {{{
" This is a part of themeing in egel/dotfiles
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}

