return {
	"brenoprata10/nvim-highlight-colors",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-highlight-colors").setup({})
	end,
}
