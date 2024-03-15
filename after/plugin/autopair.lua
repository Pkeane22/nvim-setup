local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({
    fast_wrap = {
      map = '<A-e>',
      chars = { '{', '[', '(', '"', "'", "$" },
      -- pattern = [=[[%'%"%>%]%)%}%,]]=],
      -- end_key = '$',
      -- keys = 'qwertyuiopzxcvbnmasdfghjkl',
      -- check_comma = true,
      -- highlight = 'Search',
      -- highlight_grey='Comment'
    },
})
-- npairs.add_rule(Rule("<",">"))
npairs.add_rule(Rule("$$","$$","tex"))
npairs.add_rule(Rule("$","$","tex"))

require('ultimate-autopair').setup({
    space2 = { enabled = true },
    tabout = { enabled = true },
    close = { enabled = true },
    fastwarp = {
        multi = true,
        { faster = true, map = '<C-A-e>', cmap = '<C-A-e>' },
    },
    -- config = {
    --     {'<','>'}
    -- },
})
