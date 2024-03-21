return {
	"williamboman/mason.nvim", -- manager for editor tools (LSP, lint, etc.)
	-- event = { "BufReadPre", "BufNewFile" },
	-- event = { "VeryLazy" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- bridge between `manson.nvim` and `nvim-lspconfig`
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				-- nvim
				"lua_ls",
				-- web dev
				"angularls",
				"tsserver",
				"emmet_ls",
				"cssls",
				"eslint",
			},
			automatic_installation = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettierd",
				-- "eslint_d",
			},
		})
	end,
}
