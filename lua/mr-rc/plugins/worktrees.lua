local localPlugPath = require("mr-rc.util.local-plugins-path")

return {
	dir = localPlugPath .. "worktrees",
	name = "mr-worktrees",
	dependencies = { "nvim-lua/plenary.nvim" },
}
