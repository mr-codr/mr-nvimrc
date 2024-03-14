return {
	"rbong/vim-flog",
	dependencies = { "tpope/vim-fugitive" },
	keys = {
		{ "<leader>gd", "<CMD>Gvdiffsplit<CR>zR" },
		{ "<leader>ga", "<CMD>Gwrite<CR>" },
		{ "<leader>gu", "<CMD>Git restore --staged %<CR>" },
		{ "<leader>gr", "<CMD>Gread<CR>" },
		{ "<leader>gs", "<CMD>Git<CR>" },
		{ "<leader>gc", "<CMD>Git commit<CR>" },
		{ "<leader>gg", "<CMD>Flog<CR>" },
		{ "<leader>gb", "<CMD>Telescope git_branches<CR>" },
	},
	config = function()
		vim.g.flog_permanent_default_opts = { all = true, format = "%d %s" }
	end,
}
