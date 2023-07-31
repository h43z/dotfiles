filetype plugin indent on
syntax off
set nomodeline
set nocompatible
set nowrap
set nrformats=
set noswapfile
set laststatus=2
set wildmenu
set incsearch
set shiftwidth=2
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
set clipboard=unnamed
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
highlight ColorColumn ctermbg=7
set history=10000
set ignorecase
set smartcase
set mouse=a
set backspace=indent,eol,start
set background=dark
set list listchars=tab:»·,trail:·
set nofixendofline
packadd! matchit

let netrw_browsex_viewer='xdg-open'

" use tabs when working with shell scripts
autocmd FileType sh set noexpandtab

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
command! -nargs=1 BufGrep call <SID>GrepOpenBuffers('<args>')

" count number of matches
map ,* *<C-O>:%s///gn<CR>

function! Vtip()
  echomsg system('curl -s -m 3 https://vtip.43z.one')
endfunction

noremap ,v :call Vtip()<CR>
