return {
	"neovim/nvim-lspconfig", -- initial configs for LSP
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- completion with the LSP
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			-- vim.keymap.set("n", "<leader>rn", '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
			vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declararion, opts)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
			-- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

			-- Set autocommands conditional on server_capabilities
			-- if client.server_capabilities.documentHighlight then
			-- 	vim.api.nvim_exec(
			-- 		[[
			--        augroup lsp_document_highlight
			--          autocmd! * <buffer>
			--          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			--          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			--        augroup END]],
			-- 		false
			-- 	)
			-- end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local signs = {
			DiagnosticSignError = "",
			DiagnosticSignWarn = "",
			DiagnosticSignHint = "",
			DiagnosticSignInfo = "",
		}
		for type, icon in pairs(signs) do
			vim.fn.sign_define(type, { texthl = type, text = icon, numhl = "" })
		end

		vim.diagnostic.config({
			-- disable virtual text
			virtual_text = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["angularls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("angular.json", "nx.json"),
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "scss", "javascript", "typescript" },
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "scss" },
		})
	end,
}
