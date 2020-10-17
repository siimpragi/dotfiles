set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
"Plug 'lervag/vimtex'
Plug 'christoomey/vim-tmux-navigator'
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
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

set cursorline
set number
set showcmd   " show the last command in the bottom
set wildmenu  " visual autocomplete for command menu
set wildmode=full
set showmatch " highlight matching parentheses
set nowrap    " by default don't wrap lines

" MOVEMENT
" make j and k work as expected on wrapped lines
nnoremap j gj
nnoremap k gk
" quickly switch to the alternate buffer
nnoremap <bs> <c-^>
" quickly search vim's help for term under cursor
nnoremap K :help <C-r><C-w><CR>

" LEADER
let mapleader=","
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>c :set list!<CR>

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

set scrolloff=999 " centers the cursor to the middle of the screen
set shortmess=aoOtI " avoid 'Hit Enter ...' messages
set hidden " allow to switch from a modified buffer

" VimTex
"let g:polyglot_disabled = ['latex']
"let g:Tex_IgnoredWarnings
"let g:vimtex_quickfix_latexlog = {'default' : 0}
"let g:Tex_IgnoredWarnings =
"    \'Underfull'."\n".
"    \'Overfull'."\n".
"    \'specifier changed to'."\n".
"    \'You have requested'."\n".
"    \'Missing number, treated as zero.'."\n".
"    \'There were undefined references'."\n".
"    \'Citation %.%# undefined'."\n".
"    \'Double space found.'."\n"
"let g:Tex_IgnoreLevel = 8

