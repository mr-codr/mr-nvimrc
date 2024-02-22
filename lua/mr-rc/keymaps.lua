-- leader
vim.keymap.set("", "<space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- speed up vertical scroll
vim.keymap.set("n", "<c-e>", "2<c-e>")
vim.keymap.set("n", "<c-y>", "2<c-y>")
-- horizontal scroll
vim.keymap.set("n", "<c-l>", "20zl")
vim.keymap.set("n", "<c-h>", "20zh")

-- split windows
vim.keymap.set("n", "<leader>sj", ":split<cr>")
vim.keymap.set("n", "<leader>sk", ":split<cr><c-w>k")
vim.keymap.set("n", "<leader>sl", ":vsplit<cr>")
vim.keymap.set("n", "<leader>sh", ":vsplit<cr><c-w>h")

-- resize windows
vim.keymap.set("n", "<c-up>", ":resize +2<cr>")
vim.keymap.set("n", "<c-down>", ":resize -2<cr>")
vim.keymap.set("n", "<c-left>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<c-right>", ":vertical resize +2<cr>")

-- exit insert mode
vim.keymap.set("i", "jk", "<esc>")

-- indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move text
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv")
-- vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
-- vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")

-- prevents yanking what pasting has overwitten
vim.keymap.set("v", "p", '"_dP')

-- yank to outter world register
vim.keymap.set("n", "<leader>y", '"+yy')
vim.keymap.set("n", "<leader>p", '"+P')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- telescope
vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")
