local lint = require("lint")

lint.linters_by_ft = {
    python = { "pylint" },
}

lint.linters.pylint.args = {
    '-f',
    'json',
    '--disable=E0401,W0102,C0114,C0115,C0116',
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set("n", "<leader>l", function()
    lint.try_lint()
end)
