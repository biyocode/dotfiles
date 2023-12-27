local saga = require("lspsaga")
saga.setup({
    ui = {border = "rounded"},
    lightbulb = {enable = false, enable_in_insert = false},
    symbol_in_winbar = {enable = false, folder_level = 0, show_file = false}
})
local opts = {noremap = true, silent = true}
vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++unfocus ++quiet<CR>", opts)
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_type_definition ++unfocus<CR>",
               opts)
vim.keymap.set('n', '<leader>ga', "<cmd>Lspsaga code_action<CR>", opts)

vim.diagnostic.config({
    float = {focusable = false, focus = false},
    virtual_text = false
})

-- vim.cmd [[autocmd CursorHold * Lspsaga show_cursor_diagnostics ++unfocus ]]
vim.cmd [[autocmd CursorHold * Lspsaga show_line_diagnostics ++unfocus ]]
-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false}) ]]
