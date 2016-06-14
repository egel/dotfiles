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
" NOTE : You don't set neobundle setting in .gvimrc!

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
NeoBundle 'godlygeek/tabular'         " require by vim-markdown
NeoBundle 'plasticboy/vim-markdown'
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
NeoBundle 'ap/vim-css-color'        " Color CSS codes
NeoBundle 'junegunn/goyo.vim'       " Distraction-free writing in Vim.
NeoBundle 'embear/vim-localvimrc'   " Vim per project local config

" }}}
" Other bundles {{{
NeoBundle 'edthedev/pelican.vim'
NeoBundle 'ryanss/vim-hackernews' " hackernews

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

set commentstring=#\ %s                         " add space before adding comment

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
    autocmd ColorScheme * highlight TodoRed     ctermbg=darkgreen guibg=#eeeeee   ctermfg=Red           guifg=#E01B1B
    autocmd ColorScheme * highlight TodoOrange  ctermbg=darkgreen guibg=#002b37   ctermfg=LightMagenta  guifg=#E0841B
  augroup END
endif

" }}}
" ---- Tmuxline {{{
let g:tmuxline_preset = {
  \'a' : '#S',
  \'b' : '#W',
  \'c' : ['#H', "uptime #(uptime| cut -d' ' -f4-|cut -d, -f1)"],
  \'x' : '#(date)',
  \'y' : '#W',
  \'z' : ['#(whoami)', '#H']}

" }}}
" ---- Set font {{{
" Hack font support Powerline characters
if has("gui_gtk2")
  set guifont=Hack\ 13
elseif has("gui_macvim")
  set guifont=Hack:h13
elseif has("gui_win32")
  set guifont=Consolas:h11:cANSI
else
  set guifont=Hack:h13:cDEFAULT
endif

" }}}
" ---- Setup LUI interface {{{
set noautochdir " fix tabnames according: http://stackoverflow.com/a/9852927
function! MyTabLabel()
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return buflist[winnr - 1] . ') ' . bufname(buflist[winnr - 1])
endfunction
set tabline=%!MyTabLine()

" }}}
" ---- Setup GUI interface {{{
if has("gui_running")
  set linespace=12    " set space between lines (option only for GUI)
  set guioptions-=T   " turn off GUI toolbar (icons)
  set guioptions+=c   " use console dialogs
  set guioptions-=e   " use GUI tabs if possible
  set guioptions-=r   " turn off GUI right scrollbar
  set guioptions-=L   " turn off GUI left scrollbar
  set guitablabel=%{MyTabLine()}  " set labels for GUI tab's
  set guitabtooltip=%!bufname($)
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
" ---- Highlight current line and column {{{
" set cursorcolumn and cursorline highlight color
hi CursorLine     term=bold cterm=bold guibg=Grey40
hi CursorColumn   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" highlight the current line if not diff (only for gruvbox preference)
if !&diff
  set cursorline
endif

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
  " ---- Buffers -> auto cd %:p:h {{{
  " Disable change buffers due to vim-fugitive errors
  " autocmd BufEnter * if expand('%:p') ~! '://' | cd %:p:h | endif
  " }}}
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
  autocmd BufRead,BufNewFile *.coffee setfiletype coffee

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
  " ---- Automatically reload .vimrc source when saved {{{
  au BufWritePost .vimrc source $MYVIMRC
  au BufWritePost .gvimrc source $MYGVIMRC

  " }}}
  " ---- Auto commands for fugitive {{{
  " Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  au User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
  au BufReadPost fugitive://* set bufhidden=delete

  " }}}
  " ---- Git
  autocmd FileType gitcommit setlocal spell

  " }}}
endif " end of has("autocmd")

" }}}
" Plugins ----------------------------------------------------------------- {{{
" ---- vim-markdown {{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_fenced_languages = [
  \ 'viml=vim',
  \ 'bash=sh',
  \ 'shell=sh',
  \ 'ini=dosinia']
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 4

" }}}
" ---- Localvimrc {{{
let g:localvimrc_reverse = 0
let g:localvimrc_name = ['.lvimrc', '.vimrc_local' ]
let g:localvimrc_ask = 0 " do not ast to load local vimrc
let g:localvimrc_event = [ "BufEnter", "WinEnter", "TabEnter" ]
let g:localvimrc_debug = 0

" Helper method for .lvimrc files to finish
fun! MyLocalVimrcAlreadySourced(...)
  " let sfile = expand(a:sfile)
  let sfile = g:localvimrc_script
  let guard_key = expand(sfile).'_'.getftime(sfile)
  if exists('b:local_vimrc_sourced')
    if type(b:local_vimrc_sourced) != type({})
      echomsg "warning: b:local_vimrc_sourced is not a dict!"
      let b:local_vimrc_sourced = {}
    endif
    if has_key(b:local_vimrc_sourced, guard_key)
      return 1
    endif
  else
    let b:local_vimrc_sourced = {}
  endif
  let b:local_vimrc_sourced[guard_key] = 1
  return 0
endfun

" }}}
" ---- NerdTree {{{
" Tabs
let g:nerdtree_tabs_synchronize_view=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_autoclose=1
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

" NERDTree Files highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^.*\.'. a:extension .'$#'
endfunction

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
let g:SuperTabDefaultCompletionType = "<C-n>"

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

" }}}
" ---- Highlight TODO, FIXME, NOTE, etc. in any file {{{
if has("autocmd")
  if v:version > 701
    autocmd syntax * call matchadd('ErrorMsg', '\v[@]?((FIXME)|(XXX)|(BUG))([ ]+)?(:)?')
    autocmd syntax * call matchadd('IncSearch', '\v[@]?((TODO)|(CHANGED)|(HACK))([ ]+)?(:)?')
    autocmd syntax * call matchadd('PmenuSel', '\v[@]?((NOTE)|(INFO)|(IDEA))([ ]+)?(:)?')
  endif
endif

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
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['python', 'javascript', 'jade'],
  \ 'passive_filetypes': [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" if add other then linter will check one for another checker
let g:syntastic_javascript_checkers = ['eslint'] " 'standard', 'jslint'
let g:syntastic_python_checkers = [ 'flake8', 'pylint', 'pyflakes' ]
let g:syntastic_jade_checkers = ['jade_lint']
let g:syntastic_json_checkers=['jsonlint']

let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" }}}
" ---- Customization vim-latex plugin {{{
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
if has("gui_running")
  if has("gui_win32")
    set shellslash
  endif
endif

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

augroup json_autocmd
  autocmd!
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}
" ---- vim-indent-guides {{{
" taken from https://github.com/scrooloose/nerdtree
let g:indent_guides_exclude_filetypes = ['nerdtree']

" auto-enable indent guides
autocmd WinEnter * :IndentGuidesEnable

" }}}
" ---- Add airline powerline fonts to vim {{{
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0"
" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#tabs_label = 't'

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

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
map <F4> :setlocal spell spelllang=en_us<CR>
imap <F4> <ESC>:setlocal spell spelllang=en_us<CR>

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
nnoremap <A-J> :m .+1<CR>==
nnoremap <A-K> :m .-2<CR>==
inoremap <A-J> <Esc>:m .+1<CR>==gi
inoremap <A-K> <Esc>:m .-2<CR>==gi
vnoremap <A-J> :m '>+1<CR>gv=gv
vnoremap <A-K> :m '<-2<CR>gv=gv

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
function! SetMarkdownOptions()
  set filetype=markdown
  setlocal spell
  " setlocal textwidth=80
endfunction
autocmd BufNewFile,BufReadPost *.md,*.markdown,*.ngdoc call SetMarkdownOptions()

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

