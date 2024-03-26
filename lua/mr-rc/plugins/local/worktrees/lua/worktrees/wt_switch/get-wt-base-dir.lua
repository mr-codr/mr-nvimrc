local path = require("mr-rc.util.path")
local u = require("utils")

local function get_entry_path(entry)
	for _, line in ipairs(entry) do
		if u.isPath(line) then
			return u.getPath(line)
		end
	end
end

local function get_base_dir(path1, path2)
	local splitted_path1 = path.split(path1)
	local splitted_path2 = path.split(path2)

	local base_dir_index
	for index, section in ipairs(splitted_path1) do
		if section ~= splitted_path2[index] then
			base_dir_index = index
			break
		end
	end

	if base_dir_index == 1 then
		return nil
	end

	local base_dir = table.concat(splitted_path2, path.sep, 1, base_dir_index - 1)
	return base_dir
end

return function(entry1, entry2)
	if entry1 == nil or entry2 == nil then
		return nil
	end

	local path1 = get_entry_path(entry1)
	local path2 = get_entry_path(entry2)
	local base_dir = get_base_dir(path1, path2)
	return base_dir
end
