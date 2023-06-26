--[[ bufferline ]]
vim.opt.termguicolors = true
require("bufferline").setup {}
vim.keymap.set("n", "<leader>b", ":BufferLinePick<cr>", { silent = true })
for i = 1, 9, 1 do
  vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>", { silent = true })
end


return function(use)
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons', config = function()
    require("bufferline").setup({
      options = { numbers = "ordinal" }
    })
  end }
end
