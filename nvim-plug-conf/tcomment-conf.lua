-- [[tcomment_vim]]
function init()
  vim.g.tcomment_opleader1 = '<leader>c'
end

return function(use)
  use 'tomtom/tcomment_vim'
  init()
end
