nmap <silent> gd <Plug>(coc-definition)
nnoremap <Space> :CocCommand<CR>

set hidden
set updatetime=100
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" coc plugins
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-pairs',
      \'coc-tsserver',
      \'coc-snippets',
      \'coc-css',
      \'coc-html',
      \'coc-rust-analyzer',
      \'coc-prettier',
      \'coc-json']

" 让tab执行补全操作
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 用回车确认补全后保持光标位置
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 报错跳转
" nmap <silent> <Leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader><Leader> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)

" 相同字符串高亮
" autocmd CursorHold * silent call CocActionAsync('highlight')

" 代码格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<Leader>n'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc explorer
nmap <Leader>e :CocCommand explorer<CR>
