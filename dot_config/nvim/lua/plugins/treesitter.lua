return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.config").setup({
			ensure_installed = {
				"lua", "vim", "vimdoc", "query", "javascript", "typescript",
				"python", "html", "css", "json", "bash", "markdown", "markdown_inline"
			},
			auto_install = true,
			sync_install = false,
			ignore_install = { "scala", "help" },
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = { "scala" },
			},
		})
	end,
}
