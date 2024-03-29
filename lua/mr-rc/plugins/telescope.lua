return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"mr-worktrees",
	},
	lazy = false,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fw", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>wc", "<cmd>Telescope wt_create<cr>" },
		{ "<leader>ws", "<cmd>Telescope wt_switch<cr>" },
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				path_display = { truncate = 5 },
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						preview_cutoff = 25,
					},
				},

				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-h>"] = actions.select_horizontal,
					},

					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				find_files = {
					-- default find_command for rg: { "rg", "--files", "--color", "never" },
					-- source: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
					find_command = function(opts)
						if 1 == vim.fn.executable("rg") then
							return {
								"rg",
								"--files",
								"--color",
								"never",
								"--hidden", -- includes hidden files
								"--iglob", -- filters with glob pattern
								"!{.git,.obsidian}", -- excludes .git and .obsidian
							}
						else
							return require("telescope.builtin").find_files(opts)
						end
					end,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("wt_create")
		telescope.load_extension("wt_switch")
	end,
}
