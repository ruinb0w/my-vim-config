let mapleader=";"

" copy and paste from system clipboard
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" switch window by tab
nmap <Tab> <C-w>w
nmap <Leader>h :vs<CR>
nmap <Leader>v :sv<CR>

" set line number
set number relativenumber
set ignorecase

" set tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" clear search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" set fold
set fdm=indent
set foldlevelstart=99

" save cursor position
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" close buffer
nmap <Leader>d :bd<CR>
