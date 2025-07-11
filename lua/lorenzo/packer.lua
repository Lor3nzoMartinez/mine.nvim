-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'scottmckendry/cyberdream.nvim'
  use 'theprimeagen/harpoon'
  use 'lewis6991/gitsigns.nvim'
  use 'github/copilot.vim'

  -- git conflict tools
  use {
    'akinsho/git-conflict.nvim', 
    tag = "*", 
    config = function()
      require('git-conflict').setup({
        default_mappings = true,
        default_commands = true,
      })
    end
  }

  -- Auto-session management
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({})
    end
  }

  -- Tree sitter
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

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

  -- Noice with notify
  use {
    'rcarriga/nvim-notify',
    tag = 'v3.14.0',
  }

  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require("noice").setup({})
    end
  }

  -- Lua-line with custom theme
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

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
	  requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  -- Neo-tree craziness
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = 'v3.x',
    requires = { 
      'saifulapm/neotree-file-nesting-config', -- add plugin as dependency. no need any other config or setup call
    },
    config = function()
      require("neo-tree").setup({
        sources = {
          "filesystem",
          "buffers",
          "git_status",
        },
        buffers = {
          show_unloaded = true,
          group_empty_dirs = false,
          follow_current_file = true,
        },
        nesting_rules = require('neotree-file-nesting-config').nesting_rules,
        hide_root_node = true,
        retain_hidden_root_indent = true,
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = '',
            expander_expanded = '',
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          filtered_items = {
            show_hidden_count = false,
            never_show = {
              '.DS_Store',
            },
          },
          hijack_netrw_behavior = "open_current",
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
end)
