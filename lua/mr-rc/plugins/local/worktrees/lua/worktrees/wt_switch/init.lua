local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local getWtEntries = require("worktrees.wt_switch.get-wt-entry")
local wtEntryMaker = require("worktrees.wt_switch.wt-entry-maker")

local M = {}

function M.wt_switch(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Worktrees",
			finder = finders.new_table({
				results = getWtEntries(),
				entry_maker = wtEntryMaker,
			}),
			sorter = config.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection == nil then
						return
					end

					local selectedWtPath = selection.value.path
					local currentBuf = vim.api.nvim_get_current_buf()
					local isModified = vim.api.nvim_buf_get_option(currentBuf, "modified")
					if isModified then
						print("modified buffer. Not changing directory")
						return
					end

					local currentBufPath = vim.api.nvim_buf_get_name(currentBuf)
					local currentBufRelativePath = Path:new(currentBufPath):make_relative()
					local currentBufPathInSelectedWt = Path:new(selectedWtPath, currentBufRelativePath)

					vim.api.nvim_buf_delete(currentBuf, {})
					vim.cmd(":cd " .. selectedWtPath)
					if Path:new(currentBufPathInSelectedWt):exists() then
						local cursorPos = vim.api.nvim_win_get_cursor(0)
						vim.cmd(":edit " .. currentBufPathInSelectedWt.filename)
						vim.api.nvim_win_set_cursor(0, cursorPos)
					else
						local has_nvimtree, api = pcall(require, "nvim-tree.api")
						if has_nvimtree then
							api.tree.open({ current_window = true })
						end
					end
					vim.cmd(":clearjumps")
				end)
				return true
			end,
		})
		:find()
end

return M
