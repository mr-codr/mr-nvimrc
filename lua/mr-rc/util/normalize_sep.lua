local sep = require("mr-rc.util.sep")

local M = {}

function M.normalize(path)
	local reversedSep
	if sep == "/" then
		reversedSep = [[\]]
	else
		reversedSep = "/"
	end
	return string.gsub(path, reversedSep, sep)
end

return M
