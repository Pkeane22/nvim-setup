local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins =
{

	{'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'BurntSushi/ripgrep' },
		{ 'nvim-telescope/telescope-fzy-native.nvim' },
        { 'benfowler/telescope-luasnip.nvim' },
     }
	},

	{'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
    { 'ThePrimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },             -- Required
			{ 'williamboman/mason.nvim' },           -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },     -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip',       -- Required
                build = 'make install_jsregexp'
            },
		}
	},

	{ "catppuccin/nvim", name = "catppuccin"},

    -- { "hrsh7th/nvim-cmp" }, --completion
    -- { "hrsh7th/cmp-nvim-lsp" },

    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },

    { 'saadparwaiz1/cmp_luasnip' },
    { "rafamadriz/friendly-snippets" },
    { 'SirVer/ultisnips' },

    { 'stevearc/conform.nvim' },
    { 'mfussenegger/nvim-lint' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

	{ 'mfussenegger/nvim-dap', dependencies = {"rcarriga/nvim-dap-ui","williamboman/mason-lspconfig.nvim"} },
	{ 'rcarriga/nvim-dap-ui', dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { 'simrat39/rust-tools.nvim' },

    { 'onsails/lspkind.nvim' },
    { 'windwp/nvim-autopairs', event = "InsertEnter" },
    { 'altermo/ultimate-autopair.nvim', event={'InsertEnter','CmdlineEnter'}, branch='v0.6',},

    { 'windwp/nvim-ts-autotag' },
    { 'nvim-lualine/lualine.nvim' },
    { 'numToStr/Comment.nvim' },

    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x', dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim', -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }},

    { 'nvim-java/nvim-java', },
    {
        'barrett-ruth/live-server.nvim',
        build = 'npm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },
    { 'lervag/vimtex' },
    { 'KeitaNakamura/tex-conceal.vim' },
    { 'barreiroleo/ltex-extra.nvim' },
    { 'mfussenegger/nvim-dap-python' },

    { "3rd/image.nvim", opts = {}, build = false, },
}

require("lazy").setup(plugins, opts)
