local opt = vim.opt  -- 方便引用使用简短局部变量

-- 行号设置
opt.relativenumber = true
opt.number = true

-- tab 和缩进设置
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 换行设置
opt.wrap = false

-- 搜索设置
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- 高亮光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 启用终端真颜色，颜色主题需要
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.signcolumn = "yes"   -- 左侧多一列，方便debug

-- 是否显示不可见字符
vim.o.list = false

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.listchars = "space:·,tab:··"

-- 补全增强
vim.o.wildmenu = true

-- 删除设置
opt.backspace = "indent,eol,start"
-- 将 - 视为单词的一部分
opt.iskeyword:append("-")

-- 剪切板设置 和操作系统交互
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

