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

--  close buffer
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR> ', map_opts)

--  close visual mode by mouse select
vim.o.mouse = ""

-- window manage
vim.keymap.set('n', "<leader>ws", "<c-w>s")
vim.keymap.set('n', "<leader>ww", "<c-w>w")
vim.keymap.set('n', "<leader>wv", "<c-w>v")

-- save and quit
vim.keymap.set('n', "<leader>s", ":w<CR>")
vim.keymap.set('n', "<leader>q", ":q<CR>")
