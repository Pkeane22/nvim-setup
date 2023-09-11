-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-fzy-native.nvim' } }
    }
    --    use({
    --        'rose-pine/neovim',
    --        as = 'rose-pine',
    --        config = function()
    --            vim.cmd('colorscheme rose-pine')
    --        end
    --    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    --use({
    --    "folke/tokyonight.nvim",
    --    vim.cmd [[colorscheme tokyonight-night]]
    --})

    use { "catppuccin/nvim", as = "catppuccin",
    }

    use "hrsh7th/nvim-cmp" --completion
    if vim.loop.os_uname().sysname == "Windows_NT" then
        use { 'tzachar/cmp-tabnine', after = "nvim-cmp", run = 'powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp' }
    else
        use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    end


    use { 'mfussenegger/nvim-dap' }
end)
