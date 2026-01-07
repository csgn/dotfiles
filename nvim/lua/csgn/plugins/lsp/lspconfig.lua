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
		vim.api.nvim_set_keymap(
			"n",
			"<leader>bb",
			"<cmd>lua vim.lsp.buf.code_action()<CR>",
			{ noremap = true, silent = true }
		)

		if vim.lsp.config then
			-- Setup Lua language server
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim", "require" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")
		else
			-- legacy config here
			vim.print("Legacy lspconfig!")
		end
	end,
}
