local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require('telescope').setup({})
require('telescope').load_extension('luasnip')
require('telescope').setup {
  extensions = {
    -- ...
    luasnip = {
      search = function(entry)
        return lst.filter_null(entry.context.trigger) .. " " ..
               lst.filter_null(entry.context.name) .. " " ..
               entry.ft .. " " ..
               lst.filter_description(entry.context.name, entry.context.description) ..
               lst.get_docstring(luasnip, entry.ft, entry.context)[1]
      end
    },
     -- ...
  }
}
