-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-fugitive'

  use {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
	  requires = {
      {'nvim-lua/plenary.nvim'}
    },
  }

  use ('vim-airline/vim-airline')
  use ('vim-airline/vim-airline-themes')

  use ('mbbill/undotree')
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use ('theprimeagen/harpoon')

  use ('lewis6991/gitsigns.nvim')

  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require("noice").setup({})
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = 'v3.x',
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- show hidden files
          },
        },
      })
    end
  }

  -- LSP Zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
    },
  }

  -- Help with motions
  use({
    "tris203/precognition.nvim",
    config = function()
      require("precognition").setup()
    end
  })
end)
