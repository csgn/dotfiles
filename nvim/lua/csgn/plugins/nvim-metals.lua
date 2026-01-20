return {
	"scalameta/nvim-metals",
	ft = { "scala", "sbt", "java" },
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local metals_config = require("metals").bare_config()

		metals_config.handlers = {
			["window/showMessage"] = function(err, method, params, client_id) end,
			["window/logMessage"] = function(err, method, params, client_id) end,
		}

		metals_config.on_attach = function(client, bufnr)
			metals_config.init_options.statusBarProvider = "off"
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
			metals_config.on_attach = function(client, bufnr)
				map("n", "gD", vim.lsp.buf.definition)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "gi", vim.lsp.buf.implementation)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "gds", vim.lsp.buf.document_symbol)
				map("n", "gws", vim.lsp.buf.workspace_symbol)
				map("n", "<leader>cl", vim.lsp.codelens.run)
				map("n", "<leader>sh", vim.lsp.buf.signature_help)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>f", vim.lsp.buf.format)
				map("n", "<leader>ca", vim.lsp.buf.code_action)
			end
		end

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
