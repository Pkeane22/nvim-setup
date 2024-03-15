local lsp_zero = require('lsp-zero')
-- Since catppuccin requires cmp, and catppuccin is called before lsp_zero
lsp_zero.extend_lspconfig()

local lspkind = require('lspkind')
local luasnip = require("luasnip")

-- local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    luasnip = "[Snip]",
    -- cmp_tabnine = "[TN]",
    path = "[Path]",
}

local compare = require('cmp.config.compare')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp:rust_analyzer' },
        { name = 'cmp_tabnine' },
        -- { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        -- { name = 'ultisnip' },
    },
    formatting = {
        format = function(entry, vim_item)
            -- if you have lspkind installed, you can use it like
            -- in the following line:
            vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
            vim_item.menu = source_mapping[entry.source.name]
            -- if entry.source.name == "cmp_tabnine" then
            --     local detail = (entry.completion_item.labelDetails or {}).detail
            --     vim_item.kind = ""
            --     if detail and detail:find('.*%%.*') then
            --         vim_item.kind = vim_item.kind .. ' ' .. detail
            --     end
            --
            --     if (entry.completion_item.data or {}).multiline then
            --         vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
            --     end
            -- end
            local maxwidth = 80
            vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
            return vim_item
        end,
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            -- require('cmp_tabnine.compare'),
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<\\>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-\\>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    }),
})

-- local types = require 'luasnip.util.types'
-- require('luasnip').setup {
--     history = true,
--     delete_check_events = 'TextChanged',
--     -- Display a cursor-like placeholder in unvisited nodes
--     -- of the snippet.
--     ext_opts = {
--         [types.insertNode] = {
--             unvisited = {
--                 virt_text = { { '|', 'Conceal' } },
--                 virt_text_pos = 'inline',
--             },
--         },
--     },
-- }

-- require('cmp_tabnine').setup({
--     max_lines = 1000,
--     max_num_results = 20,
--     sort = true,
--     run_on_every_keystroke = true,
--     snippet_placeholder = '..',
--     ignored_file_types = {
--         -- default is not to ignore
--         -- uncomment to ignore in lua:
--         -- lua = true
--     },
--     show_prediction_strength = false
-- })

require("rust-tools").setup({
	server = {
		capabilities = capabilities,
		on_attach = lsp_attach,
	}
})
