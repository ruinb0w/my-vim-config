-- [[fzf]]
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

return function(use)
  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'junegunn/fzf', run = './install --bin' }
end
