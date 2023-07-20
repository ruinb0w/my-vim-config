function init()
  require("tokyonight").setup({
    transparent = true
  })
  vim.cmd [[colorscheme tokyonight]]
end

return function(use)
  use 'folke/tokyonight.nvim'
  init()
end
