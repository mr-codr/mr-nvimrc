local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

function M.wt_create()
	local opts = {}
	opts.attach_mappings = function(prompt_bufnr, _)
		actions.select_default:replace(function()
			actions.close(prompt_bufnr)
			local selection = action_state.get_selected_entry()
			if selection == nil then
				return
			end
			print(vim.inspect(selection))
		end)
		return true
	end

	require("telescope.builtin").git_branches(opts)
end

return M
