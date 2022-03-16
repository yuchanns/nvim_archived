local fn = vim.fn
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'
  -- LSP and friends
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'RRethy/vim-illuminate'},
      { 'ray-x/lsp_signature.nvim' },
      { 'stevearc/aerial.nvim' },
      { 'crispgm/nvim-go' },
      { 'simrat39/rust-tools.nvim' },
      { 'rhysd/vim-go-impl' },
      { 'rust-lang/rust.vim' }
    },
    config = function() require('setup/lspconfig') end
  }
  use { 'hrsh7th/nvim-compe', config = function() require('setup/compe') end }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('setup/treesitter') end }
  use 'ray-x/lsp_signature.nvim'
  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0', config = function() require('setup/lspsaga') end }
  use 'p00f/nvim-ts-rainbow'
  use { 'folke/lsp-colors.nvim', config = function() require('setup/lsp-colors') end }
  use 'nvim-lua/lsp-status.nvim'
  use 'stevearc/aerial.nvim'
  -- Language
  use 'crispgm/nvim-go'
  use 'simrat39/rust-tools.nvim'
  use 'rhysd/vim-go-impl'
  use 'rust-lang/rust.vim'

  -- Theme
  use { 'folke/tokyonight.nvim', config = function() require('setup/tokyonight') end }

  -- UI
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', config = function() require('setup/nvim-tree') end }
  use { 'akinsho/nvim-bufferline.lua', config = function() require('setup/bufferline') end }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { "AckslD/nvim-neoclip.lua", config = function() require('setup/neoclip') end }
    },
    config = function() require('setup/telescope') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('setup/lualine') end
  }
  use { 'folke/trouble.nvim', config = function() require('setup/trouble') end }
  use { 'folke/which-key.nvim', config = function() require('setup/whichkey') end }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('setup/indent-blankline') end
  }
  use 'RRethy/vim-illuminate'
  use 'danilamihailov/beacon.nvim'
  use 'famiu/bufdelete.nvim'
  use { 'glepnir/dashboard-nvim', config = function() require('setup/dashboard') end }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('setup/diffview') end }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('setup/gitsigns') end }
  -- Debugger
  use { 'mfussenegger/nvim-dap', config = function() require('setup/dap') end }
  use { 'rcarriga/nvim-dap-ui', config = function() require('setup/dapui') end }

  -- Helper
  use 'b3nj5m1n/kommentary'
  use { 'windwp/nvim-autopairs', config = function() require('setup/autopairs') end }
  use { 'karb94/neoscroll.nvim', config = function() require('setup/neoscroll') end }
  use { 'Pocco81/AutoSave.nvim', config = function() require('setup/autosave') end }
  use { 'akinsho/nvim-toggleterm.lua', config = function() require('setup/toggleterm') end }
  use 'tpope/vim-surround'
  use { 'romgrk/nvim-treesitter-context', config = function() require('setup/treesitter-context') end }
  use { 'FotiadisM/tabset.nvim', config = function() require('setup/tabset') end }
  use { 'wakatime/vim-wakatime' }
  use { 'github/copilot.vim' }
  use { 'mg979/vim-visual-multi' }
  use { 'jghauser/mkdir.nvim', config = function() require('setup/mkdir')  end }

  -- Database
  use 'tpope/vim-dadbod'
  use { 'kristijanhusak/vim-dadbod-ui', config = function() require('setup/dadbod-ui') end }
  use 'kristijanhusak/vim-dadbod-completion'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
