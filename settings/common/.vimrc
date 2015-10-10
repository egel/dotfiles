"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                               Vimrc Settings
"                        Using Pathogen plugin manager
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible    " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" atp_vim
" gist-vim
" vim-git
" vim-hemisu
" vim-indent-guides
" vim-instant-markdown
" vim-javascript
" vim-monokai
" vim-rails

"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'morhetz/gruvbox'     " done by vim-colorschemes
NeoBundle 'othree/html5.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-haml'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'lervag/vimtex'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'     " as dependency for vim-session
NeoBundle 'tpope/vim-surround'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'smancill/conky-syntax.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'ryanss/vim-hackernews'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'edthedev/pelican.vim'

call neobundle#end()

" Required:
filetype plugin indent on            " detect the type of file that is edited

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding

syntax on                                       " enable syntax highlighting
"set secure                                      " disable unsafe commands in local .vimrc files
set clipboard=unnamed,unnamedplus               " use the system clipboard for yank/put/delete
set fileformats=unix,dos                        " Prefer unix fileformat
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set nobackup nowritebackup noswapfile autoread  " no backup or swap
set nofoldenable                                " disable code folding
set noerrorbells                                " no error bells
set novisualbell                                " no annoying visual bell
set confirm                                     " raise a dialogue asking if you wish to save changed files
set number                                      " Display line numbers on the left
set history=1000                                " remember more commands and search history
set undolevels=1000                             " use many muchos levels of undo
set ruler                                       " show row and column in footer
set scrolloff=5                                 " minimum lines above/below cursor
set mouse=a                                     " Enable use of the mouse for all modes
set laststatus=2                                " always show status bar
set ttimeoutlen=600                             " decrease timeout for faster insert with 'O'
set showcmd                                     " Show partial commands in the last line of the screen
set title                                       " change the terminal's title
set list listchars=tab:»·,trail:·,eol:¬,nbsp:_,extends:»,precedes:« " show extra space characters
set autoindent                                  " set auto indent
set tabstop=2 shiftwidth=2 softtabstop=2        " set indent to 2 spaces
set expandtab                                   " use spaces, not tab characters

set wildmenu                                    " enable bash style tab completion
set wildignore=*.o,*.obj,*~                     " stuff to ignore when tab completing
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**

set ignorecase                                  " Use case insensitive search, except when using capital letters
set smartcase                                   " pay attention to case when caps are used
set smarttab
set hlsearch                                    " Highlight searches
set showmatch                                   " show bracket matches
set incsearch                                   " show search results as I type

set sessionoptions+=unix,slash " for unix/windows compatibility
set nostartofline " do not go to start of line automatically when moving

set commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " Set 256 colors pallete


" define your colors. Must be included before colorscheme
if !exists("autocmd_colorscheme_loaded")
  augroup VimrcColors
  au!
    autocmd ColorScheme * highlight TodoRed      ctermbg=darkgreen guibg=#eee ctermfg=Red          guifg=#E01B1B
    autocmd ColorScheme * highlight TodoOrange   ctermbg=darkgreen guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
  augroup END
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Tmuxline
"let g:tmuxline_preset = 'minimal'
"let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : ['#H', "uptime #(uptime| cut -d' ' -f4-|cut -d, -f1)"],
      \'x'    : '#(date)',
      \'y'    : '#W',
      \'z'    : ['#(whoami)', '#H']}

" Different templates depends on GUI or LUI
if has("gui_running")
  "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  set guifont=Hack\ 10
  set linespace=10            " set space between lines (option only for GUI)

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

" Indent guidelines from vim-indent-guides plugin
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Hightlight current line and column
if !&diff
  set cursorline   " highlight the current line
endif
"set cursorcolumn                    " highlight the current column
hi CursorLine     term=bold cterm=bold guibg=Grey40
hi CursorColumn   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Highlight maching braces constantly
" 'set showmatch' option only show braces one when creating
syn match Braces display '[{}()\[\]]'
hi Braces guifg=red ctermfg=red

" Highlight the 80th column
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


" Only do this part when compiled with support for autocommands.
if has("autocmd") " Autocommands {{{1

  " Highlight trailing spaces in annoying red
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " Show trailing whitepace and spaces before a tab:
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

  " ---- Open files with syntax
  au BufRead,BufNewFile *.coffee setfiletype coffee

  " Jump to last known cursor position on BufReadPost {{{
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

  " Automatically load .vimrc source when saved
  "au BufWritePost $MYVIMRC,~/dot-files/.vimrc,$MYVIMRC.local source $MYVIMRC
  "au BufWritePost $MYGVIMRC,~/dot-files/.gvimrc source $MYGVIMRC

  " autocommands for fugitive {{{2
  " Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  au User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
  au BufReadPost fugitive://* set bufhidden=delete

endif " has("autocmd") }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----- NerdTree
" tabs
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" nerdtree window size
let g:NERDTreeWinSize=40

" close vim when the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

" ----- Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" ----- GitGutter
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

" Highlight TODO, FIXME, NOTE, etc.
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('TodoRed',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\):')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\):')
  endif
endif

" ------- Add powerline fonts to vim
let g:airline_powerline_fonts=1

" ------ Open the file in a new tab if it isn't already open
command! -nargs=1 -complete=file O tab drop <args>

" ------ Autosession for vim-session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'


" ----- Syntastic plugin settings -----
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


" ----- vim-latex customization -----
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

" Open pdf to the current location in a LaTeX file
" Read more: http://vim.wikia.com/wiki/Open_pdf_to_the_current_location_in_a_LaTeX_file
" Function: OpenPDF
function! OpenPDF(file,page)
  exec 'silent ! evince --page-label=' . a:page . ' ' . a:file . ' > /dev/null 2>&1 &'
endfunction

" Now \e will load the pdf viewer to the page containing the nearest label to
" the current cursor position (assuming the default backslash for the LocalLeader key).
" This works well on multi-file projects since the aux file is searched to
" find the pdf name. So you can jump around in Vim using its wonderful tools,
" then tell the pdf viewer to jump to the same page.
nnoremap <buffer> <LocalLeader>e :call EvinceNearestLabel()<CR>

" Load PDF to the page containing label
function! LoadEvinceByLabel(l)
  for f in split(glob("*.aux"))
    let label = system('grep "^.newlabel{' . a:l . '" ' . f)
    let page = matchstr(label, '.\{}{\zs.*\ze}}')
    if ! empty(page)
      call OpenPDF(substitute(f, "aux$", "pdf", ""), page)
      return
    endif
  endfor
endfunction

" Load PDF to the page containing the nearest previous label to the cursor
function! EvinceNearestLabel()
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

autocmd BufRead,BufNewFile *.tex setlocal formatoptions+=w textwidth=120


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing spaces on save file
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
autocmd BufNewFile,BufReadPost *.md,*.markdown call SetMarkdownOptions()
function! SetMarkdownOptions()
    set filetype=markdown
    setlocal textwidth=80
endfunction

" Force setting for *.jade files. More info: http://stackoverflow.com/a/6118265/1977012
autocmd BufRead,BufNewFile *.jade setlocal ft=jade

" Create directory on save if not exsist
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

" Edit a file or jump to it if already open
command! -nargs=1 -complete=file O tab drop <args>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open new tab by press \t
nmap <C-t> <Esc>:tabnew<CR>

" Map W, Q and WQ, WA as usuall typo
command! WQ wq
command! Wq wq
command! Wa wa
command! WA wa
command! W w
command! Q q

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" <F3> key to hide current higlight for searched tems
map <F3> :noh<CR>

" toggle spell check with <F4>
map <F4> :setlocal spell! spelllang=en_us<CR>
imap <F4> <ESC>:setlocal spell! spelllang=en_us<CR>

":map <F5> :w<CR>                  " <F5> key save the file
":map <F6> :wq<CR>                 " <F6> key save and exit the file

" go to next/previous tab
" Example: Ctrl + H
noremap <C-L> <Esc>:tabnext<CR>
noremap <C-H> <Esc>:tabprevious<CR>

" move tab to left/right position in top tab-bar
map <F7> :execute 'silent! tabmove' . (tabpagenr()-2)<CR>
map <F8> :execute 'silent! tabmove' . (tabpagenr()+1) <CR>

" map NERDTreeTabsToggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>
