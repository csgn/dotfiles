return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        -- Key mappings for LSP
        vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

        -- Setup Lua language server
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = {
                        'vim',
                        'require',
                    },
                },
                },
            },
        })
    end,
}