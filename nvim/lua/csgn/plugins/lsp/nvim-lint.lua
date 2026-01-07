return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			markdown = { "vale" },
			lua = { "luacheck" },
			python = { "pylint" },
			go = { "golangcilint" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			bash = { "shellcheck" },
			docker = { "hadolint" },
			ts = { "eslint" },
			rust = { "clippy" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>li", function()
			lint.try_lint()
		end, { desc = "Trigger linting" })
	end,
}
