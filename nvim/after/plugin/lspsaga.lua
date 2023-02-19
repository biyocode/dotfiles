local saga = require("lspsaga")
saga.setup({
    ui = {border = "rounded"},
    lightbulb = {enable = false, enable_in_insert = false},
    symbol_in_winbar = {enable = false, folder_level = 0, show_file = false}
})
local opts = {noremap = true, silent = true}
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)

vim.diagnostic.config({
    float = {focusable = false, focus = false},
    virtual_text = false
})

vim.cmd [[autocmd CursorHold * Lspsaga show_cursor_diagnostics ++unfocus ]]
