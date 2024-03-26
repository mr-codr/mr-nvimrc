local path = require("mr-rc.util.path")
---Gets the current worktree root directory
return function()
	local command = "git rev-parse --show-toplevel"
	local handle = io.popen(command)

	if handle == nil then
		print("could not run command:" .. command)
		return
	end

	local wt_root = handle:read("l")
	handle:close()

	wt_root = path.normalize_sep(wt_root)
	return wt_root
end
