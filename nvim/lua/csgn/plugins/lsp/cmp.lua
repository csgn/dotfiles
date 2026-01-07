return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	lazy = false,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
	},
	config = function(_, opts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}),
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					scrollbar = false,
					col_offset = -999,
					side_padding = 0,
					winhighlight = table.concat({
						"Normal:NormalFloat",
						"NormalFloat:NormalFloat",
						"FloatBorder:FloatBorder",
						"CursorLine:PmenuSel",
						"Pmenu:Pmenu",
						"PmenuSel:PmenuSel",
						-- "PmenuSbar:None", -- disable scrollbar
						"PmenuThumb:None",
						"EndOfBuffer:None",
						"Search:None",
					}, ","),
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					scrollbar = false,
					side_padding = 0,
				}),
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})
	end,
}
