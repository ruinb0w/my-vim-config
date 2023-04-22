package.path = package.path .. ';/Users/ruinb0w/.config/nvim/config/?.lua'

require("basic")
require("plugins")

--[[ coc ]]
vim.api.nvim_set_var('coc_global_extensions',
  { 'coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-marketplace', 'coc-lua', 'coc-html',
    'coc-explorer', 'coc-tsserver', 'coc-rust-analyzer', 'coc-json', 'coc-css', '@yaegassy/coc-volar-tools' })
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

vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

--[[ coc-explorer ]]
vim.keymap.set('n', '<leader>e', ':CocCommand explorer<CR>')


--[[ bufferline ]]
vim.opt.termguicolors = true
require("bufferline").setup {}

--[[ lualine ]]
require('lualine').setup()

--[[ tokyonight ]]
require("tokyonight").setup({
  transparent = true
})
vim.cmd [[colorscheme tokyonight]]

--[[ bufferline ]]
for i = 1, 9, 1 do
  vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>")
end

--[[ debug ]]
require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end

-- [[fzf]]
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
