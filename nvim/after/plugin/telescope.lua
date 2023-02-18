local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', function()
    -- Handling error to output 1 line instead of several
    if pcall(builtin.git_files) then
    else
        print("Not a git project. Try running git init in root.")
    end
end)
vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({no_ignore = false, hidden = true})
end)
vim.keymap.set('n', '<leader>ft', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
