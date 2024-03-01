return {
	"nvim-treesitter/nvim-treesitter",
	-- cond = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.install").compilers = { "clang" }
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"vimdoc",
				"angular",
				"html",
				"css",
				"scss",
				"typescript",
				"javascript",
				"json",
				-- "yaml",
				"xml",
				"csv",
				"dockerfile",
				"gitignore",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			ignore_install = { "" }, -- List of parsers to ignore installing
			autopairs = { enable = true },
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = { "markdown", "markdown_inline" },
			},
			indent = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
