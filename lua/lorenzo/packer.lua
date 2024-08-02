-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('scottmckendry/cyberdream.nvim')
  use ('vim-airline/vim-airline') 
  use ('vim-airline/vim-airline-themes') 


  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use ('theprimeagen/harpoon')

  use ('lewis6991/gitsigns.nvim')
end)
