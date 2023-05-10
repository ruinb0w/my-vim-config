vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }

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
      open_mapping = [[<leader>t]],
      direction = 'float',
      float_opts = { border = 'curved' }
    })
  end }

  use { 'neoclide/coc.nvim', branch = 'release' }


  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   dependencies = {
  --     'JoosepAlviste/nvim-ts-context-commentstring',
  --   },
  --   config = function()
  --     require('nvim-treesitter.configs').setup {
  --       ensure_installed = { 'css', 'html', 'javascript', 'scss', 'tsx', 'typescript', 'vue' },
  --       -- context_commentstring = { enable = true },
  --     }
  --   end
  -- }
  -- use {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup({
  --       toggler = { line = '<leader>c', block = '<leader>b' },
  --       opleader = { line = '<leader>c', block = '<leader>b' }
  --     })
  --   end
  -- }

  use 'tomtom/tcomment_vim'

  use 'folke/tokyonight.nvim'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }

  use 'mfussenegger/nvim-dap'

  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }

  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'junegunn/fzf', run = './install --bin' }
end)
