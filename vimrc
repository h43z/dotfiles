set nocompatible
filetype off
set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"plugins in use
Plugin 'gmarik/Vundle.vim' "plugin manager
Plugin 'bling/vim-airline' "fancier statusline
Plugin 'tpope/vim-fugitive' "git integration
Plugin 'scrooloose/syntastic' "syntax checking
Plugin 'scrooloose/nerdtree' "file browser
Plugin 'airblade/vim-gitgutter' "git status indicator column
Plugin 'sjl/gundo.vim' "undo manager
Plugin 'morhetz/gruvbox' "retro color scheme
Plugin 'inside/vim-search-pulse' "pulse effect on searches
Plugin 'Raimondi/delimitMate' "auto delim closer
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plugin 'gregsexton/gitv' "gitk clone
Plugin 'Valloric/MatchTagAlways' "(html)tag matcher
Plugin 'dietsche/vim-lastplace' "Reopen files where left off
Plugin 'bkad/CamelCaseMotion' "motions for camelcase and undersocore words

syntax on "enable syntax highlighting
filetype plugin indent on "load plugin/indent files for specific filetypes
colorscheme gruvbox
"hi Normal ctermbg=none
let mapleader=","
let g:netrw_browsex_viewer= "google-chrome" "use gx to open url under cursor in browser

"costomized plugin settings
""gruvbox colorscheme
let g:gruvbox_sign_column = 'dark0'

""vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

""vim-search-pulse
let g:vim_search_pulse_mode = 'pattern'

""ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_extensions = ['filer']
"normal maps
""toggle file browser
nmap <leader>n :NERDTreeToggle<CR>

""syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let javaScript_fold=1
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
nmap <leader>k :bnext<CR>
nmap <leader>j :bprevious<CR>

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

"" look for ctags
nmap <leader>t :CtrlPTag<cr>

"command maps
""save file even if opened RO
cmap w!! w !sudo tee % >/dev/null

""force quit all buffers/tabs and therefore vim
cmap qq qa!

"settings
set dictionary=/usr/share/dict/words
set pastetoggle=<leader>p
set noswapfile
set laststatus=2 "always show statusline
set wildmenu "commandline completion
set incsearch "show matches while typing
set expandtab "convert tabs to spaces
set tabstop=2 "tab == 2 spaces
set shiftwidth=2 "> uses 2 spaces
set showmatch "show quickly matching closing brackets
set hlsearch "highlight all search results
set ignorecase "ignore case in search patterns
set undofile "persistent undo file
set undodir=~/.vim/undodir
set number "show linenumbers"
set synmaxcol=2048 "check if this makes vim less slow for big files
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
set foldmethod=syntax
set foldlevel=99
set timeoutlen=200
set mouse=a

"Autocmds
""reload vimrc on save
autocmd! bufwritepost .vimrc source %

""delete trailing spaces on save
autocmd BufWrite * :call DeleteTrailingWS()

""set groovy filetyp for gradle files
autocmd BufNewFile,BufRead *.gradle setf groovy

"" restore folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"functions
"toggle syntastic errors
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         Errors
    else
        lclose
    endif
endfunction

""trim whitesapces on save and restore correct position
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
