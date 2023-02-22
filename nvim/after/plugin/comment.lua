-- Repo: https://github.com/numToStr/Comment.nvim
local commentft = require("Comment.ft")
commentft.set("typescriptreact", "{/* %s */}")
require("Comment").setup({
    toggler = {line = "<leader>cc"},
    opleader = {line = "<leader>cc"}
})
