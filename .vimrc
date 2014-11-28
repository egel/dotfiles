"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                               Vimrc Settings
"                        Using Pathogen plugin manager
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax on                                       " enable syntax highlighting
filetype plugin indent on                       " detect the type of file that is edited
set secure                                      " disable unsafe commands in local .vimrc files
set nocompatible                                " don't need to be compatible with old vim
set clipboard=unnamed,unnamedplus               " use the system clipboard for yank/put/delete
set backspace=indent,eol,start                  " Allow backspacing over autoindent, line breaks and start of insert action
set nobackup nowritebackup noswapfile autoread  " no backup or swap
set nofoldenable                                " disable code folding
set vb                                          " enable visual bell (disable audio bell)
set confirm                                     " raise a dialogue asking if you wish to save changed files.
set number                                      " Display line numbers on the left
set ruler                                       " show row and column in footer
set scrolloff=3                                 " minimum lines above/below cursor
set mouse=a                                     " Enable use of the mouse for all modes
set laststatus=2                                " always show status bar
set ttimeoutlen=100                             " decrease timeout for faster insert with 'O'
set wildmenu                                    " enable bash style tab completion
set showcmd                                     " Show partial commands in the last line of the screen

set list listchars=tab:»·,trail:·               " show extra space characters
set expandtab                                   " use spaces, not tab characters
set autoindent                                  " set auto indent
set tabstop=2                                   " set indent to 2 spaces
set shiftwidth=2
set softtabstop=2

set ignorecase                                  " Use case insensitive search, except when using capital letters
set smartcase                                   " pay attention to case when caps are used
set hlsearch                                    " Highlight searches
set showmatch                                   " show bracket matches
set incsearch                                   " show search results as I type

set guioptions-=T                               " turn off GUI toolbar (icons)
set guioptions-=r                               " turn off GUI right scrollbar
set guioptions-=L                               " turn off GUI left scrollbar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark               " Set colors of vim to more convinient for black backgound
set t_Co=256                      " 256 colors in terminal

" different templates depends on GUI or LUI
if has('gui_running')
  colorscheme gruvbox
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
else
  colorscheme desert
endif

" Hightlight current line and column
set cursorline                      " highlight the current line
set cursorcolumn                    " highlight the current line
hi CursorLine   term=bold cterm=bold guibg=Grey40

" highlight the 80th column
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

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open a NERDTree automatically when vim starts up and move cursor to main window
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Poprawienie wyświetlania GitGutter w vim dla czarnych motywów
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" Add powerline fonts to vim
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove trailing spaces on save file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Force setting for *.md files. More info: https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Force setting for *.jade files. More info: http://stackoverflow.com/a/6118265/1977012
autocmd BufRead,BufNewFile *.jade setlocal ft=jade


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F3> key to hide current higlight for searched tems
:map <F3> :noh<CR>

" toggle spell check with <F4>
map <F4> :setlocal spell! spelllang=en_us<CR>
imap <F4> <ESC>:setlocal spell! spelllang=en_us<CR>

:map <F5> :w<CR>              " <F5> key save the file
:map <F6> :wq<CR>             " <F6> key save and exit the file
:map <F7> :tabn<CR>           " go to next tab
:map <F8> :tabp<CR>           " go to previous tab

" Key binding
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp




