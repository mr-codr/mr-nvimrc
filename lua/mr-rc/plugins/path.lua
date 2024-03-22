local localPlugPath = require("mr-rc.util.local-plugins-path")

return {
	dir = localPlugPath .. "path",
	name = "mr-path",
	cmd = { "Path" },
	dependencies = { "nvim-lua/plenary.nvim" },
}
