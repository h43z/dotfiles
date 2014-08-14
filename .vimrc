set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shutnik/jshint2.vim'
Bundle 'bling/vim-airline'
""Bundle 'AutoClose'

set wildmenu
set laststatus=2 "activate airline

syntax on
filetype plugin on
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

"folding
set foldmethod=syntax
set foldlevel=99
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

