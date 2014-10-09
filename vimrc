set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'fugitive.vim'
Bundle 'edkolev/tmuxline.vim'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 0

syntax on
filetype plugin on
set noswapfile
set laststatus=2
"set mouse=a
set wildmenu
set laststatus=2 "activate airline
set incsearch
set expandtab "replace tab with space
set tabstop=2
set showmatch "move cursor short to previous matching bracket
set hlsearch "highlight all matches
set background= " will make nicer highlights
set ignorecase
set shiftwidth=2 "for indenting with >> or <<
set undofile
set undodir=~/.vim/undodir "make undoes persistent
set number
set relativenumber

set foldmethod=indent
set foldlevel=99


cmap w!! w !sudo tee % >/dev/null

let javaScript_fold=1         
let perl_fold=1               
let php_folding=1             
let r_syntax_folding=1        
let ruby_fold=1               
let sh_fold_enabled=1         
let vimsyn_folding='af'
let xml_syntax_folding=1
