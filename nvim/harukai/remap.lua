vim.g.mapleader = " "

-- Open project folder view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Split window movement
vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Right>", "<C-w>l")

-- Jump movement
vim.keymap.set("n", "<A-c>", ":clearjumps<CR>") -- clear
vim.keymap.set("n", "<A-n>", ":bnext<CR>") -- next
vim.keymap.set("n", "<A-b>", ":bprev<CR>") -- prev
vim.keymap.set("n", "<A-q>", ":bd<CR>") -- quit

-- Makes shift+j not move cursor to the end
vim.keymap.set("n", "J", "mzJ`z")

-- nnoremap <silent> <C-l> :nohl<CR><C-l>
-- vim.keymap.set("n", "<C-l>", vim.cmd(":nohl<CR><C-l>"))

-- Visual Mode: Move blocks of lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

vim.keymap.set("n", "<leader>e{", "bcw{}<ESC>P")
vim.keymap.set("n", "<leader>e[", "bcw[]<ESC>P")
vim.keymap.set("n", "<leader>e<", "bcw<><ESC>P")
vim.keymap.set("n", "<leader>e(", "bcw()<ESC>P")
vim.keymap.set("n", "<leader>e'", "bcw''<ESC>P")
vim.keymap.set("n", "<leader>e\"", "bcw\"\"<ESC>P")
vim.keymap.set("n", "<leader>e`", "bcw``<ESC>P")

vim.keymap.set("n", "<leader>E{", "bcW{}<ESC>P")
vim.keymap.set("n", "<leader>E[", "bcW[]<ESC>P")
vim.keymap.set("n", "<leader>E<", "bcW<><ESC>P")
vim.keymap.set("n", "<leader>E'", "bcW''<ESC>P")
vim.keymap.set("n", "<leader>E\"", "bcW\"\"<ESC>P")
vim.keymap.set("n", "<leader>E`", "bcW``<ESC>P")

-- Rename in file only
vim.keymap.set("n", "<leader>r",
               "/<left><left><C-r><C-w><CR>:%s///g<Left><Left>")

-- Janky rename ALL (strict match)
-- vim.keymap.set("n", "<leader>R",
--                ":let @s=expand('<cword>') <CR> <BAR> :Grepper -cword -noprompt<CR> <BAR> :cfdo %s/<C-r>s//g | update <BAR> <left><left><left><left><left><left><left><left><left><left><left><left><left><left>")
