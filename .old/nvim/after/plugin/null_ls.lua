local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.autopep8, null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.rustfmt
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(f_client)
                            return f_client.name == "null-ls"
                        end
                    })
                end
            })
        end
    end
})

vim.api.nvim_create_user_command("StopLspFormatting", function()
    vim.api.nvim_clear_autocmds({group = augroup, buffer = 0})
end, {nargs = 0})
