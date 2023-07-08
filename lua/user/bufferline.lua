vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offset = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
        }}
    }
}
