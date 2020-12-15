filetype plugin indent on 
set syntax=off
set nomodeline
set nocompatible
set nowrap
set nrformats=
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
set noruler
set autoread
set autoindent 
set belloff=all
set novisualbell
set colorcolumn=80
set clipboard=unnamed
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
highlight ColorColumn ctermbg=7
set history=10000
set ignorecase
set smartcase
set mouse=n
set backspace=indent,eol,start
set background=dark
packadd! matchit

"stopped workingo Fri 03 Apr 2020 02:53:39 AM CEST
"let netrw_browsex_viewer='xdg-open'
nmap <silent> gx :!firefox "<cWORD>"<cr><cr>

" use tabs when working with shell scripts
autocmd FileType sh set noexpandtab

autocmd VimResized * wincmd =
" vue -vim
"autocmd FileType vue syntax sync fromstart

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
command! -nargs=1 BufGrep call <SID>GrepOpenBuffers('<args>')

" count number of matches
map ,* *<C-O>:%s///gn<CR>

"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>
