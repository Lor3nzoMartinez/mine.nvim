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
  use 'tpope/vim-fugitive'

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
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

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

  -- Flash.nvim for search and jump
  use {
    "folke/flash.nvim",
    config = function()
      require("flash").setup({}) -- pass options here if needed

      vim.keymap.set({ "n", "x", "o" }, "s", function()
        return require("flash").jump({ search = { mode = "<c-f>" } })
      end, { desc = "Flash", noremap = true, silent = true })
    end,
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
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
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
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            show_hidden_count = false,
            never_show = {
              '.DS_Store',
            },
          },
          hijack_netrw_behavior = "disabled",
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
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
    },
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    tag = 'v1.32.0',
    requires = { 'williamboman/mason.nvim' },
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '',
            package_pending = '',
            package_uninstalled = '',
          },
        },
      })
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'pyright',
          'eslint',
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }


  -- blink auto-complete
  -- use {
  --   'saghen/blink.cmp',
  --   after = 'nvim-cmp',
  --   requires = {
  --     'rafamadriz/friendly-snippets',
  --   },
  --   tag = '1.*',
  --   config = function()
  --     require('blink.cmp').setup({
  --       keymap = { preset = 'default' },
  --       appearance = {
  --         nerd_font_variant = 'mono',
  --       },
  --       completion = {
  --         documentation = {
  --           auto_show = false,
  --         },
  --       },
  --       sources = {
  --         default = { 'lsp', 'path', 'snippets', 'buffer' },
  --       },
  --       fuzzy = {
  --         implementation = "prefer_rust_with_warning",
  --       },
  --     })
  --   end
  -- }
end)
