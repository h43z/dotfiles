set nocompatible
filetype off
set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'Syntastic'
Plugin 'https://github.com/scrooloose/nerdtree.git'

let mapleader=","
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 0

highlight Pmenu ctermfg=black ctermbg=grey
highlight PmenuSel ctermfg=black ctermbg=white

"Will try this out
set hidden
nnoremap  T :enew<cr>
nnoremap  K :bnext<CR>
nnoremap  J :bprevious<CR>
nnoremap  <leader>x :bp <BAR> bd! #<CR>

nnoremap <leader>p :set paste!<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap ; :CtrlPBuffer<CR>
"imap <Tab> <C-P>
nmap j gj
nmap k gk

syntax on
filetype plugin indent on
set dictionary=/usr/share/dict/words
set noswapfile
set laststatus=2
set wildmenu
set incsearch
set expandtab 
set tabstop=2
set showmatch 
set hlsearch 
set background= 
set ignorecase
set shiftwidth=2 
set undofile
set undodir=~/.vim/undodir 
set relativenumber
set number
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set infercase

command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
cmap w!! w !sudo tee % >/dev/null
nnoremap <Space> za
"let javaScript_fold=99
"let perl_fold=1               
"let php_folding=1             
"let r_syntax_folding=1        
"let ruby_fold=1               
"let sh_fold_enabled=1         
"let vimsyn_folding='af'
"let xml_syntax_folding=1
