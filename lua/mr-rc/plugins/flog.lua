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
		{ "<leader>gg", "<CMD>Flog -all<CR>" },
		{ "<leader>gb", "<CMD>Telescope git_branches<CR>" },
	},
}
