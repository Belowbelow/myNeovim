-- 主题设置
vim.cmd "colorscheme tokyonight-day"

-- 插件lualine
require('lualine').setup({
    options = {
        theme = 'tokyonight'
    }
})

-- 插件nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
