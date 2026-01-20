return {
	"j-hui/fidget.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		require("fidget").setup({})
	end,
}
