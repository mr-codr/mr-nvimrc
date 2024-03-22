local Path = require("plenary.path")

local M = {}

function M.printPath()
	local bufPath = vim.api.nvim_buf_get_name(0)
	local path = Path:new(bufPath):make_relative()
	print(path)
end

return M
