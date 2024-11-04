" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Specify a directory for plugins. Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'danro/rename.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'vim-syntastic/syntastic'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

syntax on 		"Enable syntax highlighting

"-----------------------Normal settings--------------------------------"

set number		" Always show line number
set wrap                " Always wrap
set mouse=a 		" Enable use of the mouse for all modes
set scrolloff=100	" Keep cursor at the centre of screen
set ruler		" Show cursor position in status line

set wildmenu 		" Better command-line completion
set showcmd 		" Show partial commands in the last line of the screen
set history=1000	" Remember last 1000 commands
set laststatus=2        " 2 - Always show status line

set clipboard=unnamedplus,autoselect " y and d put stuff into system clipboard (so that other apps can see it)
set pastetoggle=<F12> 	" <F12> toggles paste mode

set autoread  		" Automatically re-read file changed outside vim
set autowrite		" Automatically save before commands like :next and :make
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Searching
set hlsearch 		" Highlight all matching string
" Map <C-L> (redraw screen) to also turn off search highlighting until the  next search
nnoremap <C-L> :nohl<CR><C-L>
set ignorecase 		" Use case insensitive search
set smartcase 		" Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch		" Search as you type

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set softtabstop=4   " Number of spaces that a Tab counts for while performing editing operations
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

"------------------NerdTreeTabs------------------"
" Use '\'+'n' to toggle nerd tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" Open by default
let g:nerdtree_tabs_open_on_console_startup = 1

"---------------Fuzzy File Finder---------------"
map <C-P> :Files<CR>

"---------------Setting to color statusline---------------"
if !has('gui_running')
  set t_Co=256
endif

"-----------------Fixing color in vimdiff-----------------"
set background=dark
colorscheme solarized

"-----------------Syntastic-----------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wno-unused-result -Wall -Wshadow'

"-----------------You Complete Me (YCM)-----------------"
let g:ycm_global_ycm_extra_conf = '/home/ranjan/.vim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1  "Auto close preview scratchpad after insertion
"let g:ycm_autoclose_preview_window_after_completion = 1 "Auto close preview scratchpad after completion

"-----------------Rainbow Parentheses-----------------"
au VimEnter * RainbowParentheses    " Start Rainbow parentheses at vim start

"-----------------UtilSnips-----------------"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

