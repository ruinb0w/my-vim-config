return function(use)
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      direction = 'float',
      float_opts = { border = 'curved' }
    })
  end }
end
