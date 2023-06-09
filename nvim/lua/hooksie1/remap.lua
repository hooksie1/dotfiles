vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Neotree reveal<cr>")

vim.keymap.set("n", "<leader>f", ":FZF<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>t", ":tabnew<cr>")
vim.keymap.set("n", "<leader>vs", "<C-w>v <cr>")
vim.keymap.set("n", "<leader>hs", "<C-w>s <cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod 755 %<CR>", { silent = true })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "AA", "<Esc>A")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "\"", "\"\"<Esc>i")
vim.keymap.set("i", "'", "''<Esc>i")

vim.keymap.set("v", "<leader>(", "xi()<Esc>P")
vim.keymap.set("v", "<leader>[", "xi[]<Esc>P")
vim.keymap.set("v", "<leader>\"", "xi\"\"<Esc>P")
vim.keymap.set("v", "<leader>'", "xi''<Esc>P")

vim.keymap.set("i", "<D-v>", "<C-r>+")
