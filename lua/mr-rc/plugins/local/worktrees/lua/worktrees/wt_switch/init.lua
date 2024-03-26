local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local get_wt_entries = require("worktrees.wt_switch.get-wt-entries")
local wt_entry_maker_fac = require("worktrees.wt_switch.wt-entry-maker-fac")
local get_wt_base_dir = require("worktrees.wt_switch.get-wt-base-dir")
local get_wt_root = require("worktrees.wt_switch.get-wt-root")
local path = require("mr-rc.util.path")

local M = {}

local function change_working_dir(selected_wt_path, wt_root)
	local current_working_dir = vim.fn.getcwd()
	local diff = path.diff(current_working_dir, wt_root)
	local new_dir
	if diff ~= "" then
		new_dir = Path:new(selected_wt_path, diff).filename
	else
		new_dir = selected_wt_path
	end
	vim.api.nvim_set_current_dir(new_dir)
end

local function get_buf_in_selected_wt(selected_wt_path, wt_root)
	local current_buf = vim.api.nvim_get_current_buf()
	local buf_path = vim.api.nvim_buf_get_name(current_buf)
	local buf_relative_path = Path:new(buf_path):make_relative(wt_root)
	local buf_path_in_selected_wt = Path:new(selected_wt_path, buf_relative_path)
	return buf_path_in_selected_wt.filename
end

local function change_editing_buffer(selected_wt_path, wt_root)
	local buf_path_in_selected_wt = get_buf_in_selected_wt(selected_wt_path, wt_root)
	if Path:new(buf_path_in_selected_wt):exists() then
		local cursorPos = vim.api.nvim_win_get_cursor(0)
		vim.cmd(":edit " .. buf_path_in_selected_wt)
		vim.api.nvim_win_set_cursor(0, cursorPos)
	else
		require("nvim-tree.api").tree.open({ current_window = true })
	end
end

function M.wt_switch(opts)
	opts = opts or {}
	local entries = get_wt_entries()
	if entries == nil then
		print("cannot get entries")
		return
	end

	local wt_root = get_wt_root()
	if wt_root == nil then
		print("cannot get worktree root")
		return
	end

	local base_dir = get_wt_base_dir(entries[1], entries[2])
	local wt_entry_marker = wt_entry_maker_fac(base_dir)
	pickers
		.new(opts, {
			prompt_title = "Worktrees",
			finder = finders.new_table({
				results = entries,
				entry_maker = wt_entry_marker,
			}),
			sorter = config.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection == nil then
						return
					end

					local selected_wt_path = selection.value.path
					local current_buf = vim.api.nvim_get_current_buf()
					local filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")
					local is_modified = vim.api.nvim_buf_get_option(current_buf, "modified")
					if is_modified then
						print("modified buffer. Not changing directory")
						return
					end

					change_working_dir(selected_wt_path, wt_root)
					if filetype ~= "NvimTree" then
						change_editing_buffer(selected_wt_path, wt_root)
					end

					vim.cmd(":clearjumps")
				end)
				return true
			end,
		})
		:find()
end

return M
