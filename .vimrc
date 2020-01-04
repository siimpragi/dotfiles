set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

filetype plugin indent on

" WHITESPACE
set expandtab  " convert tabs into spaces
set tabstop=4  " number of spaces that a tab in the file counts for
set softtabstop=2  " number of spaces inserted when editing
set shiftwidth=2  " when using > and < to indent

" UI
syntax enable  " switch on syntax highlighting
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
"set t_Co=256
set background=dark
let g:gruvbox_contrast_dark="hard"
"let g:solarized_termcolors=256

colorscheme gruvbox
"colorscheme elflord

set number
set showcmd  " show the last command in the bottom
set wildmenu  " visual autocomplete for command menu
set wildmode=full
set showmatch  " highlight matching parentheses
set nowrap  " by default don't wrap lines

"set cursorline

" FOLDING
" set foldenable  " enable folding
" set foldlevelstart=10  " open most folds by default
" set foldnestmax=10  " 10 nested fold max
" nnoremap <space> za  " space opens/closes folds
" set foldmethod=indent  " fold based on indent level

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

"nnoremap <leader>j <C-w>j
"nnoremap <leader>k <C-w>k
"nnoremap <leader>h <C-w>h
"nnoremap <leader>l <C-w>l

" SEARCHING
set incsearch  " show matches while typing
set hlsearch  " highlight matches

" COMMAND LINE
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" GENERAL BEHAVIOUR
set timeoutlen=1000 ttimeoutlen=0  " no delay after hitting escape
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set visualbell  " disable those annoying beeps

" VimTex
let g:polyglot_disabled = ['latex']
"let g:Tex_IgnoredWarnings
let g:vimtex_quickfix_latexlog = {'default' : 0}
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


map <C-n> :NERDTreeToggle<CR>
