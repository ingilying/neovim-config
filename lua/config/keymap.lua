local map = vim.keymap.set

-- Save files
map({"i","x","n","s"}, "<C-s>","<cmd>w<cr><esc>", { desc = "Save Files"})

-- esc to hide search highlight
map("n","<esc>","<cmd>noh<cr>")

-- Ctrl c/v to copy/paste 
map("n","<C-c>", '"+y')
map({"n","v"}, "<C-v>", '"+p')
map("i", "C-v", '<esc>"+p')

-- Move to windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- quit mode
map({"i","v","s","x"}, "jk", "<esc>")

-- use space key as leader key
vim.g.mapleader = " "

-- quit
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit"})


