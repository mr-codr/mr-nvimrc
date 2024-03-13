return {
	"stevearc/conform.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "VeryLazy" },
	dependencies = {
		"williamboman/mason.nvim", -- this line is to make lspconfig load after mason setup
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			formatters = {
				prettierd = { "--prose-wrap", "always", "--print-width", "90" },
				-- prettier = {
				-- 	prepend_args = { "--prose-wrap", "always", "--print-width", "100", "--tab-width", "4" },
				-- prepend_args = function(self, ctx)
				-- 	print(ctx.filetype)
				-- 	return { "--print-width", "100" }
				-- end,
				-- },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end)
	end,
}
