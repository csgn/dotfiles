return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"gopls",
				"rust_analyzer",
				"bashls",
				"docker_language_server",
				"ts_ls",
			},
			automatic_installation = true,
		})
	end,
}

