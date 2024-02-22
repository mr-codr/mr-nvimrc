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
vim.opt.foldlevel = 1
-- override specific filetype options
-- markdown
vim.g.markdown_folding = 1
