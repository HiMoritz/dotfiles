require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, 'nvim-tree/nvim-web-devicons' },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
            }
          }
        }
      })

      telescope.load_extension("fzf")
    end
  },
  { "catppuccin/nvim",                 name = "catppuccin", priority = 1000,    lazy = false },
  { "nvim-treesitter/nvim-treesitter", lazy = false,        build = ":TSUpdate" },
  { "theprimeagen/harpoon",            lazy = false },
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
  {
    -- amongst your other plugins
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    -- or
    { 'akinsho/toggleterm.nvim', version = "*", opts = { --[[ things you want to change go here]] } }
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "stevearc/dressing.nvim",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      print('should be loaded')
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  }
})
