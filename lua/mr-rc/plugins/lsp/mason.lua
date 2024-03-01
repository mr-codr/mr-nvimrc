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
				"lua_ls",
				"angularls",
				"tsserver",
				"emmet_ls",
				"cssls",
				"tailwindcss",
				"eslint",
			},
			automatic_installation = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				-- "eslint_d",
				"stylua",
				"glow",
				"mdslw",
			},
		})
	end,
}
