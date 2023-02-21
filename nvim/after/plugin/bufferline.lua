require("bufferline").setup({
    options = {mode = "tabs", separator_style = "thin", color_icons = true},
    highlights = {
        -- fill = {fg = "#FFFFFF", bg = "NONE"},
        -- background = {fg = "#FFFFFF", bg = "#533f8e"},
        -- tab = {bg = "#533f8e"}
        -- tab_selected={bg=""}, -- dont touch fg
        -- tab_selected={},
        -- close_button = {},
        -- close_button_visible = {},
        -- close_button_selected = {},
        -- duplicate = {},
        -- duplicate_visible = {},
        -- duplicate_selected = {},
    }
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
