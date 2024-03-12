-- leader
vim.keymap.set("", "<space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- buffers navigation
vim.keymap.set("n", "<c-l>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<c-h>", "<cmd>bprevious<cr>")

-- keeps search in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- speed up vertical scroll
vim.keymap.set("n", "<c-e>", "2<c-e>")
vim.keymap.set("n", "<c-y>", "2<c-y>")
-- horizontal scroll
-- vim.keymap.set("n", "<c-l>", "20zl")
-- vim.keymap.set("n", "<c-h>", "20zh")

-- split windows
vim.keymap.set("n", "<leader>sj", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>sk", "<cmd>split<cr><c-w>k")
vim.keymap.set("n", "<leader>sl", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>sh", "<cmd>vsplit<cr><c-w>h")

-- resize windows
vim.keymap.set("n", "<c-up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<c-down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<c-left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<c-right>", "<cmd>vertical resize +2<cr>")

-- exit insert mode
vim.keymap.set("i", "jk", "<esc>")

-- indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("x", "<A-j>", "<cmd>move '>+1<cr>gv-gv")
-- vim.keymap.set("x", "<A-k>", "<cmd>move '<-2<cr>gv-gv")

-- prevents yanking what pasting has overwitten
vim.keymap.set("v", "p", '"_dP')

-- yank to outter world register
vim.keymap.set("n", "<leader>y", '"+yy')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- telescope
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>ff",
-- 	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
-- )
-- vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
