function init()
  require('leap').add_default_mappings()
  vim.keymap.del({ 'x', 'o' }, 'x')
  vim.keymap.del({ 'x', 'o' }, 'X')
end

return function(use)
  use { 'ggandor/leap.nvim' }
  init()
end
