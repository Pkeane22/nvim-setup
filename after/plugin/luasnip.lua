local luasnip = require('luasnip')
local config_path = vim.fn.stdpath("config")
local snippets_path = config_path .. "/snippets"

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_lua").load({paths = snippets_path})
require('luasnip').log.set_loglevel('debug')

luasnip.setup({
    enable_autosnippets = true,
})

vim.cmd("command! LuaSnipEdit :lua require(\"luasnip.loaders\").edit_snippet_files()")
