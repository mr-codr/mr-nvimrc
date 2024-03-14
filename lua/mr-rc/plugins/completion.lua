return {
	"hrsh7th/nvim-cmp", -- completion engine
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip", -- Snippets engine
	},
	config = function()
		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip/loaders/from_vscode").lazy_load()

		local cmp = require("cmp")
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			formatting = {
				fields = { "abbr", "kind" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-1),
				["<C-n>"] = cmp.mapping.scroll_docs(1),
				["<C-e>"] = function()
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end,
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
