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
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { "mdslw" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			formatters = {
				mdslw = {
					prepend_args = function()
						return { "--max-width", "100", "--end-markers", "" }
					end,
				},
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
