return {
	"jay-babu/mason-nvim-dap.nvim",
	opts = {
		handlers = {},
		automatic_installation = {
			exclude = {
			},
		},
		ensure_installed = {
			"netcoredbg",
		},
	},
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
}
