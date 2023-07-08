-- 这一句很重要，不然没法下载语言包
require("nvim-treesitter").prefer_git = true

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "css", "rust", "java", "markdown", "cpp" },
    highlight = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
