local normalizeSep = require("mr-rc.util.normalize_sep").normalize
local configPath = vim.fn.stdpath("config")
local pluginPath = normalizeSep(configPath .. "/lua/mr-rc/plugins/local/path")

return {
	dir = pluginPath,
	cmd = { "Path" },
	dependencies = { "nvim-lua/plenary.nvim" },
}
