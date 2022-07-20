" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline' " show panel and tabline
Plugin 'chemzqm/wxapp.vim' " use for wechat mini program
Plugin 'neoclide/coc.nvim'
Plugin 'preservim/nerdcommenter' " commenter tool
Plugin 'CodeFalling/fcitx-vim-osx'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'ap/vim-css-color' " css color preview
Plugin 'preservim/tagbar'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'vue': { 'left': '<!--','right': '-->' } }

" airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>k <Plug>AirlineSelectPrevTab
nmap <leader>j <Plug>AirlineSelectNextTab

"tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 2

