-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'scottmckendry/cyberdream.nvim'
  use 'rcarriga/nvim-notify'
  use 'theprimeagen/harpoon'
  use 'lewis6991/gitsigns.nvim'

  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Help with motions
  use({
    "tris203/precognition.nvim",
    config = function()
      require("precognition").setup()
    end
  })

  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require("noice").setup({})
    end
  }

  use {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
	  requires = {
      {'nvim-lua/plenary.nvim'}
    },
  }

  use {
    "nvim-treesitter/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup {
        max_lines = 3, -- show up to 3 lines of context
        multiline_threshold = 20,
      }
    end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = 'v3.x',
    requires = { 
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- show hidden files
          },
        },
        window = {
          mappings = {
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
                use_image_nvim = true,
                title = "Neo-tree Preview",
              }
            }
          }
        }
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
end)
