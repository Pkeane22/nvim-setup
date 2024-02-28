require("neo-tree").setup({
    enable_diagnostics = true,
    enable_git_status = true,

    window = {
        position = "float",
        mappings = {
            ['C'] = 'close_all_subnodes',
            ['Z'] = 'expand_all_nodes',

        },
    },

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
})

