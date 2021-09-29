local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'
  -- LSP and friends
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', branch = '0.5-compat' }
  use 'ray-x/lsp_signature.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'p00f/nvim-ts-rainbow'
  use 'folke/lsp-colors.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'stevearc/aerial.nvim'
  -- Language
  use 'crispgm/nvim-go'
  use 'simrat39/rust-tools.nvim'
  use 'rhysd/vim-go-impl'
  use 'rust-lang/rust.vim'

  -- Theme
  use 'projekt0n/github-nvim-theme'
  use 'folke/tokyonight.nvim'

  -- UI
  use 'kyazdani42/nvim-web-devicons'
  use 'akinsho/nvim-bufferline.lua'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }, 
      { 'nvim-telescope/telescope-fzy-native.nvim' }
    }
  }
  use 'hoob3rt/lualine.nvim'
  use 'folke/trouble.nvim'
  use 'folke/which-key.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  use 'danilamihailov/beacon.nvim'
  use 'famiu/bufdelete.nvim'
  use 'glepnir/dashboard-nvim'
  use "AckslD/nvim-neoclip.lua"
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Helper
  use 'b3nj5m1n/kommentary'
  use 'windwp/nvim-autopairs'
  use 'karb94/neoscroll.nvim'
  use 'Pocco81/AutoSave.nvim'
  use 'akinsho/nvim-toggleterm.lua'
  use 'tpope/vim-surround'
  use 'romgrk/nvim-treesitter-context'
  use 'APZelos/blamer.nvim'

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
end)
