set nocompatible

"vundle
filetype off
set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"plugins in use
Plugin 'gmarik/vundle' "plugin manager
Plugin 'bling/vim-airline' "fancier statusline
Plugin 'tpope/vim-fugitive' "git integration
Plugin 'scrooloose/syntastic' "syntax checking
Plugin 'scrooloose/nerdtree' "file browser
Plugin 'airblade/vim-gitgutter' "git status indicator column
Plugin 'sjl/gundo.vim' "undo manager
Plugin 'morhetz/gruvbox' "retro color scheme
Plugin 'inside/vim-search-pulse' "pulse effect on searches
Plugin 'Raimondi/delimitMate' "auto delim closer
Plugin 'kien/ctrlp.vim' "fuzzy finder
Plugin 'ryanoasis/vim-webdevicons' "fancy icons
Plugin 'jceb/vim-orgmode' "emacs orgmode clone
Plugin 'tpope/vim-speeddating' "increment dates, orgmode needs this

syntax on "enable syntax highlighting
filetype plugin indent on "load plugin/indent files for specific filetypes
colorscheme gruvbox
let mapleader=","

"costomized plugin settings
""gruvbox colorscheme
let g:gruvbox_sign_column = 'dark0'

""vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace= 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

""vim-search-pulse
let g:vim_search_pulse_mode = 'pattern'

""ctrlp
let g:ctrlp_map = '<c-p>'

"normal maps
""toggle file browser
nmap <leader>n :NERDTreeToggle<CR>

""toggle own synstastic error function
nmap <leader>e :call ToggleErrors()<CR>

""toggle undo manager tree
nmap <leader>u :GundoToggle<CR>

""make current window the only one on screen
nmap <leader>o :only<CR>

""create new tab
nmap T :tabnew<cr>

""go to next/prev tab
nmap K :tabnext<CR>
nmap J :tabprevious<CR>

""go to next/prev buffer
nmap bk :bnext<CR>
nmap bj :bprevious<CR>

""navigate multilines without breaks seperatly
nmap j gj
nmap k gk

""move between windows with C-hjkl
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

""close a saved buffer
nmap <leader>q :bwipeout<CR>

""force close a buffer
nmap <leader>x :bwipeout!<CR>

"command maps
""save file even if opened RO
cmap w!! w !sudo tee % >/dev/null

""force quit all buffers/tabs and therefore vim
cmap qq qa!

"insert maps
imap jj <ESC>

"settings
set dictionary=/usr/share/dict/words
set pastetoggle=<leader>p
set noswapfile
set laststatus=2 "always show statusline
set wildmenu "commandline completion
set incsearch "show matches while typing
set expandtab "convert tabs to spaces
set tabstop=2
set showmatch "show quickly matchin
set hlsearch
set ignorecase
set shiftwidth=2
set undofile
set undodir=~/.vim/undodir
set number
set infercase
set background=dark
set autoread
set magic
set noerrorbells
set novisualbell
set clipboard=unnamedplus
set showcmd
set hidden
set tags+=tags

autocmd! bufwritepost .vimrc source %
autocmd BufNewFile,BufRead *.gradle setf groovy
" trim whitesapces on save
autocmd BufWritePre * %s/\s\+$//e
" return to previous location of curser on load
autocmd BufReadPost * normal `"

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         Errors
    else
        lclose
    endif
endfunction
