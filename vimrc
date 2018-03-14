if !exists("g:syntax_on")
  syntax enable
endif
filetype plugin indent on 
set nocompatible
set noswapfile
set laststatus=2
set wildmenu
set incsearch
set shiftwidth=2
set tabstop=2 
set softtabstop=2 
set expandtab
set showmatch
set showcmd
set hlsearch
set undofile
set undodir=~/.vim/undodir
set number
set ruler
set autoread
set autoindent 
set belloff=all
set novisualbell
set colorcolumn=80
set clipboard=unnamedplus
highlight ColorColumn ctermbg=7
set history=10000
set ignorecase
set smartcase
set mouse=a
set backspace=indent,eol,start
packadd! matchit

autocmd VimResized * wincmd =

" grep for string in all buffers
function! s:GrepOpenBuffers(search)
    call setqflist([])
    let currBuff=bufnr("%")
    let l:winview = winsaveview()
    silent! exe 'bufdo vimgrepadd /' . a:search . '/ %'
    let matches = len(getqflist())
    execute 'buffer ' . currBuff
    call winrestview(l:winview)
    cw
endfunction
com! -nargs=1 BufGrep call <SID>GrepOpenBuffers('<args>')

