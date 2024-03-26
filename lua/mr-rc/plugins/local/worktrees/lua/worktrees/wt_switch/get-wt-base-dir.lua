local path = require("mr-rc.util.path")
local u = require("utils")

local function get_entry_path(entry)
	for _, line in ipairs(entry) do
		if u.isPath(line) then
			return u.getPath(line)
		end
	end
end

return function(entry1, entry2)
	if entry1 == nil or entry2 == nil then
		return nil
	end

	local path1 = get_entry_path(entry1)
	local path2 = get_entry_path(entry2)
	local _, equal = path.diff(path1, path2)
	local base_dir = equal
	return base_dir
end
