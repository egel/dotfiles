" vim: ft=vim fdm=marker ts=2 sts=2 sw=2
"
" Options file - Contains general configuration for nvim editor

" Basic vim settings ------------------------------------------------------ {{{
  set encoding=UTF-8

  syntax on " enable syntax highlighting

  set number relativenumber " Show line number and relative line number
  
  "General tab settings
  set tabstop=4       " number of visual spaces per TAB
  set softtabstop=4   " number of spaces in tab when editing
  set shiftwidth=4    " number of spaces to use for autoindent
  set expandtab       " expand tab to spaces so that tabs are spaces

  set scrolloff=15                                " Minimum lines above/below cursor
  "set title                                       " Change the terminal's title
  set cursorline
  set hlsearch
  set confirm                                     " Raise a dialogue asking if you wish to save changed files
	set history=1000          " Remember more commands and search history
  set undolevels=1000       " Use many muchos levels of undo
  set ruler                                       " Show row and column in footer

  set noshelltemp                                 " Use pipes
  set clipboard=unnamed,unnamedplus               " Use the system clipboard for yank/put/delete
  set fileformats=unix,dos                        " Prefer unix fileformat
  set backspace=indent,eol,start                  " Allow backspacing over everything in insert mode
  
  set nofoldenable          " No default fold, using plugin instead

  set list                                        " Highlight whitespace
  set listchars=tab:»·,trail:•,eol:¬,nbsp:_,extends:❯,precedes:❮ " show extra space characters
  set autoindent            " Set auto indent to match adjacent lines

  set wildmenu                    " Show list for autocompletion
  set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
  set wildignore+=*sass-cache*    " ignore sass related stuff
  set wildignore+=*.DS_Store      " ignore Mac related stuff
  set wildignore+=log/**,tmp/**   " ignore Linux related stuff
  set wildignore+=*/.git/*        " ignore git directory for repository
  set wildignore+=*/.svn/*        " ignore SVN directory for repository
  set wildignore+=*/.idea/*       " ignore IntelliJ directory for repository
  set wildignore+=*/venv/*        " ignore default python virtual environment directory for repository
  set wildignore+=*/vendor        " ignore Go related directory

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

	set showbreak=↪ " Character to show before the lines that have been soft-wrapped

  set nobackup nowritebackup noswapfile autoread " No backup, no swap, PERIOD !!!

	set spelllang=en,pl,de
	set spellsuggest+=9  " show 9 spell suggestions at most

	" Insert mode key word completion setting
	set complete+=kspell complete-=w complete-=b complete-=u complete-=t

	set winblend=0  " pseudo transparency for floating window

	" Completion behaviour
	set completeopt+=menuone  " Show menu even if there is only one item
	set completeopt-=preview  " Disable the preview window

  " Map leader key to coma
  " It is not mapped with respect well unless We will set it before setting
  " for plug in.
  let mapleader = ','

  " Use <Leader> in global plugin.
  let g:mapleader = ','

"}}}
