return {
	"scalameta/nvim-metals",
	ft = { "scala", "sbt", "java" },
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local metals_config = require("metals").bare_config()

		metals_config.init_options.statusBarProvider = "off"
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

		metals_config.settings = {
			superMethodLensesEnabled = true,
		}

		metals_config.handlers = {
			["window/showMessage"] = function(err, method, params, client_id) end,
			["window/logMessage"] = function(err, method, params, client_id) end,
		}

		-- Tuş atamaları burada yapılır
		metals_config.on_attach = function(client, bufnr)
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- "gd" olarak değiştirdim, isteğine göre "gD" yapabilirsin
			map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
			map("n", "gr", vim.lsp.buf.references, "Go to References")
			map("n", "gds", vim.lsp.buf.document_symbol, "Document Symbols")
			map("n", "gws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
			map("n", "<leader>cl", vim.lsp.codelens.run, "Code Lens")
			map("n", "<leader>sh", vim.lsp.buf.signature_help, "Signature Help")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			--map("n", "<leader>f", vim.lsp.buf.format, "Format")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
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
