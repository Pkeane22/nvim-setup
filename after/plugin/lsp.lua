local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "d[", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "d]", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({
})

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'rust_analyzer',
    },

    handlers = {
        lsp_zero.default_setup,
        lua_ls = function ()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
        end,
        ltex = function ()
            lspconfig.ltex.setup({
                on_attach = function(client, bufnr)
                    require('ltex_extra').setup({
                        path = vim.fn.stdpath("config") .. "/spell/",
                    })
                end,
                settings = {
                    ltex = {
                        enabled = { 'bibtex', 'latex', 'markdown' }
                    }
                },
            })
        end,
        verible = function ()
            require('lspconfig').verible.setup({
                cmd = { "verible-verilog-ls", "--rules", "-no-tabs,-no-trailing-spaces", },
            })
        end,
        -- sql = function ()
        --     require('lspconfig').sql.setup({
        --         on_attach = function(client, bufnr)
        --             require('sqls').on_attach(client, bufnr) -- require sqls.nvim
        --           end,
        --           settings = {
        --             sqls = {
        --               connections = {
        --                 {
        --                   driver = 'mssql',
        --                 },
        --               },
        --             },
        --           },
        --     })
        -- end,
    },
})
require("mason-tool-installer").setup({
    ensure_installed = {
        "black",
        "pylint",
    },
})

lsp_zero.set_preferences({
	sign_icons = {}
})

lsp_zero.setup()
