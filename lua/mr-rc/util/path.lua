local slice_array = require("mr-rc.util.slice-array")
local M = {}

M.sep = (function()
	return package.config:sub(1, 1) == "\\" and "\\" or "/"
end)()

M.normalize_sep = function(path)
	local reversed_sep = M.sep == "/" and "\\" or "/"
	return string.gsub(path, reversed_sep, M.sep)
end

M.split = function(path)
	path = M.normalize_sep(path)
	local path_section_pattern = "([^" .. M.sep .. "]+)"
	local result = {}
	for path_section in string.gmatch(path, path_section_pattern) do
		table.insert(result, path_section)
	end
	return result
end

M.diff = function(path1, path2)
	local splitted_path1 = M.split(path1)
	local splitted_path2 = M.split(path2)

	local equalList = {}
	local diffList
	for index, section1 in ipairs(splitted_path1) do
		local section2 = splitted_path2[index]
		if section1 == section2 then
			table.insert(equalList, section1)
		else
			diffList = slice_array(splitted_path1, index)
			break
		end
	end

	local diff = diffList == nil and "" or table.concat(diffList, M.sep)
	local equal = table.concat(equalList, M.sep)
	return diff, equal
end

return M
