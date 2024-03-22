return require("telescope").register_extension({
	setup = function() end,
	exports = {
		wt_create = require("worktrees.wt_create").wt_create,
	},
})
