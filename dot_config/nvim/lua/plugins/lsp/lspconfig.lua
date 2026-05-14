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
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("csharp_ls")
		else
			-- legacy config here
			vim.print("Legacy lspconfig!")
		end
	end,
}
