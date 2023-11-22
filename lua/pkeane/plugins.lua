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
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		'nvim-telescope/telescope-fzy-native.nvim'  }
	},

	{'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
	'nvim-treesitter/playground',
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },             -- Required
			{ 'williamboman/mason.nvim' },           -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },     -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },     -- Required
		}
	},

	{ "catppuccin/nvim", name = "catppuccin"},

    { "hrsh7th/nvim-cmp" }, --completion
    { "hrsh7th/cmp-nvim-lsp" },

    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/vim-vsnip" },

	{ 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },


	{ 'mfussenegger/nvim-dap', dependencies = {"rcarriga/nvim-dap-ui","williamboman/mason-lspconfig.nvim"} },
	{ 'rcarriga/nvim-dap-ui' },
    { 'simrat39/rust-tools.nvim' },

    { 'onsails/lspkind.nvim' },
    { 'puremourning/vimspector' },
    { 'altermo/ultimate-autopair.nvim', event={'InsertEnter','CmdlineEnter'}, branch='v0.6',},

    { 'windwp/nvim-ts-autotag' },
    { 'nvim-lualine/lualine.nvim' },
}

require("lazy").setup(plugins, opts)
