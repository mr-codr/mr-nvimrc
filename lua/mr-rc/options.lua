vim.cmd("lang en_US")
-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
-- scroll
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- vim.opt.textwidth = 92 -- só pra markdown
-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true
-- backup
vim.opt.swapfile = false
vim.opt.undofile = true
-- colorscheme (?)
vim.opt.termguicolors = true
-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 10
-- vim.opt.foldenable = true
-- vim.opt.foldlevelstart = 99
-- markdown
vim.g.markdown_folding = 1

local searchHlAugroup = vim.api.nvim_create_augroup("SearchHlAuGroup", { clear = true })
vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
	group = searchHlAugroup,
	pattern = { "/,?" },
	callback = function()
		vim.opt.hlsearch = true
	end,
})

vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
	group = searchHlAugroup,
	pattern = { "/,?" },
	callback = function()
		vim.opt.hlsearch = false
	end,
})

local markdownAugroup = vim.api.nvim_create_augroup("MarkdownAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = markdownAugroup,
	pattern = { "markdown" },
	callback = function()
		-- vim.opt_local.foldmethod = "syntax"
		vim.opt.sidescrolloff = 0
		vim.opt.textwidth = 90
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})
