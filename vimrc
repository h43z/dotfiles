set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'fugitive.vim'
Bundle 'edkolev/tmuxline.vim'

"let mapleader=","
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 0

highlight Pmenu ctermfg=black ctermbg=grey
highlight PmenuSel ctermfg=black ctermbg=white

"nmap <leader>T :enew<cr>
"nmap <leader>l :bnext<CR>
"nmap <leader>h :bprevious<CR>
"nmap <leader>bq :bp <BAR> bd #<CR>

"Will try this out
set hidden
nnoremap  T :enew<cr>
nnoremap  K :bnext<CR>
nnoremap  J :bprevious<CR>
nnoremap  x :bp <BAR> bd! #<CR>

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
"cmap run new read !<space> 
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
