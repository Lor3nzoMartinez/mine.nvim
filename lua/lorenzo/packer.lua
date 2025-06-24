-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  use {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
	  requires = {
      {'nvim-lua/plenary.nvim'}
    },
  }

  use ('scottmckendry/cyberdream.nvim')
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
      require("noice").setup({
        -- custom config
      })
    end
  }

 use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("lualine").setup({
        options = {
          theme = 'cyberdream',
          section_seperators = '',
          component_seperators = '',
          icons_enabled = true,
        },
        requires = {
          'nvim-tree/nvim-web-devicons',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end
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
  use {
    "tris203/precognition.nvim",
    -- event = "VeryLazy",
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      highlightColor = { link = "Comment" },
      hints = {
        Caret = { text = "^", prio = 2 },
        Dollar = { text = "$", prio = 1 },
        MatchingPair = { text = "%", prio = 5 },
        Zero = { text = "0", prio = 1 },
        w = { text = "w", prio = 10 },
        b = { text = "b", prio = 9 },
        e = { text = "e", prio = 8 },
        W = { text = "W", prio = 7 },
        B = { text = "B", prio = 6 },
        E = { text = "E", prio = 5 },
      },
      gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      },
      disabled_fts = {
        "startify",
      },
    },
  }
end)
