require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua-language-server",
        "pyright",
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_language_server.setup {
    capabilities = capabilities
}

require("lspconfig").pyright.setup {
    capabilities = capabilities
}
