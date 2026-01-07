return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		"<leader>f",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
		vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>")
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 35,
			},
			renderer = {
				group_empty = true,
				root_folder_label = false,
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
