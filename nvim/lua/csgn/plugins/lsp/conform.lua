return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				bash = { "shfmt" },
				--docker = { "hadolint" },
				verilog = { "verible" },
				--glsl = { "glsl_analyzer" },
				gdscript = { "gdformat" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>l", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
