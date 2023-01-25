-- 自动安装 Packer.nvim
-- https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- 检查 packer 是否安装，没有就自动安装
local packer_bootstrap = ensure_packer()

-- 自定义状态检查 vim.notify() 和 print()都可以提示信息
local setup, packer = pcall(require, "packer")
if not setup then
  -- vim.notify("Packer 没有安装")
  print("Packer is not installed.")
  return
end

-- 自动重新加载所有插件和配置
packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- 用户安装的插件列表
    -- https://github.com/rockerBOO/awesome-neovim 

    -- function short
    -- use 'nvim-lua/plenary.nvim'

    -- 图标字体
    use 'kyazdani42/nvim-web-devicons'

    -- lualine 状态栏美化
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        -- 自动加载配置文件：lua/plugin-config/nvim-tree.lua
        require("plugin-config.lualine")
      end
    }

    -- bufferline buffer 转Tab页
    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require("plugin-config.bufferline")
      end
    }

    -- nvim-autopairs 自动补全匹配括号
    use {
      'windwp/nvim-autopairs',
      config = function()
        require("plugin-config.nvim-autopairs")
      end
    }

    -- 同时修改字符串两边的符号,比如 "" -> ''. key:ysaw" cs"' ds"
    use 'tpope/vim-surround'

    -- grep-replace替换单词 key:grw,griw,graw
    use 'vim-scripts/ReplaceWithRegister'

    -- vim-illuminate 高亮相同的选中词
    use("RRethy/vim-illuminate")

    -- Comment 代码注释 key:gc
    use {
      'numToStr/Comment.nvim',
      config = function()
        require("plugin-config.comment")
      end
    }

    -- nvim-tree 文件管理器，命令 :NvimTreeToggle
    use {
      'nvim-tree/nvim-tree.lua',
      config = function()
        require("plugin-config.nvim-tree")
      end
    }

    -- fuzzy finding 模糊搜索 
    use 'BurntSushi/ripgrep'
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      config = function()
        require("plugin-config.telescope")
      end,
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
    }

    -- 智能提示 :mason 查看所有语言LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
      "neovim/nvim-lspconfig"
    }

    -- 自动补全
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path" -- 文件路径
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- 窗口切换
    -- use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
    -- use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分

    -- 使用默认浏览器打开链接
    if vim.g.is_win or vim.g.is_mac then
      -- open URL in browser
      use { "tyru/open-browser.vim", event = "VimEnter" }
    end

    -- 显示快捷键列表
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("plugin-config.which-key")
        end, 2000)
      end,
    }

    --  ---------- colorschemes -----------
    -- nightfly
    -- use 'bluz71/vim-nightfly-colors'
    -- nightfox
    use 'EdenEast/nightfox.nvim'
    -- tokyonight
    -- use 'folke/tokyonight.nvim'
    -- OceanicNext
    -- use 'mhartington/oceanic-next'
    -- zephyr
    -- use 'glepnir/zephyr-nvim'
    -- onedark
    -- use 'ful1e5/onedark.nvim'
    -- gruvbox
    -- use 'ellisonleao/gruvbox.nvim'
    -- nord
    -- use 'shaunsingh/nord.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  -- 设置代理
  -- 配置代理后 telescope 下载的不是最新版本无法运行  
  config = {
    -- 下载最大并发数telescope/pickers.lua:327: attempt to call field 'create' (a nil value)
    max_jobs = 8,
    git = {
      -- 自定义仓库源
      -- default_url_format = 'https://gitcode.net/mirrors/%s',
      -- default_url_format = 'https://gitclone.com/github.com/%s',
      -- default_url_format = 'https://hub.fastgit.xyz/%s',
      -- default_url_format = 'https://mirror.ghproxy.com/https://github.com/%s',
    }
  },
})


-- 每次保存 plugins.lua 文件时都自动运行 :PackerSync 命令更新所有插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
