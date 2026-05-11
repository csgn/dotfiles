return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false, loop = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		require("which-key").setup({
			preset = "modern",
			keys = {
				scroll_up = "<Up>",
				scroll_down = "<Down>",
			},
		})
	end,
}
