local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "black" },
        latex = { "latexindent" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        assembly = { "asmfmt" },
        verilog = { "verible" },
    },
    formatters = {
        prettier = {
            inherit = true,
            prepend_args = {
                "--tab-width", "4",
                "--bracket-same-line", "false" },
        },
        black = {
            inherit = true,
            prepend_args = {
                "--line-length", "79",
            },
        },
        verible = {
            inherit = true,
            perpend_args = {
                "--rules", "-no-tabs,-no-trailing-spaces",
            },
        },
    },
})

vim.keymap.set("n", "<leader>f", function()
    conform.format({ async = true, lsp_fallback = true })
end)
