-- [[fzf]]

function init()
  vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
end

return function(use)
  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { 'junegunn/fzf', run = './install --bin' }
  init()
end
