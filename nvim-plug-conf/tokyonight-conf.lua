-- [[ tokyonight ]]
require("tokyonight").setup({
  transparent = true
})
vim.cmd [[colorscheme tokyonight]]

return function(use)
  use 'folke/tokyonight.nvim'
end
