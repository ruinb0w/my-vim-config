package.path = package.path .. ';/Users/ruinb0w/.config/nvim/config/?.lua'

require('basic')
require("plugins")
require('lualine-conf')
require('coc-conf')
require('dap-config')

--[[ coc-explorer ]]
vim.keymap.set('n', '<leader>e', ':CocCommand explorer<CR>')


--[[ bufferline ]]
vim.opt.termguicolors = true
require("bufferline").setup {}
for i = 1, 9, 1 do
  vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>")
end

--[[ tokyonight ]]
require("tokyonight").setup({
  transparent = true
})
vim.cmd [[colorscheme tokyonight]]


-- [[fzf]]
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
