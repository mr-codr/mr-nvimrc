local u = require("utils")

--- @param base_dir string|nil a base directory to build the `shortPath` of the entries
return function(base_dir)
	--- expected entry table format:
	--- ```lua
	--- {
	---    "worktree C:/Users/me/my_project",
	---    "HEAD 5eafc128720001956318813f1ad0d1f70f03d976",
	---    "branch refs/heads/master",
	--- },
	--- ```
	--- result:
	--- ```lua
	--- {
	---   value = {
	---     path = 'C:\\Users\\me\\my_project',
	---     shortPath = 'my_project', -- if base_dir is "C:\\Users\\me"
	---     hash = '5eafc128720001956318813f1ad0d1f70f03d976',
	---     branch = 'master',
	---   },
	---   display = 'master [5eafc12]',
	---   ordinal = 'master'
	---  },
	--- ```
	---@param entry table
	---@return table
	return function(entry)
		local worktree = {}
		for _, line in pairs(entry) do
			if u.isPath(line) then
				worktree.path = u.getPath(line)
				worktree.shortPath = u.getShortPath(line, base_dir)
			elseif u.isHash(line) then
				worktree.hash = u.getHash(line)
			elseif u.isBranch(line) then
				worktree.branch = u.getBranch(line)
			end
		end

		return {
			value = worktree,
			display = u.format(worktree),
			ordinal = worktree.branch,
		}
	end
end
