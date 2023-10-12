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


	"hrsh7th/nvim-cmp", --completion
	{ 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },


	{ 'mfussenegger/nvim-dap' },
}

require("lazy").setup(plugins, opts)
