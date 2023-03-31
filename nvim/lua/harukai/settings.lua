-- Vim sets and globals
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.mouse = "nvi"
vim.opt.clipboard = "unnamedplus" -- Able to yank and paste crap from anywhere
vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true -- Current line tracking
vim.opt.number = true -- Current line number display

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.signcolumn = "no"
vim.opt.scrolloff = 8

-- Indenting
-- vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"typescriptreact", "javascript", "css", "html", "yaml", "json"},
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2"
})

vim.g.grepper = {tools = {"rg"}} -- This is for replace in project, ripgrep required
vim.opt.wildignore:append{"*/node_modules/*", "*/venv/*"}
vim.opt.path:append{"**"} -- find files down subfolders
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"
