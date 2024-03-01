return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = { [[<c-\>]] },
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "float",
			shell = "pwsh",
			float_opts = {
				border = "curved",
				winblend = 0, -- disable transparent
			},
		})
	end,
}
