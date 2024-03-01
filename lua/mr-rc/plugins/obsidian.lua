return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "C:/mr-vault",
			},
		},
		mappings = {
			["gd"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ck"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},
		disable_frontmatter = true,
		note_id_func = function(title)
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					title = title .. string.char(math.random(65, 90))
				end
			end
			return title
		end,
		ui = {
			enable = false,
		},
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart("start " .. url) -- Windows
			-- vim.fn.jobstart({ "open", url }) -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
		end,
	},
}
