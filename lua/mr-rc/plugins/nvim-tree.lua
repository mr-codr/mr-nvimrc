return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		local function my_on_attach(buffer)
			local api = require("nvim-tree.api")
			local options = { buffer = buffer, noremap = true, silent = true, nowait = true }
			-- default mappings
			api.config.mappings.default_on_attach(buffer)
			-- custom mappings
			vim.keymap.set("n", "l", api.node.open.preview, options)
			vim.keymap.set("n", "h", api.node.navigate.parent_close, options)
			vim.keymap.set("n", "v", api.node.open.vertical, options)
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			view = {
				float = {
					enable = true,
					quit_on_focus_loss = false,
					open_win_config = {
						col = 100000,
					},
				},
				centralize_selection = true,
				cursorline = true,
				side = "left",
				preserve_window_proportions = false,
				signcolumn = "yes",
				width = {},
			},
			renderer = {
				highlight_modified = "none",
				highlight_clipboard = "name",
				highlight_git = "name",
				highlight_diagnostics = "none",
				highlight_opened_files = "none",
				highlight_bookmarks = "none",
				icons = {
					padding = " ",
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						modified = true,
						git = false,
						diagnostics = true,
						bookmarks = true,
					},
					modified_placement = "after",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					symlink_arrow = " ➛ ",
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						folder = {
							-- arrow_closed = "",
							-- arrow_open = "",
							-- default = "",
							-- open = "",
							-- empty = "",
							-- empty_open = "",
							-- symlink = "",
							-- symlink_open = "",
							arrow_closed = "",
							arrow_open = "",
							default = "+",
							open = "-",
							empty = " ",
							empty_open = " ",
							symlink = "",
							symlink_open = "",
						},
					},
				},
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			git = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				disable_for_dirs = {},
				timeout = 400,
				cygwin_support = false,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				no_bookmark = false,
				custom = {},
				exclude = {},
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			system_open = {
				cmd = "",
				args = {},
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {},
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "shadow",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = true,
					eject = true,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
			},
			tab = {
				sync = {
					open = false,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.WARN,
				absolute_path = true,
			},
			help = {
				sort_by = "key",
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
					default_yes = false,
				},
			},
			experimental = {},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})
	end,
}
