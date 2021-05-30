set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
"Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on

set nobackup
set noswapfile
set nowritebackup

" WHITESPACE
set expandtab     " convert tabs into spaces
set tabstop=4     " number of spaces that a tab in the file counts for
set softtabstop=2 " number of spaces inserted when editing
set shiftwidth=2  " when using > and < to indent

" UI
syntax enable
" let's make the bg match the terminal...
autocmd ColorScheme * highlight Normal ctermbg=NONE
set background=dark
colorscheme gruvbox

set cursorline
set number
set showcmd   " show the last command in the bottom
set wildmenu  " visual autocomplete for command menu
set wildmode=full
set showmatch " highlight matching parentheses
set nowrap    " by default don't wrap lines

" MOVEMENT
" quickly switch to the alternate buffer
nnoremap <BS> <C-^>
" quickly search vim's help for term under cursor
nnoremap K :help <C-r><C-w><CR>

" LEADER
let mapleader = ","
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>c :set list!<CR>

" SEARCHING
set incsearch " show matches while typing
set hlsearch  " highlight matches

" COMMAND LINE
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" GENERAL BEHAVIOUR
set timeoutlen=1000 ttimeoutlen=0 " no delay after hitting escape
set listchars=tab:→\ ,eol:¬,nbsp:␣,space:·,trail:•,extends:⟩,precedes:⟨
set visualbell " disable those annoying beeps
set ttyfast " faster scrolling

set autoindent " copy indent on current line when starting a new one
set smartindent

"set scrolloff=999 " centers the cursor to the middle of the screen
set shortmess=aoOtI " avoid 'Hit Enter ...' messages
set hidden " allow to switch from a modified buffer

