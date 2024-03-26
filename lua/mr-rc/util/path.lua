local M = {}

M.sep = (function()
	return package.config:sub(1, 1) == "\\" and "\\" or "/"
end)()

function M.normalize_sep(path)
	local reversed_sep = M.sep == "/" and "\\" or "/"
	return string.gsub(path, reversed_sep, M.sep)
end

function M.split(path)
	path = M.normalize_sep(path)
	local path_section_pattern = "([^" .. M.sep .. "]+)"
	local result = {}
	for path_section in string.gmatch(path, path_section_pattern) do
		table.insert(result, path_section)
	end
	return result
end

return M
