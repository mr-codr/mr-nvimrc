return require("telescope").register_extension({
	setup = function() end,
	exports = {
		wt_switch = require("worktrees.wt_switch").wt_switch,
	},
})
