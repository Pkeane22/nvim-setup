local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "black" },
        latex = { "latexindent" }
    },
})

vim.keymap.set("n", "<leader>f", function()
    conform.format({ async = true, lsp_fallback = true })
end)
