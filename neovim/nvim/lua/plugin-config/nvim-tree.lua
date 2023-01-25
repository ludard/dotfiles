-- https://github.com/nvim-tree/nvim-tree.lua
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  print("nvim-tree is not installed.")
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()
