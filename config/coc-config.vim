" ------------ basic config -----------
" utf-8 byte sequence.
set encoding=utf-8
set nobackup
set nowritebackup


" set hidden
set updatetime=300
set signcolumn=yes
" if has("patch-8.1.1564")
  " set signcolumn=number
" else
  " set signcolumn=yes
" endif

" ------------ plugins -------------

" coc plugins
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-pairs',
      \'coc-tsserver',
      \'coc-snippets',
      \'coc-css',
      \'coc-html',
      \'coc-prettier',
      \'coc-json',
      \'@yaegassy/coc-volar',
      \'coc-rust-analyzer']


" ------------ shortcuts ------------
" list coc command
nnoremap <Space> :CocCommand<CR>

" use tab to show tip
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" keep cursor pointion after complete code
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" jump to error position
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

" jump to next placeholder
let g:coc_snippet_next = '<Leader>n'

" coc explorer
nmap <Leader>e :CocCommand explorer<CR>
