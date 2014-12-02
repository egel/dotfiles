"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                               Vimrc Settings
"                        Using Pathogen plugin manager
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding

" Load up Pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax on                                       " enable syntax highlighting
filetype plugin indent on                       " detect the type of file that is edited
set secure                                      " disable unsafe commands in local .vimrc files
set nocompatible                                " don't need to be compatible with old vim
set clipboard=unnamed,unnamedplus               " use the system clipboard for yank/put/delete
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set nobackup nowritebackup noswapfile autoread  " no backup or swap
set nofoldenable                                " disable code folding
set vb                                          " enable visual bell (disable audio bell)
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
set list listchars=tab:▸\ ,trail:·,eol:¬        " show extra space characters
set autoindent                                  " set auto indent
set tabstop=2 shiftwidth=2 softtabstop=2        " set indent to 2 spaces
set expandtab                                   " use spaces, not tab characters


set wildmenu                                    " enable bash style tab completion
set wildignore=*.o,*.obj,*~                     "stuff to ignore when tab completing
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**

set ignorecase                                  " Use case insensitive search, except when using capital letters
set smartcase                                   " pay attention to case when caps are used
set hlsearch                                    " Highlight searches
set showmatch                                   " show bracket matches
set incsearch                                   " show search results as I type

"set guioptions-=T                               " turn off GUI toolbar (icons)
set guioptions-=r                               " turn off GUI right scrollbar
set guioptions-=L                               " turn off GUI left scrollbar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark       " Set colors of vim to more convinient for black backgound
set t_Co=256              " 256 colors in terminal

" Different templates depends on GUI or LUI
if has('gui_running')
  colorscheme gruvbox
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
else
  colorscheme desert
endif

" Hightlight current line and column
set cursorline                      " highlight the current line
hi CursorLine   term=bold cterm=bold guibg=Grey40
"set cursorcolumn                    " highlight the current column

" Highlight the 80th column
"
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

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Show trailing whitepace and spaces before a tab:
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree_Tabs
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0

" Proper display GitGutter for darker themes
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" Add powerline fonts to vim
let g:airline_powerline_fonts=1

" Autosession for vim-session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" vim-latex customize
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Force setting for *.jade files. More info: http://stackoverflow.com/a/6118265/1977012
autocmd BufRead,BufNewFile *.jade setlocal ft=jade


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open new tab by press \t
nmap <C-t> <Esc>:tabnew<CR>

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
map <F7>  :execute "tabmove" tabpagenr() - 2<CR>
map <F8> :execute "tabmove" tabpagenr()<CR>

" map NERDTreeTabsToggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>
