vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons', config = function()
    require("bufferline").setup({
      options = { numbers = "ordinal" }
    })
  end }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true,
    }
  }

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      open_mapping = '<leader>t',
      direction = 'float',
      float_opts = { border = 'curved' }
    })
  end }

  use { 'neoclide/coc.nvim', branch = 'release' }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = { line = '<leader>c', block = '<leader>b' },
        opleader = { line = '<leader>c', block = '<leader>b' }
      })
    end
  }

  use 'folke/tokyonight.nvim'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)
