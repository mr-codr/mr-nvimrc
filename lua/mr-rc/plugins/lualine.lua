return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
			},
			sections = {
				-- empty table to remove de defaults
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						newfile_status = true,
						symbols = {
							modified = "●",
							readonly = "(readonly)",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "branch" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
