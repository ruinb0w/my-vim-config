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
