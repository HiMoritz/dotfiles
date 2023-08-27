require("lazy").setup({
	{	
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
	{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
	{ "theprimeagen/harpoon", lazy = false},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
})
