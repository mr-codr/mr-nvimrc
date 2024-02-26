return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = { "VeryLazy" },
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
