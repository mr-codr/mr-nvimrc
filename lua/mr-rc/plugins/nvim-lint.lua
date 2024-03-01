return {
	"mfussenegger/nvim-lint",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "VeryLazy" },
	enabled = false,
	dependencies = {
		"williamboman/mason.nvim", -- this line is to make lspconfig load after mason setup
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			-- javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end)
	end,
}
