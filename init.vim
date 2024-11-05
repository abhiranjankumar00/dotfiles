set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set mouse=v                 " middle-click paste with 
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set ruler		" Show cursor position in status line
set wildmenu 		" Better command-line completion
set showcmd 		" Show partial commands in the last line of the screen

set history=1000	" Remember last 1000 commands
set laststatus=2        " 2 - Always show status line

" y and d put stuff into system clipboard (so that other apps can see it)
" set clipboard=unnamedplus,autoselect
set pastetoggle=<F12> 	" <F12> toggles paste mode

set autoread  		" Automatically re-read file changed outside vim
set autowrite		" Automatically save before commands like :next and :make
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Searching
set hlsearch 		" Highlight all matching string
" Map <C-L> (redraw screen) to also turn off search highlighting until the next
" search.
nnoremap <C-L> :nohl<CR><C-L>
set ignorecase 		" Use case insensitive search
" Override the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase
set incsearch		" Search as you type

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
" Number of spaces that a Tab counts for while performing editing operations
set softtabstop=4
set expandtab       " Use the appropriate number of spaces to insert a <Tab>
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Use default wrap option in diffmode `wrap<` uses default wrap setting
" autocmd FilterWritePre * if &diff | setlocal wrap< | endif
autocmd FilterWritePre * if &diff | setlocal wrap | endif

"Adding template for cpp, java and haskell and rest
autocmd! BufNewFile * silent! 0r $HOME/.vim/skel/skel.%:e
