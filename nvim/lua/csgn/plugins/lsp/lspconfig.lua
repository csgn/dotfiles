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

			-- Setup C/C++ language server
			vim.lsp.enable("clangd")

			-- Setup Python language server
			vim.lsp.enable("pyright")

			-- Setup Go language server
			vim.lsp.enable("gopls")

			-- Setup Rust language server
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enable = false,
						},
					},
				},
			})
			vim.lsp.enable("rust_analyzer")

			-- Setup Bash language server
			vim.lsp.enable("bashls")

			-- Setup Docker language server
			vim.lsp.enable("docker_language_server")

			-- Setup Typescript language server
			vim.lsp.enable("ts_ls")

			-- Setup Verilog language server
			vim.lsp.enable("verible")

			-- Setup Markdown language server
			vim.lsp.enable("marksman")

			-- Setup GLSL language server
			vim.lsp.enable("glsl_analyzer")

			-- Setup Gdscript language server
			vim.lsp.config("gdscript", {
				name = "godot",
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			})
			vim.lsp.enable("gdscript")
		else
			-- legacy config here
			vim.print("Legacy lspconfig!")
		end
	end,
}
