" .vimrc

set encoding=utf-8

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax on                         " enable syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set tabstop=2                     " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set wildmenu                      " enable bash style tab completion
set showcmd                       " Show partial commands in the last line of the screen
set ignorecase                    " Use case insensitive search, except when using capital letters
set smartcase                     " pay attention to case when caps are used
set hlsearch                      " Highlight searches
set showmatch                     " show bracket matches
set incsearch                     " show search results as I type
set nofoldenable                  " disable code folding
set vb                            " enable visual bell (disable audio bell)
set mouse=a                       " Enable use of the mouse for all modes
set number                        " Display line numbers on the left
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set clipboard=unnamed             " use the system clipboard
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set list listchars=tab:»·,trail:· " show extra space characters
set noswapfile                    " Set no swap files like *.swp
set confirm                       " raise a dialogue asking if you wish to save changed files.
set backspace=indent,eol,start    " Allow backspacing over autoindent, line breaks and start of insert action

" set theme
set background=dark               " Set colors of vim to more convinient for black backgound
colorscheme twilight256

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" remove trailing spaces on save file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Set columns to 80 and 100
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" open a NERDTree automatically when vim starts up and move cursor to main window
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Force setting for *.md files. More info: https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Poprawienie wyświetlania GitGutter w vim dla czarnych motywów
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" <F5> key save the file
:map <F5> :w<CR>

" <F6> key save and exit the file
:map <F6> :wq<CR>

" Key binding
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp




