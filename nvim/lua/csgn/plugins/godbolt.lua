return {
	"p00f/godbolt.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("godbolt").setup({
			languages = {
				cpp = { compiler = "g122", options = {} },
				c = { compiler = "cg122", options = {} },
				rust = { compiler = "r1650", options = {} },
				-- any_additional_filetype = { compiler = ..., options = ... },
			},
			auto_cleanup = true, -- remove highlights and autocommands on buffer close
			highlight = {
				cursor = "Visual", -- `cursor = false` to disable
				-- values in this table can be:
				-- 1. existing highlight group
				-- 2. hex color string starting with #
				-- static = { "#222222", "#333333", "#444444", "#555555", "#444444", "#333333" },
				-- static = { "#1C1C1C", "#3E3232", "#A87C7C", "#D4AF37", "#A87C7C", "#3E3232" },
				-- static = { "#1B3022", "#236969", "#3D8361", "#D6CDA4", "#3D8361", "#236969" },
				-- static = { "#2D033B", "#810CA8", "#C147E9", "#E5B8F4", "#C147E9", "#810CA8" },
				static = { "#1A1A2E", "#16213E", "#0F3460", "#533483", "#0F3460", "#16213E" },
				-- `static = false` to disable
			},
			-- `highlight = false` to disable highlights
			quickfix = {
				enable = false, -- whether to populate the quickfix list in case of errors
				auto_open = false, -- whether to open the quickfix list in case of errors
			},
			url = "https://godbolt.org", -- can be changed to a different godbolt instance
		})
	end,
}
