function init()
  vim.api.nvim_set_var('coc_global_extensions',
    { 'coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-marketplace', 'coc-lua', 'coc-html',
      'coc-explorer', 'coc-rust-analyzer', 'coc-json', 'coc-css', '@yaegassy/coc-volar-tools',
      '@nomicfoundation/coc-solidity', '@yaegassy/coc-typescript-vue-plugin'
    })
  -- use tab to complete
  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    opts)
  vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
  -- use enter to select
  vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
  -- jump to next diagnostics
  vim.keymap.set("n", "<leader><leader>", "<Plug>(coc-diagnostic-next)", { silent = true })
  -- always show signcolumn
  vim.opt.signcolumn = "yes"
  -- Use K to show documentation in preview window
  function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end

  -- show doc
  vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- goto code
  vim.keymap.set("n", "gd", "<Plug>(coc-definition)")
  vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
  vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
  vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

  -- coc-explorer
  require('coc-explorer')
end

return function(use)
  use { 'neoclide/coc.nvim', branch = 'release' }
  init()
end
