local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({})
npairs.add_rule(Rule("<",">"))


require('ultimate-autopair').setup({
    space2 = { enabled = true },
    tabout = { enabled = true },
    close = { enabled = true },
    fastwarp = {
        multi = true,
        { faster = true, map = '<C-A-e>', cmap = '<C-A-e>' },
    },
    config = {
        {'<','>'}
    },
})
