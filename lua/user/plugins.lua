local fn = vim.fn

-- 安装packer 
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen nvim..."
    vim.cmd [[packadd packer.nvim]]
end

-- 自动重载neovim当保存plugin文件时
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- 防止第一次运行时没有packer报错
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- 设置packer窗口
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- 在这里安装自己的脚本
return packer.startup(function(use)
    -- 插件列表

    use "wbthomason/packer.nvim"    -- packer包
    use "nvim-lua/popup.nvim"   -- Popup API 在nvim上的实现
    use "folke/tokyonight.nvim"     -- 主题

    -- 更丰富的指令栏
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- nvim tree 文件管理系统
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        }
    }

    -- 代码高亮插件
    use "nvim-treesitter/nvim-treesitter"

    -- 括号插件，括号颜色不同
    use "p00f/nvim-ts-rainbow"

    -- cmp插件
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- snippets 代码片段
    use "L3MON4D3/Luasnip"
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/cmp-nvim-lsp"

    -- lsp 插件
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use "numToStr/Comment.nvim" --注释
    use "windwp/nvim-autopairs"     -- 括号自动补全

    use "akinsho/bufferline.nvim" -- bufferline
    use "lewis6991/gitsigns.nvim" -- git提示

    use {
        "nvim-telescope/telescope.nvim",  -- 文件检索
        requires = { { "nvim-lua/plenary.nvim" } },
    }
    -- 插件列表结束
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
