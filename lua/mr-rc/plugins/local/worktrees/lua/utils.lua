local path = require("mr-rc.util.path")
local Path = require("plenary.path")

local M = {}

M.isPath = function(value)
	local index = value:find("worktree", 1, true)
	return index == 1
end

M.getPath = function(value)
	value = value:sub(10)
	return path.normalize_sep(value)
end

M.getShortPath = function(value, base_dir)
	local absPath = M.getPath(value)
	if base_dir == nil then
		return absPath
	end

	return Path:new(absPath):make_relative(base_dir)
end

M.isHash = function(value)
	local index = value:find("HEAD", 1, true)
	return index == 1
end

M.getHash = function(value)
	return value:sub(6)
end

M.isBranch = function(value)
	local index = value:find("branch", 1, true)
	return index == 1
end

M.getBranch = function(value)
	return value:sub(19)
end

M.format = function(worktree)
	local shotHash = worktree.hash:sub(1, 8)
	return worktree.shortPath .. " [" .. shotHash .. "]"
end

return M
