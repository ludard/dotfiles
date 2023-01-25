-- leader 键设置为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
local keymap = vim.keymap

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- 用 H 和 L 代替 ^ 与 $    
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- 可视化模式下选中文本使用 J/K上下移动文本
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 水平新增窗口
keymap.set("n", "<leader>sv", "<C-w>v")
-- 垂直新增窗口
keymap.set("n", "<leader>sh", "<C-w>s")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Comment 代码注释插件
-- see ./lua/plugin-config/comment.lua
-- ctrl + /

-- telescope
-- ff 索引文件, fs 全局搜索文本, fw 当前文件搜索单词，fb 搜索缓存，fh 帮助
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

-- bufferline tab页切换
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

