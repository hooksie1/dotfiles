-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
return {
  vim.keymap.set("n", "<leader>vs", "<C-w>v <cr>"),
  vim.keymap.set("n", "<leader>hs", "<C-w>s <cr>"),
  vim.keymap.set("n", "<leader>y", '"+y'),
  vim.keymap.set("v", "<leader>y", '"+y'),
  vim.keymap.set("n", "<leader>y", '"+Y'),
}
