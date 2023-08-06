----- plugins-setup for packer.nvim -----
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autoUpdate --
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/neodev.nvim'
  use 'folke/neoconf.nvim'
  use 'folke/flash.nvim'
  use 'kamykn/spelunker.vim'
  use 'windwp/nvim-autopairs'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvimdev/lspsaga.nvim'
  use 'CRAG666/code_runner.nvim'
  use 'akinsho/bufferline.nvim'
  use 'echasnovski/mini.comment'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'christoomey/vim-tmux-navigator'
  use 'rainbowhxch/accelerated-jk.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {'j-hui/fidget.nvim', tag = 'legacy'}

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'

  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'ellisonleao/glow.nvim', config = function() require('glow').setup() end }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('competitest').setup()
    end
  }
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
