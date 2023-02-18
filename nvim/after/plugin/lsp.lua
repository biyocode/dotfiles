local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local opts = {noremap = true, silent = true, buffer = bufnr}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- buf_set_keymap("n", "gd", "vim.lsp.buf.definition", opts)
    -- buf_set_keymap("n", "gi", "vim.lsp.buf.implementation", opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    lua_ls = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    },
    pyright = {},
    tsserver = {
        filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
        cmd = {"typescript-language-server", "--stdio"}
    },
    tailwindcss = {},
    rust_analyzer = {}
}

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {ensure_installed = vim.tbl_keys(servers)}
mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name]
        }
    end
}
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({bufnr=bufnr}, {focus=false, focusable=false})]]
