set nocompatible

"Vundle
filetype off
set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'Syntastic'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
Plugin 'morhetz/gruvbox'
Plugin 'MattesGroeger/vim-bookmarks'

syntax on
filetype plugin indent on
let mapleader=","
colorscheme gruvbox

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline_left_sep=''
let g:airline_right_sep=''

" Normal maps
nmap <leader>p :set paste!<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>e :call ToggleErrors()<CR>
nmap <leader>u :call UndotreeToggle()<CR>
nmap  K :bnext!<CR>
nmap  J :bprevious!<CR>
nmap  T :enew<cr>
nmap <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map  <leader>x :bwipeout<CR>

" Command maps
cmap w!! w !sudo tee % >/dev/null


" Settings
set dictionary=/usr/share/dict/words
set pastetoggle=<leader>p
set noswapfile
set laststatus=2
set wildmenu
set incsearch
set expandtab 
set tabstop=2
set showmatch 
set hlsearch 
set ignorecase
set shiftwidth=2 
set undofile
set undodir=~/.vim/undodir 
set relativenumber
set number
set infercase
set background=dark
set autoread
set so=4
set magic
set lazyredraw
set noerrorbells
set novisualbell
set clipboard=unnamedplus

autocmd! bufwritepost .vimrc source %

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         Errors
    else
        lclose
    endif
endfunction
