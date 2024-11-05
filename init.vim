set nocompatible            " disable compatibility to old-time vi

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'danro/rename.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

set showmatch               " show matching
set mouse=v                 " middle-click paste with
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
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
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search.
nnoremap <C-L> :nohl<CR><C-L>
" Open a dialog box listing nearby files.
map <C-P> :Files<CR>
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

"-----------------------Plugin Specific Config--------------------------------"

"-----------------Rainbow Parentheses-----------------"
au VimEnter * RainbowParentheses    " Start Rainbow parentheses at vim start

"---------------Setting to color statusline---------------"
if !has('gui_running')
  set t_Co=256
endif

"-----------------Fixing color in vimdiff-----------------"
set background=dark
"-----------------------Helper functions--------------------------------"

function! ShowTralingSpace()
    " Highligting trailing whitespaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
endfunction

call ShowTralingSpace()

" call `ShowTrailingSpace` in each read/write
autocmd BufRead *.* call ShowTralingSpace()
autocmd BufWrite *.* call ShowTralingSpace()

function TrimTrailingSpaces()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

"-----------------------File specific methods--------------------------------"

" C
function! CSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -Wno-unused-result\ -Wreturn-type\ -Wmain\ -Werror=return-type\ -Werror=main\ -pipe\ -O3\ -std=c99\ %;fi;fi
endfunction

" Cpp
function! CPPSET()
  setlocal makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ clang++\ -O2\ -g\ -std=c++14\ -Wno-unused-result\ -D_GLIBCXX_DEBUG\ -DDEBUG\ -Wall\ -Wshadow\ %;fi;fi
endfunction

" Haskell
function! HSKSET()
  setlocal makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ ghc\ -O2\ -fforce-recomp\ -rtsopts\ -fwarn-name-shadowing\ -fwarn-incomplete-patterns\ -auto-all\ -Wall\ -with-rtsopts=\"-K512m\ -A8m\"\ %;fi;fi
endfunction

" FSharp
function! FSHARPSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ fsharpc\ -r:/usr/lib/cli/FSharp.Core-4.3/FSharp.Core.dll\ --noframework\ %;fi;fi
endfunction

" Makefile
function! MAKEFILESET()
  set tw=0
"  set nowrap
  " in a Makefile we need to use <Tab> to actually produce tabs
  set noet
  set sts=4
endfunction

" Autocommands for all languages:
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType c          call CSET()
autocmd FileType cpp        call CPPSET()
autocmd FileType make       call MAKEFILESET()
autocmd FileType fsharp     call FSHARPSET()
autocmd FileType haskell    call HSKSET()

