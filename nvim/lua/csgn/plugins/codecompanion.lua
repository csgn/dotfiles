return {
	"olimorris/codecompanion.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					window = {
						layout = "float",
						relative = "editor",
						width = 0.4,
						height = 0.8,
						row = 0,
						col = 1000,
						border = "rounded",
					},
				},
			},
			prompt_library = {
				markdown = {
					dirs = {
						vim.fn.getcwd() .. "/.prompts",
					},
				},
			},
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
			},
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "deepseek-coder-v2:lite",
							},
						},
					})
				end,
			},
			vim.keymap.set({ "n", "v" }, "<leader>a", "", { desc = "AI" }),
			vim.keymap.set(
				"n",
				"<leader>ac",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ desc = "Open CodeCompanion Chat" }
			),
			vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" }),
			vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" }),
		})
	end,
}
