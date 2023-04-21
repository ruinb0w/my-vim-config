vim.g.mapleader = ";"

--  copy and paste from system clipboard
local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', map_opts)
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', map_opts)

--  set line number
vim.o.relativenumber = true
vim.o.number = true

-- ignorecase
vim.o.ignorecase = true

--  set tab
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

--  clear search buffer
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':let @/ = ""<CR>', map_opts)

--  set fold
vim.o.fdm = "indent"
vim.o.foldlevelstart = 99

--  save cursor position
vim.api.nvim_create_autocmd("BufLeave", { pattern = "*", command = "let b:winview = winsaveview()" })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "if(exists('b:winview')) | call winrestview(b:winview) | endif"
})

--  close buffer
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR> ', map_opts)

--  close visual mode by mouse select
vim.o.mouse = ""
