return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	keys = {
		{
			"<leader>h",
			desc = "Add File to Harpoon",
		},
		{
			"<leader>j",
			desc = "Toggle Harpoon Menu",
		},
		{
			"<C-h>",
			desc = "Go to Harpoon Mark 1",
		},
		{
			"<C-t>",
			desc = "Go to Harpoon Mark 2",
		},
		{
			"<C-n>",
			desc = "Go to Harpoon Mark 3",
		},
		{
			"<C-s>",
			desc = "Go to Harpoon Mark 4",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local toggle_opts = {
			border = "rounded",
			title_pos = "center",
			ui_width_ratio = 0.70,
			height_in_lines = 32,
		}

		-- Add current file
		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end)

		-- Toggle menu
		vim.keymap.set("n", "<leader>j", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
		end)

		-- Jump to marks
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)
	end,
}

