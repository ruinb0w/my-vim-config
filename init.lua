package.path = package.path .. ';/Users/ruinb0w/.config/nvim/config/?.lua'

require('basic')
require("plugins")
require('lualine-conf')
require('coc-conf')
require('dap-config')

--[[ coc-explorer ]]
vim.keymap.set('n', '<leader>e', ':CocCommand explorer<CR>', { silent = true })


--[[ bufferline ]]
vim.opt.termguicolors = true
require("bufferline").setup {}
for i = 1, 9, 1 do
  vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>", { silent = true })
end

-- [[ tokyonight ]]
require("tokyonight").setup({
  transparent = true
})
vim.cmd [[colorscheme tokyonight]]


-- [[fzf]]
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

--[[ codeium ]]
vim.g.codeium_disable_bindings = 1

-- [[ignore perl]]
vim.g.loaded_perl_provider = 0

-- [[tcomment_vim]]
vim.g.tcomment_opleader1 = '<leader>c'
