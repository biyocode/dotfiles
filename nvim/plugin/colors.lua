function AllColors(color)
    color = color or "catppuccin"
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {nvimtree = true, telescope = true}
    })
    vim.cmd.colorscheme(color)
    -- ~/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/themes
    vim.g.airline_theme = "navarch" -- statusbar theme

    -- vim.api.nvim_set_hl(0, "Normal", {bg = "none", ctermbg="none"}) -- Transparent bg
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none", ctermbg="none"}) -- Transparent floating bg
end

AllColors() -- run this to reapply colors if changed
